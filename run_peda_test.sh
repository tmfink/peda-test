#!/bin/bash
#
# Compares versions of PEDA
# Runs a binary and gdb script through given versions of gdb and peda
#
# Example:
# ./test_peda.sh ./bin/bof inputs/peda_test1.gdb \
#     gdb /path/to/peda.py

if [[ $# -ne 4 ]]; then
    echo "Usage: $0 PROGRAM GDB_TEST_SCRIPT GDB_PATH PEDA_PATH"
    exit 1
fi

PROGRAM="$1"
TEST_GDB_SCRIPT="$2"
GDB1="$3"
PEDA1="$4"

function run_test {
    local gdb="$1"
    local peda="$2"

    "$gdb" -nx \
        -ex "source $peda" \
        -x "$TEST_GDB_SCRIPT" \
        "$PROGRAM"
}

set -x
run_test "$GDB1" "$PEDA1"