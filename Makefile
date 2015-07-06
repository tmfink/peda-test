SRC_DIR=src
BIN_DIR=bin

SRC = $(wildcard $(SRC_DIR)/*\.c)
BIN = $(patsubst %.c,%,$(addprefix $(BIN_DIR)/,$(notdir ${SRC})))

CFLAGS = -Wno-deprecated-declarations -fno-stack-protector

.phony: all clean

all: $(BIN)

$(BIN_DIR)/%: $(SRC_DIR)/%.c
	$(CC) $(CPPFLAGS) $(CFLAGS) $< -o $@ $(LDFLAGS)

bin/bof: src/bof.c

clean:
	rm -f $(BIN)
