#!/usr/bin/env python3
import sys
import json
import math

dis1 = float(sys.argv[1])
lat1 = float(sys.argv[2])
lon1 = float(sys.argv[3])

lines = sys.stdin
for l in lines:
    line = json.loads(l)
    lat2 = 0.0
    lon2 = 0.0
    if math.isfinite(line['lat']) and math.isfinite(line['lon']):
        lat2 = line['lat']
        lon2 = line['lon']
    else:
        continue
    dis2 = math.sqrt((lat1 - lat2) ** 2 + (lon1 - lon2) ** 2)
    if dis2 < dis1 and (math.isfinite(line['humidity']) and math.isfinite(line['temperature'])):
        if line['humidity'] < 54 and line['humidity'] > 48 and line['temperature'] < 24 and line['temperature'] > 20:
            date = line['timestamp']
            print(date)
