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
include glfw-3.1/tests/CMakeFiles/clipboard.dir/depend.make

# Include the progress variables for this target.
include glfw-3.1/tests/CMakeFiles/clipboard.dir/progress.make

# Include the compile flags for this target's objects.
include glfw-3.1/tests/CMakeFiles/clipboard.dir/flags.make

glfw-3.1/tests/CMakeFiles/clipboard.dir/clipboard.c.o: glfw-3.1/tests/CMakeFiles/clipboard.dir/flags.make
glfw-3.1/tests/CMakeFiles/clipboard.dir/clipboard.c.o: ../glfw-3.1/tests/clipboard.c
	$(CMAKE_COMMAND) -E cmake_progress_report /home/evan/Dev/CG/Lab9/lab9/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object glfw-3.1/tests/CMakeFiles/clipboard.dir/clipboard.c.o"
	cd /home/evan/Dev/CG/Lab9/lab9/build/glfw-3.1/tests && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/clipboard.dir/clipboard.c.o   -c /home/evan/Dev/CG/Lab9/lab9/glfw-3.1/tests/clipboard.c

glfw-3.1/tests/CMakeFiles/clipboard.dir/clipboard.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/clipboard.dir/clipboard.c.i"
	cd /home/evan/Dev/CG/Lab9/lab9/build/glfw-3.1/tests && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -E /home/evan/Dev/CG/Lab9/lab9/glfw-3.1/tests/clipboard.c > CMakeFiles/clipboard.dir/clipboard.c.i

glfw-3.1/tests/CMakeFiles/clipboard.dir/clipboard.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/clipboard.dir/clipboard.c.s"
	cd /home/evan/Dev/CG/Lab9/lab9/build/glfw-3.1/tests && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -S /home/evan/Dev/CG/Lab9/lab9/glfw-3.1/tests/clipboard.c -o CMakeFiles/clipboard.dir/clipboard.c.s

glfw-3.1/tests/CMakeFiles/clipboard.dir/clipboard.c.o.requires:
.PHONY : glfw-3.1/tests/CMakeFiles/clipboard.dir/clipboard.c.o.requires

glfw-3.1/tests/CMakeFiles/clipboard.dir/clipboard.c.o.provides: glfw-3.1/tests/CMakeFiles/clipboard.dir/clipboard.c.o.requires
	$(MAKE) -f glfw-3.1/tests/CMakeFiles/clipboard.dir/build.make glfw-3.1/tests/CMakeFiles/clipboard.dir/clipboard.c.o.provides.build
.PHONY : glfw-3.1/tests/CMakeFiles/clipboard.dir/clipboard.c.o.provides

glfw-3.1/tests/CMakeFiles/clipboard.dir/clipboard.c.o.provides.build: glfw-3.1/tests/CMakeFiles/clipboard.dir/clipboard.c.o

glfw-3.1/tests/CMakeFiles/clipboard.dir/__/deps/getopt.c.o: glfw-3.1/tests/CMakeFiles/clipboard.dir/flags.make
glfw-3.1/tests/CMakeFiles/clipboard.dir/__/deps/getopt.c.o: ../glfw-3.1/deps/getopt.c
	$(CMAKE_COMMAND) -E cmake_progress_report /home/evan/Dev/CG/Lab9/lab9/build/CMakeFiles $(CMAKE_PROGRESS_2)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object glfw-3.1/tests/CMakeFiles/clipboard.dir/__/deps/getopt.c.o"
	cd /home/evan/Dev/CG/Lab9/lab9/build/glfw-3.1/tests && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/clipboard.dir/__/deps/getopt.c.o   -c /home/evan/Dev/CG/Lab9/lab9/glfw-3.1/deps/getopt.c

glfw-3.1/tests/CMakeFiles/clipboard.dir/__/deps/getopt.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/clipboard.dir/__/deps/getopt.c.i"
	cd /home/evan/Dev/CG/Lab9/lab9/build/glfw-3.1/tests && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -E /home/evan/Dev/CG/Lab9/lab9/glfw-3.1/deps/getopt.c > CMakeFiles/clipboard.dir/__/deps/getopt.c.i

glfw-3.1/tests/CMakeFiles/clipboard.dir/__/deps/getopt.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/clipboard.dir/__/deps/getopt.c.s"
	cd /home/evan/Dev/CG/Lab9/lab9/build/glfw-3.1/tests && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -S /home/evan/Dev/CG/Lab9/lab9/glfw-3.1/deps/getopt.c -o CMakeFiles/clipboard.dir/__/deps/getopt.c.s

glfw-3.1/tests/CMakeFiles/clipboard.dir/__/deps/getopt.c.o.requires:
.PHONY : glfw-3.1/tests/CMakeFiles/clipboard.dir/__/deps/getopt.c.o.requires

glfw-3.1/tests/CMakeFiles/clipboard.dir/__/deps/getopt.c.o.provides: glfw-3.1/tests/CMakeFiles/clipboard.dir/__/deps/getopt.c.o.requires
	$(MAKE) -f glfw-3.1/tests/CMakeFiles/clipboard.dir/build.make glfw-3.1/tests/CMakeFiles/clipboard.dir/__/deps/getopt.c.o.provides.build
.PHONY : glfw-3.1/tests/CMakeFiles/clipboard.dir/__/deps/getopt.c.o.provides

glfw-3.1/tests/CMakeFiles/clipboard.dir/__/deps/getopt.c.o.provides.build: glfw-3.1/tests/CMakeFiles/clipboard.dir/__/deps/getopt.c.o

# Object files for target clipboard
clipboard_OBJECTS = \
"CMakeFiles/clipboard.dir/clipboard.c.o" \
"CMakeFiles/clipboard.dir/__/deps/getopt.c.o"

# External object files for target clipboard
clipboard_EXTERNAL_OBJECTS =

glfw-3.1/tests/clipboard: glfw-3.1/tests/CMakeFiles/clipboard.dir/clipboard.c.o
glfw-3.1/tests/clipboard: glfw-3.1/tests/CMakeFiles/clipboard.dir/__/deps/getopt.c.o
glfw-3.1/tests/clipboard: glfw-3.1/tests/CMakeFiles/clipboard.dir/build.make
glfw-3.1/tests/clipboard: glfw-3.1/src/libglfw3.a
glfw-3.1/tests/clipboard: /usr/lib/x86_64-linux-gnu/libX11.so
glfw-3.1/tests/clipboard: /usr/lib/x86_64-linux-gnu/librt.so
glfw-3.1/tests/clipboard: /usr/lib/x86_64-linux-gnu/libXrandr.so
glfw-3.1/tests/clipboard: /usr/lib/x86_64-linux-gnu/libXinerama.so
glfw-3.1/tests/clipboard: /usr/lib/x86_64-linux-gnu/libXi.so
glfw-3.1/tests/clipboard: /usr/lib/x86_64-linux-gnu/libXxf86vm.so
glfw-3.1/tests/clipboard: /usr/lib/x86_64-linux-gnu/librt.so
glfw-3.1/tests/clipboard: /usr/lib/x86_64-linux-gnu/libm.so
glfw-3.1/tests/clipboard: /usr/lib/x86_64-linux-gnu/libXcursor.so
glfw-3.1/tests/clipboard: /usr/lib/x86_64-linux-gnu/libGL.so
glfw-3.1/tests/clipboard: /usr/lib/x86_64-linux-gnu/libXrandr.so
glfw-3.1/tests/clipboard: /usr/lib/x86_64-linux-gnu/libXinerama.so
glfw-3.1/tests/clipboard: /usr/lib/x86_64-linux-gnu/libXi.so
glfw-3.1/tests/clipboard: /usr/lib/x86_64-linux-gnu/libXxf86vm.so
glfw-3.1/tests/clipboard: /usr/lib/x86_64-linux-gnu/libm.so
glfw-3.1/tests/clipboard: /usr/lib/x86_64-linux-gnu/libXcursor.so
glfw-3.1/tests/clipboard: /usr/lib/x86_64-linux-gnu/libGL.so
glfw-3.1/tests/clipboard: glfw-3.1/tests/CMakeFiles/clipboard.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking C executable clipboard"
	cd /home/evan/Dev/CG/Lab9/lab9/build/glfw-3.1/tests && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/clipboard.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
glfw-3.1/tests/CMakeFiles/clipboard.dir/build: glfw-3.1/tests/clipboard
.PHONY : glfw-3.1/tests/CMakeFiles/clipboard.dir/build

glfw-3.1/tests/CMakeFiles/clipboard.dir/requires: glfw-3.1/tests/CMakeFiles/clipboard.dir/clipboard.c.o.requires
glfw-3.1/tests/CMakeFiles/clipboard.dir/requires: glfw-3.1/tests/CMakeFiles/clipboard.dir/__/deps/getopt.c.o.requires
.PHONY : glfw-3.1/tests/CMakeFiles/clipboard.dir/requires

glfw-3.1/tests/CMakeFiles/clipboard.dir/clean:
	cd /home/evan/Dev/CG/Lab9/lab9/build/glfw-3.1/tests && $(CMAKE_COMMAND) -P CMakeFiles/clipboard.dir/cmake_clean.cmake
.PHONY : glfw-3.1/tests/CMakeFiles/clipboard.dir/clean

glfw-3.1/tests/CMakeFiles/clipboard.dir/depend:
	cd /home/evan/Dev/CG/Lab9/lab9/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/evan/Dev/CG/Lab9/lab9 /home/evan/Dev/CG/Lab9/lab9/glfw-3.1/tests /home/evan/Dev/CG/Lab9/lab9/build /home/evan/Dev/CG/Lab9/lab9/build/glfw-3.1/tests /home/evan/Dev/CG/Lab9/lab9/build/glfw-3.1/tests/CMakeFiles/clipboard.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : glfw-3.1/tests/CMakeFiles/clipboard.dir/depend

