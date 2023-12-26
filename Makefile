CC := zig
CFLAGS :=

SRC_PATH := src

.PHONY: all run docs

all:
	@${CC} build

run:
	@${CC} build run

docs:
	@${CC} test -femit-docs ${SRC_PATH}/main.zig
