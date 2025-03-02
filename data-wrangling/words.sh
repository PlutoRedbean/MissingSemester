#!/usr/bin/env bash

# 包含至少三个 a 且不以 's 结尾的单词个数
cat /usr/share/dict/words \
| awk 'BEGIN{IGNORECASE=1} /.*a.*a.*a.*/ && !/'\''s$/ {print $0}' | wc -w

cat /usr/share/dict/words \
| awk 'BEGIN{IGNORECASE=1} /.*a.*a.*a.*/ && !/'\''s$/ {print $0}' \
| sed -E 's/.*(..$)/\1/'

# 出现频率前三的末尾两个字母
cat /usr/share/dict/words \
| awk 'BEGIN{IGNORECASE=1} /.*a.*a.*a.*/ && !/'\''s$/ {print $0}' \
| sed -E 's/.*(..$)/\1/' \
| sort | uniq -c | sort -nr \
| head -n 3

# 共存在多少种词尾两字母组合
cat /usr/share/dict/words \
| awk 'BEGIN{IGNORECASE=1} /.*a.*a.*a.*/ && !/'\''s$/ {print $0}' \
| sed -E 's/.*(..$)/\1/'\
| sort | uniq -c | sort -nr \
| wc -l

# 哪个组合从未出现过？
for i in {A..Z} {a..z}
do
    for j in {A..Z} {a..z}
    do
        echo "$i$j" >> ~/my_tmp/.all.txt
    done
done
cat /usr/share/dict/words \
| awk 'BEGIN{IGNORECASE=1} /.*a.*a.*a.*/ && !/'\''s$/ {print $0}' \
| sed -E 's/.*(..$)/\1/'\
| sort | uniq > ~/my_tmp/.exist.txt
comm -23 <(sort ~/my_tmp/.all.txt) <(sort ~/my_tmp/.exist.txt)
rm -f ~/my_tmp/.all.txt ~/my_tmp/.exist.txt
