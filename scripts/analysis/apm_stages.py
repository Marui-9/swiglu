#!/usr/bin/env python3
"""Stage boundaries and per-iteration period from swg_apm traces.

  apm_stages.py trace.csv              # full trace: s3/s4/cpu cumulative read bytes
  apm_stages.py --fast fast.csv        # SWG_TRACE_FAST trace: one cumulative counter

Full trace: W (HP2) and W_down (HP1) both read through DDRC slot S4, 10,485,760 B each,
so Stage 2a/2b ends when S4 reaches 10,485,760 B and Stage 5 is the next 10,485,760 B.
The boundaries are only as fine as the sample spacing (printed). Cycles per iteration
are the stage time over its trip count: 2,048 (8,192 rows, 4 per iteration) for
Stage 2a/2b and 1,024 (2,048 rows, K=2) for Stage 5; q4k_final's Stage 5 has K=4, so
pass --s5-iters 512 for it. Stage 5 runs to the end of the call.

Fast trace: the duty cycle is the share of sample intervals in which the counter rose,
and the rate while rising is the bytes moved in those intervals over their time.
"""
import argparse
import csv

MAT = 10_485_760  # bytes per URM matrix (W, V, W_down)


def load(path):
    with open(path) as f:
        r = csv.reader(f)
        next(r)
        return [[float(v) for v in row] for row in r]


def first(rows, col, cond):
    for row in rows:
        if cond(row[col]):
            return row[0]
    return None


def full(rows, cyc_ns, s5_iters):
    t_end = rows[-1][0]
    dt = (rows[-1][0] - rows[0][0]) / (len(rows) - 1)
    s2_start = first(rows, 2, lambda v: v > 0)
    s2_end = first(rows, 2, lambda v: v >= MAT)
    s5_start = first(rows, 2, lambda v: v > MAT)
    s5_end = first(rows, 2, lambda v: v >= 2 * MAT)
    print(f"samples {len(rows)}, mean spacing {dt:.2f} us, last sample {t_end:.1f} us")
    d2, d5 = s2_end - s2_start, t_end - s5_start
    print(f"Stage 2a/2b (S4 0 -> {MAT} B): {s2_start:.1f} -> {s2_end:.1f} us = "
          f"{d2 / 1e3:.3f} ms, S4 {MAT / d2 / 1e3:.2f} GB/s, "
          f"{d2 * 1e3 / cyc_ns / 2048:.0f} cy/iteration")
    print(f"gap (compute_gate): {(s5_start - s2_end) / 1e3:.3f} ms")
    print(f"Stage 5 (S4 > {MAT} B -> end of call): {s5_start:.1f} -> {t_end:.1f} us = "
          f"{d5 / 1e3:.3f} ms, {d5 * 1e3 / cyc_ns / s5_iters:.0f} cy/iteration; "
          f"last W_down byte at {s5_end:.1f} us, S4 {MAT / (s5_end - s5_start) / 1e3:.2f} GB/s")
    print(f"S3 at end of Stage 2: {first_val(rows, 1, s2_end)} B; "
          f"CPU (S1+S2) during call: {rows[-1][3]:.0f} B")


def first_val(rows, col, t):
    for row in rows:
        if row[0] >= t:
            return int(row[col])
    return None


def fast(rows, t0, t1):
    rows = [r for r in rows if t0 <= r[0] <= t1]
    busy_t = busy_b = 0.0
    for prev, cur in zip(rows, rows[1:]):
        if cur[1] > prev[1]:
            busy_t += cur[0] - prev[0]
            busy_b += cur[1] - prev[1]
    span = rows[-1][0] - rows[0][0]
    print(f"window {rows[0][0]:.0f}-{rows[-1][0]:.0f} us, {len(rows)} samples "
          f"({span / (len(rows) - 1):.2f} us apart): counter rising {100 * busy_t / span:.0f}% "
          f"of the time, {busy_b / busy_t / 1e3:.2f} GB/s while rising, "
          f"{(rows[-1][1] - rows[0][1]) / span / 1e3:.2f} GB/s average")


ap = argparse.ArgumentParser()
ap.add_argument("trace")
ap.add_argument("--fast", action="store_true")
ap.add_argument("--t0", type=float, default=0)
ap.add_argument("--t1", type=float, default=1e9)
ap.add_argument("--clk-ns", type=float, default=4.0, help="PL clock period")
ap.add_argument("--s5-iters", type=int, default=1024, help="Stage 5 trip count")
a = ap.parse_args()
rows = load(a.trace)
if a.fast:
    fast(rows, a.t0, a.t1)
else:
    full(rows, a.clk_ns, a.s5_iters)
