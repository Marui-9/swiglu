#!/usr/bin/env python3
"""Summarize cosim dataflow profiling (cosim.enable_dataflow_profiling=true).

  df_profile.py <comp>/hls/sim/verilog

Process N is named by `assign process_intf_N.ap_start = ...` in dataflow_monitor.sv.
statusN.csv: line 2 = simulation end, lines 3-5 = interval min/avg/max, lines 6-8 =
latency min/avg/max (cycles), line 13 = "start,end;start,end;..." per execution.
"""
import re, sys, os
d = sys.argv[1]
names = {}
for line in open(os.path.join(d, "dataflow_monitor.sv")):
    m = re.search(r"assign process_intf_(\d+)\.ap_start = AESL_inst_\w+\.(\S+)\.ap_start;", line)
    if m:
        names[int(m.group(1))] = m.group(2)
for n in sorted(names):
    p = os.path.join(d, f"status{n}.csv")
    if not os.path.exists(p):
        continue
    L = open(p).read().split("\n")
    pairs = [tuple(int(x) for x in s.split(",")) for s in L[12].split(";") if s]
    first = " ".join(f"{s}-{e}" for s, e in pairs[:3])
    print(f"{names[n]:<72} n={len(pairs):<5} interval {L[3]:>6}  latency {L[6]:>6}  first: {first}")
