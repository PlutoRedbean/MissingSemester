#!/redbean/bin/env bash

find . -mtime -1 | xargs -d '\n' ls -t 
