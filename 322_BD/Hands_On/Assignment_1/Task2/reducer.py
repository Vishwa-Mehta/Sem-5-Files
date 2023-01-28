#!/usr/bin/env python3
import sys 

query_dates = {}
total_count = 0
for line in sys.stdin:
    date = line.strip()
    if date not in query_dates.keys():
        query_dates[date] = 1
    else:
        query_dates[date] += 1

for i in sorted(query_dates):
    print(i, query_dates[i])
