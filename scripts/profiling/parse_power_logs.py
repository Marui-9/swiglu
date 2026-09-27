#!/usr/bin/env python3
"""
Parse KV260 power logs (xmutil xlnx_platformstats -p) and optional llama-bench logs.

Example:
  python3 scripts/parse_power_logs.py \
      --power-cpu power_cpu.log --power-accel power_accel.log \
      --bench-cpu bench_cpu.log --bench-accel bench_accel.log
"""

from __future__ import annotations

import argparse
import re
import statistics
from dataclasses import dataclass
from pathlib import Path
from typing import List, Optional, Tuple


POWER_RE = re.compile(r"SOM total power\s*:\s*([0-9]+(?:\.[0-9]+)?)\s*mW", re.IGNORECASE)
CURRENT_RE = re.compile(r"SOM total current\s*:\s*([0-9]+(?:\.[0-9]+)?)\s*mA", re.IGNORECASE)
VOLTAGE_RE = re.compile(r"SOM total voltage\s*:\s*([0-9]+(?:\.[0-9]+)?)\s*mV", re.IGNORECASE)
LPD_TEMP_RE = re.compile(r"LPD temperature measurement\s*:\s*([0-9]+(?:\.[0-9]+)?)\s*C", re.IGNORECASE)
FPD_TEMP_RE = re.compile(r"FPD temperature measurement(?:\s*\(REMOTE\))?\s*:\s*([0-9]+(?:\.[0-9]+)?)\s*C", re.IGNORECASE)
PL_TEMP_RE = re.compile(r"PL temperature\s*:\s*([0-9]+(?:\.[0-9]+)?)\s*C", re.IGNORECASE)
TPS_RE = re.compile(r"([0-9]+(?:\.[0-9]+)?)\s*(?:t/s|tok/s|tokens/s)", re.IGNORECASE)


@dataclass
class Stats:
    n: int
    mean: float
    stdev: float
    min: float
    max: float


@dataclass
class PowerSummary:
    power: Stats
    current: Optional[Stats]
    voltage: Optional[Stats]
    lpd_temp: Optional[Stats]
    fpd_temp: Optional[Stats]
    pl_temp: Optional[Stats]
    duration_s: float
    energy_j: float


def compute_stats(values: List[float]) -> Stats:
    if not values:
        raise ValueError("No values found")
    return Stats(
        n=len(values),
        mean=statistics.fmean(values),
        stdev=statistics.pstdev(values) if len(values) > 1 else 0.0,
        min=min(values),
        max=max(values),
    )


def _parse_power_samples_with_timestamps(text: str) -> Tuple[List[float], List[int]]:
    p_vals: List[float] = []
    p_ts: List[int] = []
    current_ts: Optional[int] = None

    for raw in text.splitlines():
        line = raw.strip()
        if not line:
            continue
        if line.isdigit():
            try:
                current_ts = int(line)
            except ValueError:
                current_ts = None
            continue
        m = POWER_RE.search(line)
        if m:
            p_vals.append(float(m.group(1)))
            if current_ts is not None:
                p_ts.append(current_ts)
            else:
                p_ts.append(-1)
    return p_vals, p_ts


def _duration_and_energy_from_samples(power_mw: List[float], ts: List[int], sample_period_s: float) -> Tuple[float, float]:
    # Prefer true timestamps when available on all power samples.
    if ts and all(t >= 0 for t in ts) and len(ts) == len(power_mw) and len(ts) >= 2:
        duration_s = float(ts[-1] - ts[0])
        # Trapezoidal integration over timestamp intervals.
        energy_j = 0.0
        for i in range(len(power_mw) - 1):
            dt = float(ts[i + 1] - ts[i])
            if dt < 0:
                continue
            pw = ((power_mw[i] + power_mw[i + 1]) * 0.5) / 1000.0
            energy_j += pw * dt
        return duration_s, energy_j

    # Fallback: assume fixed sample period.
    duration_s = max(0.0, (len(power_mw) - 1) * sample_period_s)
    mean_w = statistics.fmean(power_mw) / 1000.0
    energy_j = mean_w * duration_s
    return duration_s, energy_j


def parse_power_log(path: Path, sample_period_s: float = 1.0) -> PowerSummary:
    text = path.read_text(encoding="utf-8", errors="ignore")

    p, p_ts = _parse_power_samples_with_timestamps(text)
    c = [float(m.group(1)) for m in CURRENT_RE.finditer(text)]
    v = [float(m.group(1)) for m in VOLTAGE_RE.finditer(text)]
    lpd = [float(m.group(1)) for m in LPD_TEMP_RE.finditer(text)]
    fpd = [float(m.group(1)) for m in FPD_TEMP_RE.finditer(text)]
    pl = [float(m.group(1)) for m in PL_TEMP_RE.finditer(text)]

    if not p:
        raise ValueError(f"No 'SOM total power' samples found in {path}")

    duration_s, energy_j = _duration_and_energy_from_samples(p, p_ts, sample_period_s)

    return PowerSummary(
        power=compute_stats(p),
        current=compute_stats(c) if c else None,
        voltage=compute_stats(v) if v else None,
        lpd_temp=compute_stats(lpd) if lpd else None,
        fpd_temp=compute_stats(fpd) if fpd else None,
        pl_temp=compute_stats(pl) if pl else None,
        duration_s=duration_s,
        energy_j=energy_j,
    )


def parse_tps(path: Path, mode: str = "last") -> float:
    text = path.read_text(encoding="utf-8", errors="ignore")
    vals = [float(m.group(1)) for m in TPS_RE.finditer(text)]
    if not vals:
        raise ValueError(f"No throughput token found in {path} (expected t/s or tok/s)")

    if mode == "last":
        return vals[-1]
    if mode == "max":
        return max(vals)
    if mode == "mean":
        return statistics.fmean(vals)
    raise ValueError(f"Unknown tps mode: {mode}")


def parse_tps_optional(text: str, mode: str = "last") -> Optional[float]:
    vals = [float(m.group(1)) for m in TPS_RE.finditer(text)]
    if not vals:
        return None
    if mode == "last":
        return vals[-1]
    if mode == "max":
        return max(vals)
    if mode == "mean":
        return statistics.fmean(vals)
    return None


def parse_power_log_optional(path: Path, sample_period_s: float = 1.0) -> Optional[PowerSummary]:
    text = path.read_text(encoding="utf-8", errors="ignore")
    p, p_ts = _parse_power_samples_with_timestamps(text)
    if not p:
        return None
    c = [float(m.group(1)) for m in CURRENT_RE.finditer(text)]
    v = [float(m.group(1)) for m in VOLTAGE_RE.finditer(text)]
    lpd = [float(m.group(1)) for m in LPD_TEMP_RE.finditer(text)]
    fpd = [float(m.group(1)) for m in FPD_TEMP_RE.finditer(text)]
    pl = [float(m.group(1)) for m in PL_TEMP_RE.finditer(text)]
    duration_s, energy_j = _duration_and_energy_from_samples(p, p_ts, sample_period_s)
    return PowerSummary(
        power=compute_stats(p),
        current=compute_stats(c) if c else None,
        voltage=compute_stats(v) if v else None,
        lpd_temp=compute_stats(lpd) if lpd else None,
        fpd_temp=compute_stats(fpd) if fpd else None,
        pl_temp=compute_stats(pl) if pl else None,
        duration_s=duration_s,
        energy_j=energy_j,
    )


def fmt_stats(name: str, s: Stats, unit: str) -> str:
    return (
        f"{name}: mean={s.mean:.2f}{unit}, stdev={s.stdev:.2f}{unit}, "
        f"min={s.min:.2f}{unit}, max={s.max:.2f}{unit}, n={s.n}"
    )


def report_one(label: str, p: PowerSummary, tps: Optional[float]) -> None:
    print(f"\n[{label}]")
    print(fmt_stats("Power", p.power, " mW"))
    print(f"Average power: {p.power.mean / 1000.0:.4f} W")
    print(f"Duration: {p.duration_s:.2f} s")
    print(f"Total energy: {p.energy_j:.4f} J  ({p.energy_j / 3600.0:.6f} Wh)")
    if p.current:
        print(fmt_stats("Current", p.current, " mA"))
    if p.voltage:
        print(fmt_stats("Voltage", p.voltage, " mV"))
    if p.lpd_temp:
        print(fmt_stats("LPD temp", p.lpd_temp, " C"))
    if p.fpd_temp:
        print(fmt_stats("FPD temp", p.fpd_temp, " C"))
    if p.pl_temp:
        print(fmt_stats("PL temp", p.pl_temp, " C"))

    if tps is not None:
        j_per_token = (p.power.mean / 1000.0) / tps
        tokens_est = tps * p.duration_s
        print(f"Throughput: {tps:.4f} t/s")
        print(f"Estimated tokens in window: {tokens_est:.2f}")
        print(f"Energy: {j_per_token:.6f} J/token  ({1.0 / j_per_token:.2f} token/J)")


def main() -> None:
    ap = argparse.ArgumentParser(description="Parse KV260 power and bench logs.")
    ap.add_argument("logs", type=Path, nargs="*", help="One or more .log files to parse directly")
    ap.add_argument("--power-cpu", type=Path, help="CPU-only power log")
    ap.add_argument("--power-accel", type=Path, help="Accelerator power log")
    ap.add_argument("--bench-cpu", type=Path, help="CPU-only bench log")
    ap.add_argument("--bench-accel", type=Path, help="Accelerator bench log")
    ap.add_argument(
        "--tps-mode",
        choices=("last", "max", "mean"),
        default="last",
        help="How to select throughput if multiple t/s values appear in bench log",
    )
    ap.add_argument(
        "--sample-period",
        type=float,
        default=1.0,
        help="Fallback sample period in seconds if power log has no timestamps (default: 1.0)",
    )
    args = ap.parse_args()

    # Simple mode: parse each provided .log and report all metrics found in it.
    if args.logs:
        for p in args.logs:
            if not p.exists():
                print(f"\n[{p}]")
                print("Missing file.")
                continue

            text = p.read_text(encoding="utf-8", errors="ignore")
            ps = parse_power_log_optional(p, args.sample_period)
            tps = parse_tps_optional(text, args.tps_mode)

            print(f"\n[{p}]")
            if ps:
                print(fmt_stats("Power", ps.power, " mW"))
                print(f"Average power: {ps.power.mean / 1000.0:.4f} W")
                print(f"Duration: {ps.duration_s:.2f} s")
                print(f"Total energy: {ps.energy_j:.4f} J  ({ps.energy_j / 3600.0:.6f} Wh)")
                if ps.current:
                    print(fmt_stats("Current", ps.current, " mA"))
                if ps.voltage:
                    print(fmt_stats("Voltage", ps.voltage, " mV"))
                if ps.lpd_temp:
                    print(fmt_stats("LPD temp", ps.lpd_temp, " C"))
                if ps.fpd_temp:
                    print(fmt_stats("FPD temp", ps.fpd_temp, " C"))
                if ps.pl_temp:
                    print(fmt_stats("PL temp", ps.pl_temp, " C"))
            else:
                print("Power metrics: not found.")

            if tps is not None:
                print(f"Throughput: {tps:.4f} t/s")
                if ps:
                    j_per_token = (ps.power.mean / 1000.0) / tps
                    tokens_est = tps * ps.duration_s
                    print(f"Estimated tokens in window: {tokens_est:.2f}")
                    print(f"Energy: {j_per_token:.6f} J/token  ({1.0 / j_per_token:.2f} token/J)")
            else:
                print("Bench throughput: not found.")
        return

    if not any((args.power_cpu, args.power_accel, args.bench_cpu, args.bench_accel)):
        ap.print_help()
        print("\nError: provide at least one log file argument.", flush=True)
        raise SystemExit(2)

    cpu_power = parse_power_log(args.power_cpu, args.sample_period) if args.power_cpu else None
    acc_power = parse_power_log(args.power_accel, args.sample_period) if args.power_accel else None
    cpu_tps = parse_tps(args.bench_cpu, args.tps_mode) if args.bench_cpu else None
    acc_tps = parse_tps(args.bench_accel, args.tps_mode) if args.bench_accel else None

    if cpu_power:
        report_one("CPU", cpu_power, cpu_tps)
    if acc_power:
        report_one("ACCEL", acc_power, acc_tps)

    if cpu_power and acc_power:
        print("\n[DELTA ACCEL - CPU]")
        d_mw = acc_power.power.mean - cpu_power.power.mean
        pct = (d_mw / cpu_power.power.mean) * 100.0 if cpu_power.power.mean else 0.0
        print(f"Power delta: {d_mw:+.2f} mW ({pct:+.2f}%)")

        if cpu_tps is not None and acc_tps is not None:
            cpu_j = (cpu_power.power.mean / 1000.0) / cpu_tps
            acc_j = (acc_power.power.mean / 1000.0) / acc_tps
            d_j = acc_j - cpu_j
            pct_j = (d_j / cpu_j) * 100.0 if cpu_j else 0.0
            print(f"Energy/token delta: {d_j:+.6f} J/token ({pct_j:+.2f}%)")


if __name__ == "__main__":
    main()
