#!/usr/bin/env python3
"""
Plot raw throughput (tokens/s) vs thread count from the summary CSV.

Input CSV example:
  scripts/results/power_summary_T1_T4.csv
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
    # data[(phase, mode)] -> list[(thread, throughput)]
    data = defaultdict(list)
    with csv_path.open("r", encoding="utf-8", newline="") as f:
        reader = csv.DictReader(f)
        required = {"threads", "mode", "phase", "throughput_tokens_per_s"}
        missing = required - set(reader.fieldnames or [])
        if missing:
            raise ValueError(f"Missing CSV columns: {sorted(missing)}")

        for r in reader:
            thread = thread_to_int(r["threads"])
            mode = r["mode"].strip().upper()
            phase = r["phase"].strip().capitalize()
            tps = float(r["throughput_tokens_per_s"])
            data[(phase, mode)].append((thread, tps))

    for k in data:
        data[k].sort(key=lambda x: x[0])
    return data


def plot(data, output_path: Path, title: str):
    styles = {
        ("Prefill", "CPU"): {"color": "#1f77b4", "linestyle": "-", "marker": "o"},
        ("Prefill", "FPGA"): {"color": "#d62728", "linestyle": "-", "marker": "o"},
        ("Decode", "CPU"): {"color": "#1f77b4", "linestyle": "--", "marker": "s"},
        ("Decode", "FPGA"): {"color": "#d62728", "linestyle": "--", "marker": "s"},
    }

    fig, ax = plt.subplots(figsize=(9, 4.8))

    draw_order = [
        ("Prefill", "CPU"),
        ("Prefill", "FPGA"),
        ("Decode", "CPU"),
        ("Decode", "FPGA"),
    ]

    for key in draw_order:
        vals = data.get(key)
        if not vals:
            continue
        threads = [v[0] for v in vals]
        tps = [v[1] for v in vals]
        style = styles.get(key, {"linestyle": "-", "marker": "o"})
        label = f"{key[0]} {key[1]}"
        ax.plot(threads, tps, label=label, **style)

    ax.set_title(title)
    ax.set_xlabel("Threads")
    ax.set_ylabel("Throughput (tokens/s)")
    ax.grid(True, alpha=0.3)
    ax.legend(loc="best", frameon=False)

    output_path.parent.mkdir(parents=True, exist_ok=True)
    fig.tight_layout()
    fig.savefig(output_path, dpi=200, bbox_inches="tight")
    print(f"Saved plot: {output_path}")


def main():
    ap = argparse.ArgumentParser(description="Plot raw throughput vs thread count.")
    ap.add_argument(
        "--input",
        type=Path,
        default=Path("scripts/results/power_summary_T1_T4.csv"),
        help="Input CSV path",
    )
    ap.add_argument(
        "--output",
        type=Path,
        default=Path("scripts/results/power_summary_T1_T4_raw_perf.png"),
        help="Output PNG path",
    )
    ap.add_argument(
        "--title",
        type=str,
        default="Raw throughput across thread counts",
        help="Figure title",
    )
    args = ap.parse_args()

    data = load_series(args.input)
    plot(data, args.output, args.title)


if __name__ == "__main__":
    main()
