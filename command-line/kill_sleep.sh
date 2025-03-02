#! /usr/bin/env bash
pgrep -af '.*sleep.*' | awk '/^sleep |10000$/ {print "'\''" $2 " " $3 "'\''"}' | xargs pkill -f
