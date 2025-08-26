tests := $(shell find  ${test_dir} -type f -name "*.cpp")
tests_objs:=$(patsubst %,${build_dir}/%.o,${tests})

TESTCFLAGS:=-g -Wall -Werror 
TESTCXX:= g++
TESTCFLAGS+= -I./test
TESTCFLAGS+= -I./include
TESTLDFLAGS:= -L /usr/lib/
TESTLDFLAGS+= -L ./build/library
TESTLDLIBS:=-Wl,--rpath=${build_dir}/${library}
TESTLDLIBS+=-lgtest_main -lgtest -lcalculator

$(info ${tests_objs})

ifeq (1,$(shell test -f ${build_dir}/${library}/libcalculator.so && echo 1))
test: ${tests_objs} 
	${TESTCXX} ${TESTCFLAGS} $< -o $(patsubst %.cpp.o,%.out,${tests_objs}) ${TESTLDFLAGS} ${TESTLDLIBS}

${build_dir}/%.cpp.o:%.cpp 
	mkdir -p ${@D}
	${TESTCXX} ${TESTCFLAGS} -o $@ -c $<
else
$(info Not loaded calculator library run make test-library)
endif


