archive := archive

test-archive: ${build_dir}/${archive}/libcalculator.a
	$(CC) -I./include  ${src_dir}/main.c -L ${build_dir}/${archive} \
		-o ${build_dir}/main_1 -lcalculator

${build_dir}/${archive}/libcalculator.a: ${build_dir}/${archive}/my_math.o
	mkdir -p ${@D}
	ar -rc $@ $<

${build_dir}/${archive}/my_math.o: ${src_dir}/my_math.c
	mkdir -p ${@D}
	$(CC)  -I./include -g -Wall -Werror -std=gnu11 \
		-o $@ -c $<
