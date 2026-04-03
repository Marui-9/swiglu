#define _GNU_SOURCE
#include <errno.h>
#include <fcntl.h>
#include <inttypes.h>
#include <math.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <poll.h>
#include <sys/mman.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <time.h>
#include <unistd.h>
#include <signal.h>

// Default base from your current integration; override with argv[1] if needed.
#define TESTBLOCK_IP_BASE_DEFAULT 0xA0000000ULL
#define TESTBLOCK_REG_MAP_SIZE    0x1000

#define VECTOR_DIM                2048
#define X_BYTES                   (VECTOR_DIM * sizeof(int8_t))
#define OUT_BYTES                 (VECTOR_DIM * sizeof(float))

// Full udmabuf layout used by ggml-cpu.c (SwiGLU path).
#define SWG_NUM_LAYERS            16
#define X_OFF                     0x06C50000U
#define OUT_OFF                   0x06C60000U
#define W_BASE                    0x06D00000U
#define V_BASE                    0x0FD00000U
#define WD_BASE                   0x18D00000U
#define W_STRIDE                  0x00900000U
#define V_STRIDE                  0x00900000U
#define WD_STRIDE                 0x00E00000U

// Register offsets from xtestblock_hw.h
#define REG_AP_CTRL               0x00
#define REG_GIE                   0x04
#define REG_IER                   0x08
#define REG_ISR                   0x0C
#define REG_W_LO                  0x10
#define REG_W_HI                  0x14
#define REG_V_LO                  0x1C
#define REG_V_HI                  0x20
#define REG_WD_LO                 0x28
#define REG_WD_HI                 0x2C
#define REG_X_LO                  0x34
#define REG_X_HI                  0x38
#define REG_OUT_LO                0x40
#define REG_OUT_HI                0x44
#define REG_MODE                  0x4C
#define REG_XSCALE                0x54

static volatile sig_atomic_t g_stage = 0;

static void sigbus_handler(int sig) {
    (void) sig;
    fprintf(stderr, "[SMOKE] SIGBUS at stage %d\n", (int) g_stage);
    _exit(128 + SIGBUS);
}

static int open_uio_by_addr(unsigned long target_addr, int *uio_idx) {
    for (int i = 0; i < 16; i++) {
        char path[80];
        snprintf(path, sizeof(path), "/sys/class/uio/uio%d/maps/map0/addr", i);
        FILE *f = fopen(path, "r");
        if (!f) {
            break;
        }
        unsigned long addr = 0;
        int ok = fscanf(f, "%lx", &addr);
        fclose(f);
        if (ok == 1 && addr == target_addr) {
            snprintf(path, sizeof(path), "/dev/uio%d", i);
            if (uio_idx) {
                *uio_idx = i;
            }
            return open(path, O_RDWR);
        }
    }
    return -1;
}

static int read_u64_hex_file(const char *path, uint64_t *v) {
    FILE *f = fopen(path, "r");
    if (!f) {
        return -1;
    }
    unsigned long long tmp = 0;
    int rc = fscanf(f, "%llx", &tmp);
    fclose(f);
    if (rc != 1) {
        errno = EINVAL;
        return -1;
    }
    *v = (uint64_t) tmp;
    return 0;
}

static int write_sync_file(const char *path) {
    int fd = open(path, O_WRONLY);
    if (fd < 0) {
        return -1;
    }
    ssize_t w = write(fd, "1", 1);
    close(fd);
    return (w == 1) ? 0 : -1;
}

static int udmabuf_sync_range(uint32_t offset, uint32_t size, int to_device) {
    int fd_off = open("/sys/class/u-dma-buf/udmabuf0/sync_offset", O_WRONLY);
    int fd_sz = open("/sys/class/u-dma-buf/udmabuf0/sync_size", O_WRONLY);
    if (fd_off >= 0 && fd_sz >= 0) {
        char buf[32];
        int n = snprintf(buf, sizeof(buf), "%u", offset);
        if (n > 0) {
            (void) write(fd_off, buf, (size_t) n);
        }
        n = snprintf(buf, sizeof(buf), "%u", size);
        if (n > 0) {
            (void) write(fd_sz, buf, (size_t) n);
        }
    }
    if (fd_off >= 0) close(fd_off);
    if (fd_sz >= 0) close(fd_sz);
    return write_sync_file(to_device
        ? "/sys/class/u-dma-buf/udmabuf0/sync_for_device"
        : "/sys/class/u-dma-buf/udmabuf0/sync_for_cpu");
}

static inline void mmio_write32(volatile uint32_t *regs, uint32_t off, uint32_t v) {
    regs[off / 4] = v;
}

static inline uint32_t mmio_read32(volatile uint32_t *regs, uint32_t off) {
    return regs[off / 4];
}

static inline uint32_t f32_to_u32(float x) {
    union {
        float f;
        uint32_t u;
    } t;
    t.f = x;
    return t.u;
}

int main(int argc, char **argv) {
    signal(SIGBUS, sigbus_handler);

    uint64_t ip_base = TESTBLOCK_IP_BASE_DEFAULT;
    int layer_id = 0;
    uint32_t mode = 0;
    if (argc >= 2) {
        ip_base = strtoull(argv[1], NULL, 0);
    }
    if (argc >= 3) {
        layer_id = atoi(argv[2]);
    }
    if (argc >= 4) {
        mode = (uint32_t) strtoul(argv[3], NULL, 0);
    }
    if (layer_id < 0 || layer_id >= SWG_NUM_LAYERS) {
        fprintf(stderr, "[SMOKE] invalid layer_id %d (expected 0..%d)\n", layer_id, SWG_NUM_LAYERS - 1);
        return 2;
    }

    int memfd = -1, ubfd = -1, uiofd = -1, uio_idx = -1;
    volatile uint32_t *regs = NULL;
    uint8_t *ubuf = NULL;
    uint64_t ub_phys = 0;
    off_t ub_size = 0;
    int rc = 1;

    printf("[SMOKE] testblock base = 0x%016" PRIx64 ", layer=%d, mode=%u\n", ip_base, layer_id, mode);

    g_stage = 1;
    if (read_u64_hex_file("/sys/class/u-dma-buf/udmabuf0/phys_addr", &ub_phys) != 0) {
        perror("[SMOKE] read udmabuf phys_addr");
        goto out;
    }
    printf("[SMOKE] udmabuf phys base = 0x%016" PRIx64 "\n", ub_phys);

    g_stage = 2;
    ubfd = open("/dev/udmabuf0", O_RDWR | O_SYNC);
    if (ubfd < 0) {
        perror("[SMOKE] open /dev/udmabuf0");
        goto out;
    }

    g_stage = 3;
    ub_size = lseek(ubfd, 0, SEEK_END);
    if (ub_size <= 0) {
        perror("[SMOKE] lseek udmabuf size");
        goto out;
    }
    (void) lseek(ubfd, 0, SEEK_SET);
    printf("[SMOKE] udmabuf size = %lld bytes\n", (long long) ub_size);

    const uint32_t w_off = W_BASE + (uint32_t) layer_id * W_STRIDE;
    const uint32_t v_off = V_BASE + (uint32_t) layer_id * V_STRIDE;
    const uint32_t wd_off = WD_BASE + (uint32_t) layer_id * WD_STRIDE;

    if ((uint64_t) OUT_OFF + OUT_BYTES > (uint64_t) ub_size ||
        (uint64_t) X_OFF + X_BYTES > (uint64_t) ub_size ||
        (uint64_t) w_off >= (uint64_t) ub_size ||
        (uint64_t) v_off >= (uint64_t) ub_size ||
        (uint64_t) wd_off >= (uint64_t) ub_size) {
        fprintf(stderr, "[SMOKE] udmabuf too small for selected offsets\n");
        goto out;
    }

    g_stage = 4;
    ubuf = (uint8_t *) mmap(NULL, (size_t) ub_size, PROT_READ | PROT_WRITE, MAP_SHARED, ubfd, 0);
    if (ubuf == MAP_FAILED) {
        ubuf = NULL;
        perror("[SMOKE] mmap udmabuf");
        goto out;
    }

    g_stage = 5;
    memfd = open("/dev/mem", O_RDWR | O_SYNC);
    if (memfd < 0) {
        perror("[SMOKE] open /dev/mem");
        goto out;
    }

    g_stage = 6;
    regs = (volatile uint32_t *) mmap(NULL, TESTBLOCK_REG_MAP_SIZE, PROT_READ | PROT_WRITE, MAP_SHARED, memfd, (off_t) ip_base);
    if (regs == MAP_FAILED) {
        regs = NULL;
        perror("[SMOKE] mmap testblock regs");
        goto out;
    }

    // Replicate ggml-cpu.c UIO discovery + irq init sequence.
    g_stage = 7;
    uiofd = open_uio_by_addr((unsigned long) ip_base, &uio_idx);
    if (uiofd >= 0) {
        g_stage = 8;
        int saved_flags = fcntl(uiofd, F_GETFL, 0);
        fcntl(uiofd, F_SETFL, saved_flags | O_NONBLOCK);
        uint32_t drain = 0;
        while (read(uiofd, &drain, sizeof(drain)) > 0) {}
        g_stage = 9;
        mmio_write32(regs, REG_GIE, 1u);
        mmio_write32(regs, REG_IER, 1u);
        mmio_write32(regs, REG_ISR, 1u); // TOW clear
        while (read(uiofd, &drain, sizeof(drain)) > 0) {}
        fcntl(uiofd, F_SETFL, saved_flags);
        {
            uint32_t uio_enable = 1;
            (void) write(uiofd, &uio_enable, sizeof(uio_enable));
        }
        printf("[SMOKE] using /dev/uio%d for ap_done IRQ\n", uio_idx);
    } else {
        printf("[SMOKE] no UIO found at 0x%016" PRIx64 ", using AP_CTRL polling only\n", ip_base);
        mmio_write32(regs, REG_GIE, 1u);
        mmio_write32(regs, REG_IER, 1u);
        mmio_write32(regs, REG_ISR, 1u);
    }

    int8_t *x = (int8_t *) (ubuf + X_OFF);
    float *y = (float *) (ubuf + OUT_OFF);
    // Avoid libc memset on udmabuf mapping: some mappings are non-cacheable/device-like
    // and optimized memset paths (e.g. DC ZVA on AArch64) can raise SIGBUS.
    g_stage = 10;
    for (size_t i = 0; i < X_BYTES; ++i) {
        ((volatile uint8_t *)x)[i] = 0;
    }
    g_stage = 11;
    for (size_t i = 0; i < OUT_BYTES / sizeof(float); ++i) {
        ((volatile float *)y)[i] = 0.0f;
    }

    g_stage = 12;
    for (int i = 0; i < VECTOR_DIM; ++i) {
        int v = (i % 255) - 127;
        x[i] = (int8_t) v;
    }

    uint64_t w_phys = ub_phys + w_off;
    uint64_t v_phys = ub_phys + v_off;
    uint64_t wd_phys = ub_phys + wd_off;
    uint64_t x_phys = ub_phys + X_OFF;
    uint64_t y_phys = ub_phys + OUT_OFF;

    // Push x region only (same style as ggml-cpu.c targeted sync).
    g_stage = 13;
    (void) udmabuf_sync_range(X_OFF, X_BYTES, 1);

    // Program full swiglu-style address registers.
    g_stage = 14;
    mmio_write32(regs, REG_W_LO, (uint32_t) (w_phys & 0xFFFFFFFFu));
    mmio_write32(regs, REG_W_HI, (uint32_t) (w_phys >> 32));
    mmio_write32(regs, REG_V_LO, (uint32_t) (v_phys & 0xFFFFFFFFu));
    mmio_write32(regs, REG_V_HI, (uint32_t) (v_phys >> 32));
    mmio_write32(regs, REG_WD_LO, (uint32_t) (wd_phys & 0xFFFFFFFFu));
    mmio_write32(regs, REG_WD_HI, (uint32_t) (wd_phys >> 32));

    mmio_write32(regs, REG_X_LO, (uint32_t) (x_phys & 0xFFFFFFFFu));
    mmio_write32(regs, REG_X_HI, (uint32_t) (x_phys >> 32));
    mmio_write32(regs, REG_OUT_LO, (uint32_t) (y_phys & 0xFFFFFFFFu));
    mmio_write32(regs, REG_OUT_HI, (uint32_t) (y_phys >> 32));

    mmio_write32(regs, REG_MODE, mode);
    mmio_write32(regs, REG_XSCALE, f32_to_u32(1.0f));

    g_stage = 15;
    uint32_t ap_before = mmio_read32(regs, REG_AP_CTRL);
    printf("[SMOKE] AP_CTRL before start = 0x%08" PRIx32 "\n", ap_before);

    g_stage = 16;
    mmio_write32(regs, REG_AP_CTRL, 1u); // ap_start

    uint32_t ap = 0;
    if (uiofd >= 0) {
        g_stage = 17;
        struct pollfd pfd;
        pfd.fd = uiofd;
        pfd.events = POLLIN;
        int pr = poll(&pfd, 1, 7000);
        if (pr > 0) {
            uint32_t irq_count = 0;
            (void) read(uiofd, &irq_count, sizeof(irq_count));
            g_stage = 18;
            ap = mmio_read32(regs, REG_AP_CTRL);
            mmio_write32(regs, REG_ISR, 1u); // clear ap_done TOW
            {
                uint32_t uio_enable = 1;
                (void) write(uiofd, &uio_enable, sizeof(uio_enable));
            }
        } else {
            fprintf(stderr, "[SMOKE] UIO poll timeout (%d), fallback to AP_CTRL poll\n", pr);
            int tmo = 7000;
            g_stage = 19;
            while (tmo-- > 0 && (mmio_read32(regs, REG_AP_CTRL) & 0x2u) == 0) {
                usleep(1000);
            }
            ap = mmio_read32(regs, REG_AP_CTRL);
            if ((ap & 0x2u) == 0) {
                fprintf(stderr, "[SMOKE] TIMEOUT waiting ap_done, AP_CTRL=0x%08" PRIx32 "\n", ap);
                goto out;
            }
            mmio_write32(regs, REG_ISR, 1u);
        }
    } else {
        int tmo = 7000;
        g_stage = 20;
        while (tmo-- > 0 && (mmio_read32(regs, REG_AP_CTRL) & 0x2u) == 0) {
            usleep(1000);
        }
        ap = mmio_read32(regs, REG_AP_CTRL);
        if ((ap & 0x2u) == 0) {
            fprintf(stderr, "[SMOKE] TIMEOUT waiting ap_done, AP_CTRL=0x%08" PRIx32 "\n", ap);
            goto out;
        }
        mmio_write32(regs, REG_ISR, 1u);
    }

    printf("[SMOKE] AP_CTRL after done  = 0x%08" PRIx32 "\n", ap);
    printf("[SMOKE] ISR                 = 0x%08" PRIx32 "\n", mmio_read32(regs, REG_ISR));

    g_stage = 21;
    (void) udmabuf_sync_range(OUT_OFF, OUT_BYTES, 0);

    int mism = 0;
    g_stage = 22;
    for (int i = 0; i < VECTOR_DIM; ++i) {
        float ref = (float) x[i];
        float got = y[i];
        if (fabsf(ref - got) > 0.01f) {
            if (mism < 8) {
                printf("[SMOKE] mismatch i=%d ref=%f got=%f\n", i, ref, got);
            }
            mism++;
        }
    }

    for (int i = 0; i < 8; ++i) {
        printf("[SMOKE] y[%d]=%f (x=%d)\n", i, y[i], (int) x[i]);
    }

    if (mism == 0) {
        printf("[SMOKE] PASS\n");
        rc = 0;
    } else {
        printf("[SMOKE] FAIL mismatches=%d\n", mism);
        rc = 2;
    }

out:
    if (regs) {
        munmap((void *) regs, TESTBLOCK_REG_MAP_SIZE);
    }
    if (memfd >= 0) {
        close(memfd);
    }
    if (ubuf) {
        munmap(ubuf, (size_t) ub_size);
    }
    if (ubfd >= 0) {
        close(ubfd);
    }
    if (uiofd >= 0) {
        close(uiofd);
    }
    return rc;
}
