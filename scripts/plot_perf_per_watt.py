#!/usr/bin/env python3
"""
Plot only performance-per-watt vs thread count from power_summary_T1_T4.csv.

Uses averaged throughput across Prefill+Decode for each (threads, mode):
  avg_tps = (prefill_tps + decode_tps) / 2
  perf/W  = avg_tps / power_w
"""

from __future__ import annotations

import argparse
import csv
from collections import defaultdict
from pathlib import Path

import matplotlib.pyplot as plt


def thread_to_int(thread_label: str) -> int:
    s = thread_label.strip().upper()
    if s.startswith("T"):
        s = s[1:]
    return int(s)


def load_series(csv_path: Path):
    required = {"threads", "mode", "phase", "throughput_tokens_per_s", "power_w"}
    by_tm = defaultdict(lambda: {"throughputs": [], "power_vals": []})

    with csv_path.open("r", encoding="utf-8", newline="") as f:
        reader = csv.DictReader(f)
        missing = required - set(reader.fieldnames or [])
        if missing:
            raise ValueError(f"Missing CSV columns: {sorted(missing)}")

        for r in reader:
            key = (thread_to_int(r["threads"]), r["mode"].strip().upper())
            by_tm[key]["throughputs"].append(float(r["throughput_tokens_per_s"]))
            by_tm[key]["power_vals"].append(float(r["power_w"]))

    data = defaultdict(list)  # data[mode] -> [(thread, perf_w)]
    for (thread, mode), agg in by_tm.items():
        avg_tps = sum(agg["throughputs"]) / len(agg["throughputs"])
        p = sum(agg["power_vals"]) / len(agg["power_vals"])
        perf_w = avg_tps / p
        data[mode].append((thread, perf_w))

    for mode in data:
        data[mode].sort(key=lambda x: x[0])
    return data


def plot(data, output_path: Path, title: str):
    mode_label = {
        "CPU": "CPU Only",
        "FPGA": "FPGA+CPU",
    }

    styles = {
        "CPU": {"color": "#1f77b4", "linestyle": "-", "marker": "o"},
        "FPGA": {"color": "#d62728", "linestyle": "-", "marker": "o"},
    }

    fig, ax = plt.subplots(figsize=(7.5, 4.5))
    all_threads = set()
    for mode in ("CPU", "FPGA"):
        vals = data.get(mode, [])
        if not vals:
            continue
        threads = [v[0] for v in vals]
        perf_w = [v[1] for v in vals]
        all_threads.update(threads)
        ax.plot(threads, perf_w, label=mode_label.get(mode, mode), **styles[mode])

    ax.set_title(title)
    ax.set_xlabel("Threads")
    ax.set_ylabel("Performance per watt (tokens/s/W)")
    if all_threads:
        ax.set_xticks(sorted(all_threads))
    ax.grid(True, alpha=0.3)
    ax.legend(frameon=False, loc="best")

    output_path.parent.mkdir(parents=True, exist_ok=True)
    fig.tight_layout()
    fig.savefig(output_path, dpi=200, bbox_inches="tight")
    print(f"Saved plot: {output_path}")


def main():
    ap = argparse.ArgumentParser(description="Plot performance-per-watt vs thread count.")
    ap.add_argument(
        "--input",
        type=Path,
        default=Path("scripts/results/power_summary_T1_T4.csv"),
        help="Input CSV path",
    )
    ap.add_argument(
        "--output",
        type=Path,
        default=Path("scripts/results/power_summary_T1_T4_perf_w.png"),
        help="Output PNG path",
    )
    ap.add_argument(
        "--title",
        type=str,
        default="Performance per watt across thread counts",
        help="Figure title",
    )
    args = ap.parse_args()

    data = load_series(args.input)
    plot(data, args.output, args.title)


if __name__ == "__main__":
    main()
