#!/bin/bash
(while true; do
  date +%s
  xmutil xlnx_platformstats -p | grep -E "SOM total power|LPD temperature measurement|FPD temperature measurement|PL temperature"
  sleep 1
done) | tee power_accel.log
