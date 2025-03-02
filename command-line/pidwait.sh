#!/usr/bin/env bash

pidwait() {
    if [[ ! "$1" =~ ^[0-9]+$ ]]; then
        echo "Invalid pid!" >&2
    else
        if (kill -0 "$1"); then
            while (kill -0 "$1")
            do
                sleep 1
            done
            echo "Process end!"
        else
            echo "No such pid!" >&2
        fi
    fi
}
