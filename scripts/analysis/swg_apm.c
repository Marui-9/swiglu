// swg_apm.c — run the SwiGLU IP standalone and trace DDR traffic per port with the
// ZynqMP DDR AXI performance monitor (APM @ 0xFD0B0000, slots 0-5 = DDRC ports 0-5).
//
// Port map (UG1085, DDR memory controller): S3 = HP0 (+DP), S4 = HP1 + HP2,
// S1/S2 = CCI (APU). The IP uses HP0 (V, x, out), HP2 (W) and HP1 (W_down), so
// Stage 2a/2b traffic is S3+S4 and Stage 5 traffic is S4 alone.
//
// The IP's schedule has fixed trip counts, so timing does not depend on the data in
// the layer slot. Run with the bitstream loaded and udmabuf0 inserted:
//   sudo ./swg_apm [calls] [layer] [trace.csv]
// Without trace.csv it only times the calls (start -> ap_idle) and prints per-port
// bytes and mean read latency per call.

#include <fcntl.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <time.h>
#include <unistd.h>

#define SWIGLU_IP_BASE 0xA0000000UL
#define APM_BASE       0xFD0B0000UL

#define SWG_VEC_OFF       0x00000000U
#define SWG_OUT_OFF       0x00010000U
#define SWG_LAYER_BASE    0x01000000U
#define SWG_LAYER_STRIDE  0x01E00000U

// APM registers (Xilinx xaxipmon_hw.h)
#define APM_GCC_LO  0x0004
#define APM_MSR0    0x0044
#define APM_MC(n)   (0x0100 + (n) * 0x10)
#define APM_CTL     0x0300
#define APM_CR_MCNTR_EN   0x00000001
#define APM_CR_MCNTR_RST  0x00000002
#define APM_CR_GCC_EN     0x00010000
#define APM_CR_GCC_RST    0x00020000

enum { M_WR_TXN = 0, M_RD_TXN = 1, M_WR_BYTES = 2, M_RD_BYTES = 3, M_RD_LAT = 5 };

// Counter n -> (slot, metric)
static const int cnt_slot[10]   = { 3, 4, 3, 4, 3, 4, 1, 2, 3, 0 };
static const int cnt_metric[10] = { M_RD_BYTES, M_RD_BYTES, M_RD_TXN, M_RD_TXN,
                                    M_RD_LAT, M_RD_LAT, M_RD_BYTES, M_RD_BYTES,
                                    M_WR_BYTES, M_RD_BYTES };
static const char *cnt_name[10] = { "S3_rd_bytes", "S4_rd_bytes", "S3_rd_txn", "S4_rd_txn",
                                    "S3_rd_lat", "S4_rd_lat", "S1_rd_bytes", "S2_rd_bytes",
                                    "S3_wr_bytes", "S0_rd_bytes" };

static volatile uint32_t *ip, *apm;

static double now_us(void) {
    struct timespec t;
    clock_gettime(CLOCK_MONOTONIC, &t);
    return t.tv_sec * 1e6 + t.tv_nsec / 1e3;
}

static void *map_phys(int fd, unsigned long base, size_t size) {
    void *p = mmap(NULL, size, PROT_READ | PROT_WRITE, MAP_SHARED, fd, base);
    if (p == MAP_FAILED) { perror("mmap"); exit(1); }
    return p;
}

static void apm_setup(void) {
    for (int r = 0; r < 3; r++) {
        uint32_t v = 0;
        for (int b = 0; b < 4 && r * 4 + b < 10; b++) {
            int n = r * 4 + b;
            v |= (uint32_t)((cnt_slot[n] << 5) | cnt_metric[n]) << (8 * b);
        }
        apm[(APM_MSR0 + 4 * r) / 4] = v;
    }
}

static void apm_reset_start(void) {
    apm[APM_CTL / 4] = APM_CR_MCNTR_RST | APM_CR_GCC_RST;
    apm[APM_CTL / 4] = 0;
    apm[APM_CTL / 4] = APM_CR_MCNTR_EN | APM_CR_GCC_EN;
}

typedef struct { float t_us; uint32_t s3, s4, cpu; } sample_t;

int main(int argc, char **argv) {
    int calls = argc > 1 ? atoi(argv[1]) : 20;
    int layer = argc > 2 ? atoi(argv[2]) : 0;
    const char *trace = argc > 3 ? argv[3] : NULL;

    unsigned long long phys = 0;
    FILE *f = fopen("/sys/class/u-dma-buf/udmabuf0/phys_addr", "r");
    if (!f || fscanf(f, "%llx", &phys) != 1) { fprintf(stderr, "udmabuf0 missing\n"); return 1; }
    fclose(f);

    int mem = open("/dev/mem", O_RDWR | O_SYNC);
    if (mem < 0) { perror("/dev/mem"); return 1; }
    ip  = map_phys(mem, SWIGLU_IP_BASE, 0x10000);
    apm = map_phys(mem, APM_BASE, 0x10000);

    if ((ip[0] & 0x4) == 0) { fprintf(stderr, "IP not idle (AP_CTRL=0x%x)\n", ip[0]); return 1; }

    uint64_t W  = phys + SWG_LAYER_BASE + (uint64_t)layer * SWG_LAYER_STRIDE;
    uint64_t V  = W + 0x00A00000U, Wd = W + 0x01400000U;
    // Experiments: SWG_V_AT_W=1 points V at W (both projections stream the same
    // bytes); SWG_V_SLOT=n takes V from layer slot n instead.
    if (getenv("SWG_V_AT_W")) V = W;
    if (getenv("SWG_V_SLOT"))
        V = phys + SWG_LAYER_BASE + (uint64_t)atoi(getenv("SWG_V_SLOT")) * SWG_LAYER_STRIDE + 0x00A00000U;
    uint64_t X  = phys + SWG_VEC_OFF, O = phys + SWG_OUT_OFF;
    ip[0x10/4] = (uint32_t)W;  ip[0x14/4] = (uint32_t)(W >> 32);
    ip[0x1C/4] = (uint32_t)V;  ip[0x20/4] = (uint32_t)(V >> 32);
    ip[0x28/4] = (uint32_t)Wd; ip[0x2C/4] = (uint32_t)(Wd >> 32);
    ip[0x34/4] = (uint32_t)X;  ip[0x38/4] = (uint32_t)(X >> 32);
    ip[0x40/4] = (uint32_t)O;  ip[0x44/4] = (uint32_t)(O >> 32);
    ip[0x4C/4] = 0;
    float xs = 1.0f / 127; uint32_t xsb; memcpy(&xsb, &xs, 4);
    ip[0x54/4] = xsb;
    ip[0x04/4] = 0;            // GIE off: this tool polls ap_idle, no UIO interrupt

    apm_setup();

    size_t max_s = 400000;
    sample_t *tr = trace ? malloc(max_s * sizeof(sample_t)) : NULL;
    size_t ns = 0;
    int fast = getenv("SWG_TRACE_FAST") != NULL;
    int fast_cnt = fast ? atoi(getenv("SWG_TRACE_FAST")) : 0;

    double sum = 0, mn = 1e9, mx = 0;
    uint64_t tot[10] = {0};
    uint64_t gcc_tot = 0;
    for (int c = 0; c < calls; c++) {
        apm_reset_start();
        double t0 = now_us();
        ip[0] = 0x1;                          // ap_start
        while (ip[0] & 0x4) {}                // wait for ap_idle to drop
        if (tr && c == calls - 1) {           // trace the last call only
            while (!(ip[0] & 0x4) && ns < max_s) {
                tr[ns].t_us = (float)(now_us() - t0);
                if (fast) {                   // SWG_TRACE_FAST=n: one counter, ~3x denser
                    tr[ns].s3 = apm[APM_MC(fast_cnt) / 4]; tr[ns].s4 = tr[ns].cpu = 0;
                } else {
                    tr[ns].s3  = apm[APM_MC(0) / 4];
                    tr[ns].s4  = apm[APM_MC(1) / 4];
                    tr[ns].cpu = apm[APM_MC(6) / 4] + apm[APM_MC(7) / 4];
                }
                ns++;
            }
        }
        while (!(ip[0] & 0x4)) {}
        double dt = now_us() - t0;
        apm[APM_CTL / 4] = 0;                 // freeze counters
        (void)ip[0];                          // clear ap_done (COR)
        for (int n = 0; n < 10; n++) tot[n] += apm[APM_MC(n) / 4];
        if (c == 0) continue;                 // first call: cold, excluded
        gcc_tot += apm[APM_GCC_LO / 4];
        sum += dt; if (dt < mn) mn = dt; if (dt > mx) mx = dt;
    }
    int nc = calls - 1;
    printf("calls=%d layer=%d  time/call: mean %.1f us  min %.1f  max %.1f\n",
           nc, layer, sum / nc, mn, mx);
    printf("APM global clock: %.2f cycles/us\n", gcc_tot / sum);
    for (int n = 0; n < 10; n++)
        printf("  %-12s %14.0f per call\n", cnt_name[n], (double)tot[n] / calls);
    if (tot[2]) printf("  S3 mean rd latency %.1f APM cy/txn, bytes/txn %.0f\n",
                       (double)tot[4] / tot[2], (double)tot[0] / tot[2]);
    if (tot[3]) printf("  S4 mean rd latency %.1f APM cy/txn, bytes/txn %.0f\n",
                       (double)tot[5] / tot[3], (double)tot[1] / tot[3]);

    if (tr) {
        FILE *o = fopen(trace, "w");
        fprintf(o, "t_us,s3_rd_bytes,s4_rd_bytes,cpu_rd_bytes\n");
        for (size_t i = 0; i < ns; i++)
            fprintf(o, "%.2f,%u,%u,%u\n", tr[i].t_us, tr[i].s3, tr[i].s4, tr[i].cpu);
        fclose(o);
        printf("trace: %zu samples -> %s\n", ns, trace);
    }
    return 0;
}
