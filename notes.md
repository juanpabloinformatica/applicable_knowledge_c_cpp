
# Goal
- Review everything I have seen so far about                       []  [0]
- Create a c project with good folder structure					   [X] [1]
- Compile project with makefile                                    [X]  [2]
- Create executable with main                                      [X]  [3]
- Create archive with calculator to be used by others              [X]  [4]
- Create shared libray of calculator to be used by others		   [X]  [5]
- Add unit-testing with gtest                                      []  [6]
- Create a tdd approach											   []  [7]

## Steps
### [3]
  - For this I am doing the following
- I need to know what are the source files of the projects (*.c)
  Because in those files are the actual implementation of the code
  - I need to know where are the (*.h) files because the preprocessor 
  Needs to know where to find the *.h files in order to been able
  to edit the source files (*.c) and ("copy paste the code from the ")
  *.h files
  - As I need only an executable ("build/calculator") in this case
  I need to create that executable, that will depend on the *.o generated
  by the gcc compiler those *.o files are going to be linked by the gcc
  linker tool and will then generate the executable.
  - For those *.o files, each one of them needs the respective .c file in order
  to get the .o file. For that is used the makefile with pattern-matching rules
  because what will happen is that for each ${objs} that is a prerequisite of 
  the target, as it doesn't exist the first time, the target referencing that object
  will be called, this object will need the *c , but has to be the .c that matches the 
  .o filename

  - For that there is the other target, pattern maatching is used in order to build
  all those objects if a build dir and not populate too much the src folder dir.
  - The all target is more a convenction, basically when make command is called, then
  all target will be called as it has a prerequisite ${build_dir}/${target},  
  it will math one rule, then if the file doesn't exist that rule will be triggered
  in this case that rule check for each ${objs} and see which one has to be compiled
  finally when all of the *.c has been compiled the recipe for building the target
  is executed.

### [4]

  - For this I did the following
  - I need to know first which source file was going to need the calculator
  - in this case was the main file.
  - So as I wanted to create an archive (*.o) files that are in charge of an specific
task. (calculator object + operations)
  - So the process is the following I create a PHONY target that can be called 
    anytime ("test-archive"), I used explicit rules for avoiding conflicts with
    existing ones, this target have as prerequisite the archive libcalculator.a

  - As the prerequisite (file doesn't exist) a target that match with the prerequisite
    is triggered (most-explicit match is entered) in this case there is a target
    ${build_dir}/${archive}/libcalculator.a is explicit so it will go inside this rule
    as the archive is a set of .o files, and this static library will have a functionalitie
    a calculator, all of that is found in my_math.c, so in this case only 
    my_math.c is needed but, as we are using a my_math.h as interface and also 
    needed for the file that will call our calculator, we need to compile the 
    my_math.c file telling the compiler where is going to be the includes needed
    in this case my_math.h is in ${workdir}/include so finally the command will be

    - Getting .o for the my_math.o

      gcc <gcc_flags> -I${workdir}/include  -c ${workdir}/${src}/my_math.c -o \
      ${workdir}/${src}/my_math.o

    - Getting the libcalculator.a from the math.o
      ar -rc ${workdir}/${build_dir}/${archive}/libcalculator.a  ${workdir}/${src}/my_math.o 
      
    - Getting the main with the static library included 

    gcc -g -Wall -Werror -std=gnu11 -I${workdir}/include \ 
             ${workdir}/src/my_math.c -L ${workdir}/${build_dir}/${archive} \
             -o ${workdir}/${build_dir}/main_archive.o -lcalculator




    










