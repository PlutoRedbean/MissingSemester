#!/usr/bin/env bash
curl https://ysyx.oscc.cc/docs/2407/#%E6%95%99%E5%AD%A6%E8%B5%84%E6%BA%90 \
| pup 'table#schedule-table' > ~/my_tmp/.table.txt

cat ~/my_tmp/.table.txt | sed -E 's/(\s*)(.*)/\2/' > ~/my_tmp/.table.bak
mv ~/my_tmp/.table.bak ~/my_tmp/.table.txt

cat ~/my_tmp/.table.txt | awk '{
    if ($0 ~ /<tr class="Stage-.".*>$/) {
        tr_state = 1
    }
    if ($0 ~ /<\/tr>/ && tr_state == 1) {
        print "</tr>"
        tr_state = 0
    }
    if (tr_state == 1) {
        print $0
    }
}' | awk '{
    if ($0 ~ /<tr class="Stage-.".*>$/) {
        match($0, /<tr class="Stage-(.)".*>$/, next_stage)
        if (next_stage[1] != this_stage) {
            this_stage = next_stage[1];
            printf "\n\n" next_stage[1] "阶段\n\n"
        } else {
            print "\n"
        }
    }
    if ($0 ~ /<td (task|data).*>$/) {
        td_state = 1
    }
    if ($0 ~ /<\/td>/) {
        td_state = 0
    }
    if (td_state == 1 && $0 !~ /^<|>$/) {
        printf $0 " "
    }
}'
