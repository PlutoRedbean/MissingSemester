#!/usr/bin/env bash

journalctl -b --no-page > ~/my_tmp/.journal0.txt
cat ~/my_tmp/.journal0.txt \
| sed -E 's/^[A-Za-z]{3} [0-9]{2} [0-9]{2}:[0-9]{2}:[0-9]{2}\s*(.*)/\1/' \
> ~/my_tmp/.journal0.bak
mv ~/my_tmp/.journal0.bak ~/my_tmp/.journal0.txt

journalctl -b -1 --no-page > ~/my_tmp/.journal-1.txt
cat ~/my_tmp/.journal-1.txt \
| sed -E 's/^[A-Za-z]{3} [0-9]{2} [0-9]{2}:[0-9]{2}:[0-9]{2}\s*(.*)/\1/' \
> ~/my_tmp/.journal-1.bak
mv ~/my_tmp/.journal-1.bak ~/my_tmp/.journal-1.txt

journalctl -b -2 --no-page > ~/my_tmp/.journal-2.txt
cat ~/my_tmp/.journal-2.txt \
| sed -E 's/^[A-Za-z]{3} [0-9]{2} [0-9]{2}:[0-9]{2}:[0-9]{2}\s*(.*)/\1/' \
> ~/my_tmp/.journal-2.bak
mv ~/my_tmp/.journal-2.bak ~/my_tmp/.journal-2.txt

touch ~/my_tmp/.all_in_one.txt
cat ~/my_tmp/.journal0.txt > ~/my_tmp/.all_in_one.txt
cat ~/my_tmp/.journal-1.txt >> ~/my_tmp/.all_in_one.txt
cat ~/my_tmp/.journal-2.txt >> ~/my_tmp/.all_in_one.txt
cat ~/my_tmp/.all_in_one.txt | sort | uniq -c | sort -n | sed -E '/\s*3.*/d'

rm -f ~/my_tmp/.all_in_one.txt ~/my_tmp/.journal0.txt ~/my_tmp/.journal-1.txt ~/my_tmp/.journal-2.txt
