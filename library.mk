library := library

test-library: ${build_dir}/${library}/libcalculator.so 
	gcc -g -Wall -Werror -std=gnu11 -I./include \
		-L ${build_dir}/${library}  ${src_dir}/main.c -o ${build_dir}/main_shared -Wl,--rpath=${build_dir}/${library} -lcalculator 

# # ${build_dir}/${library}/libcalculator.so: ${build_dir}/${library}/my_math.o
# # 	gcc -g -Wall -Werror -std=gnu11 -fPIC -shared -o $@ -c $<
#

${build_dir}/${library}/libcalculator.so: ${src_dir}/my_math.c
	mkdir -p ${@D}
	gcc -g -Wall -Werror -std=gnu11 -I./include \
		-fPIC -shared \
		-o $@ -c $<


