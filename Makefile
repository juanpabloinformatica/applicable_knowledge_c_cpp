.PHONY: all clean format test-archive test-library test

CFLAGS := -g -Wall -Werror -std=gnu11
CC := gcc

target := calculator
workdir:= $(shell git rev-parse --show-toplevel)
build_dir := build
src_dir := src
inc_dir := include
test_dir:= test

srcs := $(shell find ${src_dir} -type f -name "*.c")
objs := $(patsubst %,${build_dir}/%.o,${srcs} )
includes := $(shell find  ${inc_dir} -type f -name "*.h" )
dependencies:= $(patsubst %,${build_dir}/%.d,${srcs} )

CFLAGS += $(addprefix -I,${inc_dir})
CFLAGS += -MMD -MP


DFLAGS+=-DDEBUG

all: ${build_dir}/${target}

${build_dir}/${target}: ${objs}
	$(CC) $^ -o $@

${build_dir}/%.o: %
	mkdir -p ${@D}
	$(CC) $(DFLAGS) $(CFLAGS)  -c $< -o $@

include custom.mk
include archive.mk
include library.mk
include test.mk

-include ${dependencies}

clean:
	rm -rf ${build_dir}
	find . -type f -name "*.o" -delete


