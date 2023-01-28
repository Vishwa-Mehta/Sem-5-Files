#!/usr/bin/env python3
import sys
import json

lines = sys.stdin
for line in lines:
    line = json.loads(line)
    if line['location'] < 2500 and line['location'] > 1700 and line['sensor_id'] < 5000 and line['pressure'] >= 93500.00 and line['humidity'] >= 72.00 and line['temperature'] >= 12.00:
        date = line['timestamp']
        print(date)
