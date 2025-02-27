#!/usr/bin/env bash

run_times=0

bash test.sh >> stdout.txt 2>> stderr.txt
run_status=$?
run_times=$((run_times + 1))

while [[ $run_status == 0 ]]
do
    bash test.sh >> stdout.txt 2>> stderr.txt
    run_status=$?
    run_times=$((run_times + 1))
done

echo "$run_times"
