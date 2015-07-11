#!/bin/bash
#
# Compares versions of PEDA
# Runs a binary and gdb script through given versions of gdb and peda
#
# Example:
# ./test_peda.sh ./bin/bof inputs/peda_test1.gdb \
#     gdb /path/to/peda.py

if [[ $# < 4 ]]; then
    cat << EOF
Usage: $0 PROGRAM GDB_TEST_SCRIPT \\
    GDB_PATH PEDA_PATH \\
    [EXTRA_GDB_ARGS ...]
EOF
    exit 1
fi

function check_files_exist {
    for arg in "$@"; do
        if [[ ! -e "$arg" ]]; then
            echo "File $arg does not exists!"
            exit 1
        fi
    done
}

PROGRAM="$1"
TEST_GDB_SCRIPT="$2"
GDB1="$3"
PEDA1="$4"

EXTRA_ARGS=${@:5}

check_files_exist "$PROGRAM" "$TEST_GDB_SCRIPT" "$PEDA1"

function run_test {
    local gdb="$1"
    local peda="$2"

    "$gdb" -nx \
        -ex "source $peda" \
        -x "$TEST_GDB_SCRIPT" \
        $EXTRA_ARGS \
        "$PROGRAM"
}

set -x
run_test "$GDB1" "$PEDA1"
