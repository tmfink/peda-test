# Testing Infrastructure for PEDA

This repo can be used to test [PEDA](https://github.com/longld/peda), the Python Exploit Development Assistance for GDB plugin.

## Relevant files

* `bin/`: compiled location for test programs
* `src/`: source for test programs
* `inputs/`: list of gdb commands used in tests (passed with the `-x` switch to `gdb`)
* `compare_pedas.sh`: BASH script used to compare versions of PEDA/GDB
* `run_peda_test.sh`: BASH script used to run PEDA under a given GDB
* `Makefile`: Makefile for building test programs. Run `make` to build.

## Usage

```sh
# Build test programs
make

# Run test with specific GDB and PEDA
./run_peda_test.sh ./bin/bof inputs/bof01.gdb gdb ~/peda/peda.py

# Compare PEDA on different versions of GDB
./compare_pedas.sh ./bin/bof ./inputs/bof01.gdb \
    /path/to/gdb1 ~/peda/peda.py \
    /path/to/gdb2 ~/peda/peda.py

# Compare different versions of PEDA on the same GDB
./compare_pedas.sh ./bin/bof ./inputs/bof01.gdb \
    gdb ~/peda-master/peda.py \
    gdb ~/peda-test/peda.py
```

## Adding Tests

To add a test, add a `*.c` file to the `src/` directory.
