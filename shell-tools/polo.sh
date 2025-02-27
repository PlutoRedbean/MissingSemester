#!/usr/bin/env bash
polo () {
    macro=$(cat ~/my_tmp/macro)
    cd "$macro" || return
}
