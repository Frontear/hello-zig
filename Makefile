CC := zig
CFLAGS :=

SRC_PATH := src

.PHONY: all build docs

all:
	@${CC} build run

build:
	@${CC} build

docs:
	@${CC} test -femit-docs ${SRC_PATH}/main.zig
