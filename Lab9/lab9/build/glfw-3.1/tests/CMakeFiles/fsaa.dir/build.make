# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.0

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list

# Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/evan/Dev/CG/Lab9/lab9

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/evan/Dev/CG/Lab9/lab9/build

# Include any dependencies generated for this target.
include glfw-3.1/tests/CMakeFiles/fsaa.dir/depend.make

# Include the progress variables for this target.
include glfw-3.1/tests/CMakeFiles/fsaa.dir/progress.make

# Include the compile flags for this target's objects.
include glfw-3.1/tests/CMakeFiles/fsaa.dir/flags.make

glfw-3.1/tests/CMakeFiles/fsaa.dir/fsaa.c.o: glfw-3.1/tests/CMakeFiles/fsaa.dir/flags.make
glfw-3.1/tests/CMakeFiles/fsaa.dir/fsaa.c.o: ../glfw-3.1/tests/fsaa.c
	$(CMAKE_COMMAND) -E cmake_progress_report /home/evan/Dev/CG/Lab9/lab9/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object glfw-3.1/tests/CMakeFiles/fsaa.dir/fsaa.c.o"
	cd /home/evan/Dev/CG/Lab9/lab9/build/glfw-3.1/tests && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/fsaa.dir/fsaa.c.o   -c /home/evan/Dev/CG/Lab9/lab9/glfw-3.1/tests/fsaa.c

glfw-3.1/tests/CMakeFiles/fsaa.dir/fsaa.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/fsaa.dir/fsaa.c.i"
	cd /home/evan/Dev/CG/Lab9/lab9/build/glfw-3.1/tests && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -E /home/evan/Dev/CG/Lab9/lab9/glfw-3.1/tests/fsaa.c > CMakeFiles/fsaa.dir/fsaa.c.i

glfw-3.1/tests/CMakeFiles/fsaa.dir/fsaa.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/fsaa.dir/fsaa.c.s"
	cd /home/evan/Dev/CG/Lab9/lab9/build/glfw-3.1/tests && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -S /home/evan/Dev/CG/Lab9/lab9/glfw-3.1/tests/fsaa.c -o CMakeFiles/fsaa.dir/fsaa.c.s

glfw-3.1/tests/CMakeFiles/fsaa.dir/fsaa.c.o.requires:
.PHONY : glfw-3.1/tests/CMakeFiles/fsaa.dir/fsaa.c.o.requires

glfw-3.1/tests/CMakeFiles/fsaa.dir/fsaa.c.o.provides: glfw-3.1/tests/CMakeFiles/fsaa.dir/fsaa.c.o.requires
	$(MAKE) -f glfw-3.1/tests/CMakeFiles/fsaa.dir/build.make glfw-3.1/tests/CMakeFiles/fsaa.dir/fsaa.c.o.provides.build
.PHONY : glfw-3.1/tests/CMakeFiles/fsaa.dir/fsaa.c.o.provides

glfw-3.1/tests/CMakeFiles/fsaa.dir/fsaa.c.o.provides.build: glfw-3.1/tests/CMakeFiles/fsaa.dir/fsaa.c.o

glfw-3.1/tests/CMakeFiles/fsaa.dir/__/deps/getopt.c.o: glfw-3.1/tests/CMakeFiles/fsaa.dir/flags.make
glfw-3.1/tests/CMakeFiles/fsaa.dir/__/deps/getopt.c.o: ../glfw-3.1/deps/getopt.c
	$(CMAKE_COMMAND) -E cmake_progress_report /home/evan/Dev/CG/Lab9/lab9/build/CMakeFiles $(CMAKE_PROGRESS_2)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object glfw-3.1/tests/CMakeFiles/fsaa.dir/__/deps/getopt.c.o"
	cd /home/evan/Dev/CG/Lab9/lab9/build/glfw-3.1/tests && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/fsaa.dir/__/deps/getopt.c.o   -c /home/evan/Dev/CG/Lab9/lab9/glfw-3.1/deps/getopt.c

glfw-3.1/tests/CMakeFiles/fsaa.dir/__/deps/getopt.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/fsaa.dir/__/deps/getopt.c.i"
	cd /home/evan/Dev/CG/Lab9/lab9/build/glfw-3.1/tests && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -E /home/evan/Dev/CG/Lab9/lab9/glfw-3.1/deps/getopt.c > CMakeFiles/fsaa.dir/__/deps/getopt.c.i

glfw-3.1/tests/CMakeFiles/fsaa.dir/__/deps/getopt.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/fsaa.dir/__/deps/getopt.c.s"
	cd /home/evan/Dev/CG/Lab9/lab9/build/glfw-3.1/tests && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -S /home/evan/Dev/CG/Lab9/lab9/glfw-3.1/deps/getopt.c -o CMakeFiles/fsaa.dir/__/deps/getopt.c.s

glfw-3.1/tests/CMakeFiles/fsaa.dir/__/deps/getopt.c.o.requires:
.PHONY : glfw-3.1/tests/CMakeFiles/fsaa.dir/__/deps/getopt.c.o.requires

glfw-3.1/tests/CMakeFiles/fsaa.dir/__/deps/getopt.c.o.provides: glfw-3.1/tests/CMakeFiles/fsaa.dir/__/deps/getopt.c.o.requires
	$(MAKE) -f glfw-3.1/tests/CMakeFiles/fsaa.dir/build.make glfw-3.1/tests/CMakeFiles/fsaa.dir/__/deps/getopt.c.o.provides.build
.PHONY : glfw-3.1/tests/CMakeFiles/fsaa.dir/__/deps/getopt.c.o.provides

glfw-3.1/tests/CMakeFiles/fsaa.dir/__/deps/getopt.c.o.provides.build: glfw-3.1/tests/CMakeFiles/fsaa.dir/__/deps/getopt.c.o

# Object files for target fsaa
fsaa_OBJECTS = \
"CMakeFiles/fsaa.dir/fsaa.c.o" \
"CMakeFiles/fsaa.dir/__/deps/getopt.c.o"

# External object files for target fsaa
fsaa_EXTERNAL_OBJECTS =

glfw-3.1/tests/fsaa: glfw-3.1/tests/CMakeFiles/fsaa.dir/fsaa.c.o
glfw-3.1/tests/fsaa: glfw-3.1/tests/CMakeFiles/fsaa.dir/__/deps/getopt.c.o
glfw-3.1/tests/fsaa: glfw-3.1/tests/CMakeFiles/fsaa.dir/build.make
glfw-3.1/tests/fsaa: glfw-3.1/src/libglfw3.a
glfw-3.1/tests/fsaa: /usr/lib/x86_64-linux-gnu/libX11.so
glfw-3.1/tests/fsaa: /usr/lib/x86_64-linux-gnu/librt.so
glfw-3.1/tests/fsaa: /usr/lib/x86_64-linux-gnu/libXrandr.so
glfw-3.1/tests/fsaa: /usr/lib/x86_64-linux-gnu/libXinerama.so
glfw-3.1/tests/fsaa: /usr/lib/x86_64-linux-gnu/libXi.so
glfw-3.1/tests/fsaa: /usr/lib/x86_64-linux-gnu/libXxf86vm.so
glfw-3.1/tests/fsaa: /usr/lib/x86_64-linux-gnu/librt.so
glfw-3.1/tests/fsaa: /usr/lib/x86_64-linux-gnu/libm.so
glfw-3.1/tests/fsaa: /usr/lib/x86_64-linux-gnu/libXcursor.so
glfw-3.1/tests/fsaa: /usr/lib/x86_64-linux-gnu/libGL.so
glfw-3.1/tests/fsaa: /usr/lib/x86_64-linux-gnu/libXrandr.so
glfw-3.1/tests/fsaa: /usr/lib/x86_64-linux-gnu/libXinerama.so
glfw-3.1/tests/fsaa: /usr/lib/x86_64-linux-gnu/libXi.so
glfw-3.1/tests/fsaa: /usr/lib/x86_64-linux-gnu/libXxf86vm.so
glfw-3.1/tests/fsaa: /usr/lib/x86_64-linux-gnu/libm.so
glfw-3.1/tests/fsaa: /usr/lib/x86_64-linux-gnu/libXcursor.so
glfw-3.1/tests/fsaa: /usr/lib/x86_64-linux-gnu/libGL.so
glfw-3.1/tests/fsaa: glfw-3.1/tests/CMakeFiles/fsaa.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking C executable fsaa"
	cd /home/evan/Dev/CG/Lab9/lab9/build/glfw-3.1/tests && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/fsaa.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
glfw-3.1/tests/CMakeFiles/fsaa.dir/build: glfw-3.1/tests/fsaa
.PHONY : glfw-3.1/tests/CMakeFiles/fsaa.dir/build

glfw-3.1/tests/CMakeFiles/fsaa.dir/requires: glfw-3.1/tests/CMakeFiles/fsaa.dir/fsaa.c.o.requires
glfw-3.1/tests/CMakeFiles/fsaa.dir/requires: glfw-3.1/tests/CMakeFiles/fsaa.dir/__/deps/getopt.c.o.requires
.PHONY : glfw-3.1/tests/CMakeFiles/fsaa.dir/requires

glfw-3.1/tests/CMakeFiles/fsaa.dir/clean:
	cd /home/evan/Dev/CG/Lab9/lab9/build/glfw-3.1/tests && $(CMAKE_COMMAND) -P CMakeFiles/fsaa.dir/cmake_clean.cmake
.PHONY : glfw-3.1/tests/CMakeFiles/fsaa.dir/clean

glfw-3.1/tests/CMakeFiles/fsaa.dir/depend:
	cd /home/evan/Dev/CG/Lab9/lab9/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/evan/Dev/CG/Lab9/lab9 /home/evan/Dev/CG/Lab9/lab9/glfw-3.1/tests /home/evan/Dev/CG/Lab9/lab9/build /home/evan/Dev/CG/Lab9/lab9/build/glfw-3.1/tests /home/evan/Dev/CG/Lab9/lab9/build/glfw-3.1/tests/CMakeFiles/fsaa.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : glfw-3.1/tests/CMakeFiles/fsaa.dir/depend

