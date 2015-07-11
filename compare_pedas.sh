#!/bin/bash
#
# Compares versions of PEDA
# Runs a binary and gdb script through given versions of gdb and peda
#
# Example:
# ./compare_peda.sh ./bin/bof inputs/peda_test1.gdb \
#     /usr/bin/gdb /path/to/peda1/peda.py \
#     /usr/local/bin/gdb /path/to/peda2/peda.py

if [[ $# -ne 6 ]]; then 
    echo "Usage: $0 PROGRAM GDB_TEST_SCRIPT GDB_PATH1 PEDA_PATH1 GDB_PATH2 PEDA_PATH2"
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

GDB2="$5"
PEDA2="$6"

check_files_exist "$PROGRAM" "$TEST_GDB_SCRIPT" "$PEDA1" "$PEDA2"

TMP_FILE1="gdb_test_1.out"
TMP_FILE2="gdb_test_2.out"

function run_test {
    local gdb="$1"
    local peda="$2"
    local tmp_file="$3"
    "$gdb" -batch -nx \
        -ex "source $peda" \
        -x "$TEST_GDB_SCRIPT" \
        "$PROGRAM" > "$tmp_file"
}

set -x
run_test "$GDB1" "$PEDA1" "$TMP_FILE1"
run_test "$GDB2" "$PEDA2" "$TMP_FILE2"
diff "$TMP_FILE1" "$TMP_FILE2"
