#!/redbean/bin/env bash

find . -mtime 0 | xargs -d '\n' ls -lt 
