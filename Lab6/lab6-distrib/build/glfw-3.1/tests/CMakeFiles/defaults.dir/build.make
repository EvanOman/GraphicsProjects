# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 2.8

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
CMAKE_SOURCE_DIR = /home/evan/Dev/CG/Lab6/lab6-distrib

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/evan/Dev/CG/Lab6/lab6-distrib/build

# Include any dependencies generated for this target.
include glfw-3.1/tests/CMakeFiles/defaults.dir/depend.make

# Include the progress variables for this target.
include glfw-3.1/tests/CMakeFiles/defaults.dir/progress.make

# Include the compile flags for this target's objects.
include glfw-3.1/tests/CMakeFiles/defaults.dir/flags.make

glfw-3.1/tests/CMakeFiles/defaults.dir/defaults.c.o: glfw-3.1/tests/CMakeFiles/defaults.dir/flags.make
glfw-3.1/tests/CMakeFiles/defaults.dir/defaults.c.o: ../glfw-3.1/tests/defaults.c
	$(CMAKE_COMMAND) -E cmake_progress_report /home/evan/Dev/CG/Lab6/lab6-distrib/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object glfw-3.1/tests/CMakeFiles/defaults.dir/defaults.c.o"
	cd /home/evan/Dev/CG/Lab6/lab6-distrib/build/glfw-3.1/tests && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/defaults.dir/defaults.c.o   -c /home/evan/Dev/CG/Lab6/lab6-distrib/glfw-3.1/tests/defaults.c

glfw-3.1/tests/CMakeFiles/defaults.dir/defaults.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/defaults.dir/defaults.c.i"
	cd /home/evan/Dev/CG/Lab6/lab6-distrib/build/glfw-3.1/tests && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -E /home/evan/Dev/CG/Lab6/lab6-distrib/glfw-3.1/tests/defaults.c > CMakeFiles/defaults.dir/defaults.c.i

glfw-3.1/tests/CMakeFiles/defaults.dir/defaults.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/defaults.dir/defaults.c.s"
	cd /home/evan/Dev/CG/Lab6/lab6-distrib/build/glfw-3.1/tests && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -S /home/evan/Dev/CG/Lab6/lab6-distrib/glfw-3.1/tests/defaults.c -o CMakeFiles/defaults.dir/defaults.c.s

glfw-3.1/tests/CMakeFiles/defaults.dir/defaults.c.o.requires:
.PHONY : glfw-3.1/tests/CMakeFiles/defaults.dir/defaults.c.o.requires

glfw-3.1/tests/CMakeFiles/defaults.dir/defaults.c.o.provides: glfw-3.1/tests/CMakeFiles/defaults.dir/defaults.c.o.requires
	$(MAKE) -f glfw-3.1/tests/CMakeFiles/defaults.dir/build.make glfw-3.1/tests/CMakeFiles/defaults.dir/defaults.c.o.provides.build
.PHONY : glfw-3.1/tests/CMakeFiles/defaults.dir/defaults.c.o.provides

glfw-3.1/tests/CMakeFiles/defaults.dir/defaults.c.o.provides.build: glfw-3.1/tests/CMakeFiles/defaults.dir/defaults.c.o

# Object files for target defaults
defaults_OBJECTS = \
"CMakeFiles/defaults.dir/defaults.c.o"

# External object files for target defaults
defaults_EXTERNAL_OBJECTS =

glfw-3.1/tests/defaults: glfw-3.1/tests/CMakeFiles/defaults.dir/defaults.c.o
glfw-3.1/tests/defaults: glfw-3.1/tests/CMakeFiles/defaults.dir/build.make
glfw-3.1/tests/defaults: glfw-3.1/src/libglfw3.a
glfw-3.1/tests/defaults: /usr/lib/x86_64-linux-gnu/libGLU.so
glfw-3.1/tests/defaults: /usr/lib/x86_64-linux-gnu/libX11.so
glfw-3.1/tests/defaults: /usr/lib/x86_64-linux-gnu/librt.so
glfw-3.1/tests/defaults: /usr/lib/x86_64-linux-gnu/libXrandr.so
glfw-3.1/tests/defaults: /usr/lib/x86_64-linux-gnu/libXinerama.so
glfw-3.1/tests/defaults: /usr/lib/x86_64-linux-gnu/libXi.so
glfw-3.1/tests/defaults: /usr/lib/x86_64-linux-gnu/libXxf86vm.so
glfw-3.1/tests/defaults: /usr/lib/x86_64-linux-gnu/librt.so
glfw-3.1/tests/defaults: /usr/lib/x86_64-linux-gnu/libm.so
glfw-3.1/tests/defaults: /usr/lib/x86_64-linux-gnu/libXcursor.so
glfw-3.1/tests/defaults: /usr/lib/x86_64-linux-gnu/libGL.so
glfw-3.1/tests/defaults: /usr/lib/x86_64-linux-gnu/libXrandr.so
glfw-3.1/tests/defaults: /usr/lib/x86_64-linux-gnu/libXinerama.so
glfw-3.1/tests/defaults: /usr/lib/x86_64-linux-gnu/libXi.so
glfw-3.1/tests/defaults: /usr/lib/x86_64-linux-gnu/libXxf86vm.so
glfw-3.1/tests/defaults: /usr/lib/x86_64-linux-gnu/libm.so
glfw-3.1/tests/defaults: /usr/lib/x86_64-linux-gnu/libXcursor.so
glfw-3.1/tests/defaults: /usr/lib/x86_64-linux-gnu/libGL.so
glfw-3.1/tests/defaults: glfw-3.1/tests/CMakeFiles/defaults.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking C executable defaults"
	cd /home/evan/Dev/CG/Lab6/lab6-distrib/build/glfw-3.1/tests && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/defaults.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
glfw-3.1/tests/CMakeFiles/defaults.dir/build: glfw-3.1/tests/defaults
.PHONY : glfw-3.1/tests/CMakeFiles/defaults.dir/build

glfw-3.1/tests/CMakeFiles/defaults.dir/requires: glfw-3.1/tests/CMakeFiles/defaults.dir/defaults.c.o.requires
.PHONY : glfw-3.1/tests/CMakeFiles/defaults.dir/requires

glfw-3.1/tests/CMakeFiles/defaults.dir/clean:
	cd /home/evan/Dev/CG/Lab6/lab6-distrib/build/glfw-3.1/tests && $(CMAKE_COMMAND) -P CMakeFiles/defaults.dir/cmake_clean.cmake
.PHONY : glfw-3.1/tests/CMakeFiles/defaults.dir/clean

glfw-3.1/tests/CMakeFiles/defaults.dir/depend:
	cd /home/evan/Dev/CG/Lab6/lab6-distrib/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/evan/Dev/CG/Lab6/lab6-distrib /home/evan/Dev/CG/Lab6/lab6-distrib/glfw-3.1/tests /home/evan/Dev/CG/Lab6/lab6-distrib/build /home/evan/Dev/CG/Lab6/lab6-distrib/build/glfw-3.1/tests /home/evan/Dev/CG/Lab6/lab6-distrib/build/glfw-3.1/tests/CMakeFiles/defaults.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : glfw-3.1/tests/CMakeFiles/defaults.dir/depend

