#!/usr/bin/env bash

journalctl --no-pager \
| awk '/.*Startup finished in.*= ([0-9]*.?[0-9]*)s./ {
    match($0, /.*Startup finished in.*= ([0-9]*.?[0-9]*)s./, time)
    print time[1]
}' | tail -n 10 | sort -n > ~/my_tmp/.startup_time.txt

cat ~/my_tmp/.startup_time.txt | awk '{
    sum += $0
    if (NR == 5 || NR == 6) {
        mid += $0
    }
    if (NR == 10){
        print "median: " (mid / 2)
        print "average: " (sum / NR)
        print "longest: " $0
    }
}'
rm -f ~/my_tmp/.startup_time.txt
