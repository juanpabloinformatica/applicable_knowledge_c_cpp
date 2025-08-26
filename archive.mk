$(info in archive)
LDFLAGS := -L ${build_dir}/${archive}
LDLIBS := -lcalculator
archive := archive
lib_name := libcalculator.a

libfile := $(addprefix ${build_dir}/${archive}/,${lib_name})

test-archive: ${libfile}
	$(CC) -I./include  ${src_dir}/main.c ${LDFLAGS} \
		-o ${build_dir}/main_archive ${LDLIBS}

${libfile}: $(filter %my_math.c.o,${objs})
	mkdir -p ${@D}
	ar -rc $@ $<

$(filter %my_math.c.o,${objs}): ${src_dir}/my_math.c
	mkdir -p ${@D}
	$(CC) $(CFLAGS) -o $@ -c $<