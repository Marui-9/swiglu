// csim writes /work/golden.bin; cosim (same tb, RTL in place of x1top) compares to it.
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <cstdint>
#define ROWS 128
void x1top(const uint8_t *W, const uint8_t *V, const int8_t *x_batch, int16_t *out, float x_scale);

int main() {
    static uint8_t W[ROWS * 1280], V[ROWS * 1280];
    static int8_t x[2048];
    static int16_t out[2 * ROWS], gold[2 * ROWS];
    srand(1);
    for (int i = 0; i < ROWS * 1280; i++) { W[i] = rand(); V[i] = rand(); }
    for (int r = 0; r < ROWS; r++)
        for (int b = 0; b < 8; b++) {
            uint8_t *h = (r * 1280 + b * 32) + W, *g = (r * 1280 + b * 32) + V;
            h[0] = 0x00; h[1] = 0x0C; h[2] = 0x00; h[3] = 0x0C;   // d, dmin 2^-12
            g[0] = 0x00; g[1] = 0x0A; g[2] = 0x00; g[3] = 0x08;
        }
    for (int i = 0; i < 2048; i++) x[i] = (rand() % 255) - 127;
    x1top(W, V, x, out, 1.0f / 127);
    FILE *f = fopen("/work/golden.bin", "rb");
    if (!f) {
        f = fopen("/work/golden.bin", "wb"); fwrite(out, sizeof out, 1, f); fclose(f);
        int nz = 0; for (int i = 0; i < 2 * ROWS; i++) nz += out[i] != 0;
        int sat = 0; for (int i = 0; i < 2 * ROWS; i++) sat += out[i] == 32767 || out[i] == -32767;
        printf("golden written, %d/%d nonzero, %d saturated, out[0..3] %d %d %d %d\n", nz, 2 * ROWS, sat,
               out[0], out[1], out[ROWS], out[ROWS + 1]);
        return 0;
    }
    fread(gold, sizeof gold, 1, f); fclose(f);
    int bad = 0; for (int i = 0; i < 2 * ROWS; i++) bad += out[i] != gold[i];
    printf("compare vs golden: %d mismatches of %d\n", bad, 2 * ROWS);
    return bad != 0;
}
