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
CMAKE_SOURCE_DIR = /home/evan/Dev/CG/Assig3/hw3

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/evan/Dev/CG/Assig3/hw3/build

# Include any dependencies generated for this target.
include glfw-3.1/src/CMakeFiles/glfw.dir/depend.make

# Include the progress variables for this target.
include glfw-3.1/src/CMakeFiles/glfw.dir/progress.make

# Include the compile flags for this target's objects.
include glfw-3.1/src/CMakeFiles/glfw.dir/flags.make

glfw-3.1/src/CMakeFiles/glfw.dir/context.c.o: glfw-3.1/src/CMakeFiles/glfw.dir/flags.make
glfw-3.1/src/CMakeFiles/glfw.dir/context.c.o: ../glfw-3.1/src/context.c
	$(CMAKE_COMMAND) -E cmake_progress_report /home/evan/Dev/CG/Assig3/hw3/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object glfw-3.1/src/CMakeFiles/glfw.dir/context.c.o"
	cd /home/evan/Dev/CG/Assig3/hw3/build/glfw-3.1/src && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/glfw.dir/context.c.o   -c /home/evan/Dev/CG/Assig3/hw3/glfw-3.1/src/context.c

glfw-3.1/src/CMakeFiles/glfw.dir/context.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/glfw.dir/context.c.i"
	cd /home/evan/Dev/CG/Assig3/hw3/build/glfw-3.1/src && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -E /home/evan/Dev/CG/Assig3/hw3/glfw-3.1/src/context.c > CMakeFiles/glfw.dir/context.c.i

glfw-3.1/src/CMakeFiles/glfw.dir/context.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/glfw.dir/context.c.s"
	cd /home/evan/Dev/CG/Assig3/hw3/build/glfw-3.1/src && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -S /home/evan/Dev/CG/Assig3/hw3/glfw-3.1/src/context.c -o CMakeFiles/glfw.dir/context.c.s

glfw-3.1/src/CMakeFiles/glfw.dir/context.c.o.requires:
.PHONY : glfw-3.1/src/CMakeFiles/glfw.dir/context.c.o.requires

glfw-3.1/src/CMakeFiles/glfw.dir/context.c.o.provides: glfw-3.1/src/CMakeFiles/glfw.dir/context.c.o.requires
	$(MAKE) -f glfw-3.1/src/CMakeFiles/glfw.dir/build.make glfw-3.1/src/CMakeFiles/glfw.dir/context.c.o.provides.build
.PHONY : glfw-3.1/src/CMakeFiles/glfw.dir/context.c.o.provides

glfw-3.1/src/CMakeFiles/glfw.dir/context.c.o.provides.build: glfw-3.1/src/CMakeFiles/glfw.dir/context.c.o

glfw-3.1/src/CMakeFiles/glfw.dir/init.c.o: glfw-3.1/src/CMakeFiles/glfw.dir/flags.make
glfw-3.1/src/CMakeFiles/glfw.dir/init.c.o: ../glfw-3.1/src/init.c
	$(CMAKE_COMMAND) -E cmake_progress_report /home/evan/Dev/CG/Assig3/hw3/build/CMakeFiles $(CMAKE_PROGRESS_2)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object glfw-3.1/src/CMakeFiles/glfw.dir/init.c.o"
	cd /home/evan/Dev/CG/Assig3/hw3/build/glfw-3.1/src && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/glfw.dir/init.c.o   -c /home/evan/Dev/CG/Assig3/hw3/glfw-3.1/src/init.c

glfw-3.1/src/CMakeFiles/glfw.dir/init.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/glfw.dir/init.c.i"
	cd /home/evan/Dev/CG/Assig3/hw3/build/glfw-3.1/src && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -E /home/evan/Dev/CG/Assig3/hw3/glfw-3.1/src/init.c > CMakeFiles/glfw.dir/init.c.i

glfw-3.1/src/CMakeFiles/glfw.dir/init.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/glfw.dir/init.c.s"
	cd /home/evan/Dev/CG/Assig3/hw3/build/glfw-3.1/src && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -S /home/evan/Dev/CG/Assig3/hw3/glfw-3.1/src/init.c -o CMakeFiles/glfw.dir/init.c.s

glfw-3.1/src/CMakeFiles/glfw.dir/init.c.o.requires:
.PHONY : glfw-3.1/src/CMakeFiles/glfw.dir/init.c.o.requires

glfw-3.1/src/CMakeFiles/glfw.dir/init.c.o.provides: glfw-3.1/src/CMakeFiles/glfw.dir/init.c.o.requires
	$(MAKE) -f glfw-3.1/src/CMakeFiles/glfw.dir/build.make glfw-3.1/src/CMakeFiles/glfw.dir/init.c.o.provides.build
.PHONY : glfw-3.1/src/CMakeFiles/glfw.dir/init.c.o.provides

glfw-3.1/src/CMakeFiles/glfw.dir/init.c.o.provides.build: glfw-3.1/src/CMakeFiles/glfw.dir/init.c.o

glfw-3.1/src/CMakeFiles/glfw.dir/input.c.o: glfw-3.1/src/CMakeFiles/glfw.dir/flags.make
glfw-3.1/src/CMakeFiles/glfw.dir/input.c.o: ../glfw-3.1/src/input.c
	$(CMAKE_COMMAND) -E cmake_progress_report /home/evan/Dev/CG/Assig3/hw3/build/CMakeFiles $(CMAKE_PROGRESS_3)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object glfw-3.1/src/CMakeFiles/glfw.dir/input.c.o"
	cd /home/evan/Dev/CG/Assig3/hw3/build/glfw-3.1/src && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/glfw.dir/input.c.o   -c /home/evan/Dev/CG/Assig3/hw3/glfw-3.1/src/input.c

glfw-3.1/src/CMakeFiles/glfw.dir/input.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/glfw.dir/input.c.i"
	cd /home/evan/Dev/CG/Assig3/hw3/build/glfw-3.1/src && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -E /home/evan/Dev/CG/Assig3/hw3/glfw-3.1/src/input.c > CMakeFiles/glfw.dir/input.c.i

glfw-3.1/src/CMakeFiles/glfw.dir/input.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/glfw.dir/input.c.s"
	cd /home/evan/Dev/CG/Assig3/hw3/build/glfw-3.1/src && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -S /home/evan/Dev/CG/Assig3/hw3/glfw-3.1/src/input.c -o CMakeFiles/glfw.dir/input.c.s

glfw-3.1/src/CMakeFiles/glfw.dir/input.c.o.requires:
.PHONY : glfw-3.1/src/CMakeFiles/glfw.dir/input.c.o.requires

glfw-3.1/src/CMakeFiles/glfw.dir/input.c.o.provides: glfw-3.1/src/CMakeFiles/glfw.dir/input.c.o.requires
	$(MAKE) -f glfw-3.1/src/CMakeFiles/glfw.dir/build.make glfw-3.1/src/CMakeFiles/glfw.dir/input.c.o.provides.build
.PHONY : glfw-3.1/src/CMakeFiles/glfw.dir/input.c.o.provides

glfw-3.1/src/CMakeFiles/glfw.dir/input.c.o.provides.build: glfw-3.1/src/CMakeFiles/glfw.dir/input.c.o

glfw-3.1/src/CMakeFiles/glfw.dir/monitor.c.o: glfw-3.1/src/CMakeFiles/glfw.dir/flags.make
glfw-3.1/src/CMakeFiles/glfw.dir/monitor.c.o: ../glfw-3.1/src/monitor.c
	$(CMAKE_COMMAND) -E cmake_progress_report /home/evan/Dev/CG/Assig3/hw3/build/CMakeFiles $(CMAKE_PROGRESS_4)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object glfw-3.1/src/CMakeFiles/glfw.dir/monitor.c.o"
	cd /home/evan/Dev/CG/Assig3/hw3/build/glfw-3.1/src && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/glfw.dir/monitor.c.o   -c /home/evan/Dev/CG/Assig3/hw3/glfw-3.1/src/monitor.c

glfw-3.1/src/CMakeFiles/glfw.dir/monitor.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/glfw.dir/monitor.c.i"
	cd /home/evan/Dev/CG/Assig3/hw3/build/glfw-3.1/src && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -E /home/evan/Dev/CG/Assig3/hw3/glfw-3.1/src/monitor.c > CMakeFiles/glfw.dir/monitor.c.i

glfw-3.1/src/CMakeFiles/glfw.dir/monitor.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/glfw.dir/monitor.c.s"
	cd /home/evan/Dev/CG/Assig3/hw3/build/glfw-3.1/src && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -S /home/evan/Dev/CG/Assig3/hw3/glfw-3.1/src/monitor.c -o CMakeFiles/glfw.dir/monitor.c.s

glfw-3.1/src/CMakeFiles/glfw.dir/monitor.c.o.requires:
.PHONY : glfw-3.1/src/CMakeFiles/glfw.dir/monitor.c.o.requires

glfw-3.1/src/CMakeFiles/glfw.dir/monitor.c.o.provides: glfw-3.1/src/CMakeFiles/glfw.dir/monitor.c.o.requires
	$(MAKE) -f glfw-3.1/src/CMakeFiles/glfw.dir/build.make glfw-3.1/src/CMakeFiles/glfw.dir/monitor.c.o.provides.build
.PHONY : glfw-3.1/src/CMakeFiles/glfw.dir/monitor.c.o.provides

glfw-3.1/src/CMakeFiles/glfw.dir/monitor.c.o.provides.build: glfw-3.1/src/CMakeFiles/glfw.dir/monitor.c.o

glfw-3.1/src/CMakeFiles/glfw.dir/window.c.o: glfw-3.1/src/CMakeFiles/glfw.dir/flags.make
glfw-3.1/src/CMakeFiles/glfw.dir/window.c.o: ../glfw-3.1/src/window.c
	$(CMAKE_COMMAND) -E cmake_progress_report /home/evan/Dev/CG/Assig3/hw3/build/CMakeFiles $(CMAKE_PROGRESS_5)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object glfw-3.1/src/CMakeFiles/glfw.dir/window.c.o"
	cd /home/evan/Dev/CG/Assig3/hw3/build/glfw-3.1/src && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/glfw.dir/window.c.o   -c /home/evan/Dev/CG/Assig3/hw3/glfw-3.1/src/window.c

glfw-3.1/src/CMakeFiles/glfw.dir/window.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/glfw.dir/window.c.i"
	cd /home/evan/Dev/CG/Assig3/hw3/build/glfw-3.1/src && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -E /home/evan/Dev/CG/Assig3/hw3/glfw-3.1/src/window.c > CMakeFiles/glfw.dir/window.c.i

glfw-3.1/src/CMakeFiles/glfw.dir/window.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/glfw.dir/window.c.s"
	cd /home/evan/Dev/CG/Assig3/hw3/build/glfw-3.1/src && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -S /home/evan/Dev/CG/Assig3/hw3/glfw-3.1/src/window.c -o CMakeFiles/glfw.dir/window.c.s

glfw-3.1/src/CMakeFiles/glfw.dir/window.c.o.requires:
.PHONY : glfw-3.1/src/CMakeFiles/glfw.dir/window.c.o.requires

glfw-3.1/src/CMakeFiles/glfw.dir/window.c.o.provides: glfw-3.1/src/CMakeFiles/glfw.dir/window.c.o.requires
	$(MAKE) -f glfw-3.1/src/CMakeFiles/glfw.dir/build.make glfw-3.1/src/CMakeFiles/glfw.dir/window.c.o.provides.build
.PHONY : glfw-3.1/src/CMakeFiles/glfw.dir/window.c.o.provides

glfw-3.1/src/CMakeFiles/glfw.dir/window.c.o.provides.build: glfw-3.1/src/CMakeFiles/glfw.dir/window.c.o

glfw-3.1/src/CMakeFiles/glfw.dir/x11_init.c.o: glfw-3.1/src/CMakeFiles/glfw.dir/flags.make
glfw-3.1/src/CMakeFiles/glfw.dir/x11_init.c.o: ../glfw-3.1/src/x11_init.c
	$(CMAKE_COMMAND) -E cmake_progress_report /home/evan/Dev/CG/Assig3/hw3/build/CMakeFiles $(CMAKE_PROGRESS_6)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object glfw-3.1/src/CMakeFiles/glfw.dir/x11_init.c.o"
	cd /home/evan/Dev/CG/Assig3/hw3/build/glfw-3.1/src && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/glfw.dir/x11_init.c.o   -c /home/evan/Dev/CG/Assig3/hw3/glfw-3.1/src/x11_init.c

glfw-3.1/src/CMakeFiles/glfw.dir/x11_init.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/glfw.dir/x11_init.c.i"
	cd /home/evan/Dev/CG/Assig3/hw3/build/glfw-3.1/src && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -E /home/evan/Dev/CG/Assig3/hw3/glfw-3.1/src/x11_init.c > CMakeFiles/glfw.dir/x11_init.c.i

glfw-3.1/src/CMakeFiles/glfw.dir/x11_init.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/glfw.dir/x11_init.c.s"
	cd /home/evan/Dev/CG/Assig3/hw3/build/glfw-3.1/src && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -S /home/evan/Dev/CG/Assig3/hw3/glfw-3.1/src/x11_init.c -o CMakeFiles/glfw.dir/x11_init.c.s

glfw-3.1/src/CMakeFiles/glfw.dir/x11_init.c.o.requires:
.PHONY : glfw-3.1/src/CMakeFiles/glfw.dir/x11_init.c.o.requires

glfw-3.1/src/CMakeFiles/glfw.dir/x11_init.c.o.provides: glfw-3.1/src/CMakeFiles/glfw.dir/x11_init.c.o.requires
	$(MAKE) -f glfw-3.1/src/CMakeFiles/glfw.dir/build.make glfw-3.1/src/CMakeFiles/glfw.dir/x11_init.c.o.provides.build
.PHONY : glfw-3.1/src/CMakeFiles/glfw.dir/x11_init.c.o.provides

glfw-3.1/src/CMakeFiles/glfw.dir/x11_init.c.o.provides.build: glfw-3.1/src/CMakeFiles/glfw.dir/x11_init.c.o

glfw-3.1/src/CMakeFiles/glfw.dir/x11_monitor.c.o: glfw-3.1/src/CMakeFiles/glfw.dir/flags.make
glfw-3.1/src/CMakeFiles/glfw.dir/x11_monitor.c.o: ../glfw-3.1/src/x11_monitor.c
	$(CMAKE_COMMAND) -E cmake_progress_report /home/evan/Dev/CG/Assig3/hw3/build/CMakeFiles $(CMAKE_PROGRESS_7)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object glfw-3.1/src/CMakeFiles/glfw.dir/x11_monitor.c.o"
	cd /home/evan/Dev/CG/Assig3/hw3/build/glfw-3.1/src && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/glfw.dir/x11_monitor.c.o   -c /home/evan/Dev/CG/Assig3/hw3/glfw-3.1/src/x11_monitor.c

glfw-3.1/src/CMakeFiles/glfw.dir/x11_monitor.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/glfw.dir/x11_monitor.c.i"
	cd /home/evan/Dev/CG/Assig3/hw3/build/glfw-3.1/src && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -E /home/evan/Dev/CG/Assig3/hw3/glfw-3.1/src/x11_monitor.c > CMakeFiles/glfw.dir/x11_monitor.c.i

glfw-3.1/src/CMakeFiles/glfw.dir/x11_monitor.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/glfw.dir/x11_monitor.c.s"
	cd /home/evan/Dev/CG/Assig3/hw3/build/glfw-3.1/src && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -S /home/evan/Dev/CG/Assig3/hw3/glfw-3.1/src/x11_monitor.c -o CMakeFiles/glfw.dir/x11_monitor.c.s

glfw-3.1/src/CMakeFiles/glfw.dir/x11_monitor.c.o.requires:
.PHONY : glfw-3.1/src/CMakeFiles/glfw.dir/x11_monitor.c.o.requires

glfw-3.1/src/CMakeFiles/glfw.dir/x11_monitor.c.o.provides: glfw-3.1/src/CMakeFiles/glfw.dir/x11_monitor.c.o.requires
	$(MAKE) -f glfw-3.1/src/CMakeFiles/glfw.dir/build.make glfw-3.1/src/CMakeFiles/glfw.dir/x11_monitor.c.o.provides.build
.PHONY : glfw-3.1/src/CMakeFiles/glfw.dir/x11_monitor.c.o.provides

glfw-3.1/src/CMakeFiles/glfw.dir/x11_monitor.c.o.provides.build: glfw-3.1/src/CMakeFiles/glfw.dir/x11_monitor.c.o

glfw-3.1/src/CMakeFiles/glfw.dir/x11_window.c.o: glfw-3.1/src/CMakeFiles/glfw.dir/flags.make
glfw-3.1/src/CMakeFiles/glfw.dir/x11_window.c.o: ../glfw-3.1/src/x11_window.c
	$(CMAKE_COMMAND) -E cmake_progress_report /home/evan/Dev/CG/Assig3/hw3/build/CMakeFiles $(CMAKE_PROGRESS_8)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object glfw-3.1/src/CMakeFiles/glfw.dir/x11_window.c.o"
	cd /home/evan/Dev/CG/Assig3/hw3/build/glfw-3.1/src && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/glfw.dir/x11_window.c.o   -c /home/evan/Dev/CG/Assig3/hw3/glfw-3.1/src/x11_window.c

glfw-3.1/src/CMakeFiles/glfw.dir/x11_window.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/glfw.dir/x11_window.c.i"
	cd /home/evan/Dev/CG/Assig3/hw3/build/glfw-3.1/src && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -E /home/evan/Dev/CG/Assig3/hw3/glfw-3.1/src/x11_window.c > CMakeFiles/glfw.dir/x11_window.c.i

glfw-3.1/src/CMakeFiles/glfw.dir/x11_window.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/glfw.dir/x11_window.c.s"
	cd /home/evan/Dev/CG/Assig3/hw3/build/glfw-3.1/src && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -S /home/evan/Dev/CG/Assig3/hw3/glfw-3.1/src/x11_window.c -o CMakeFiles/glfw.dir/x11_window.c.s

glfw-3.1/src/CMakeFiles/glfw.dir/x11_window.c.o.requires:
.PHONY : glfw-3.1/src/CMakeFiles/glfw.dir/x11_window.c.o.requires

glfw-3.1/src/CMakeFiles/glfw.dir/x11_window.c.o.provides: glfw-3.1/src/CMakeFiles/glfw.dir/x11_window.c.o.requires
	$(MAKE) -f glfw-3.1/src/CMakeFiles/glfw.dir/build.make glfw-3.1/src/CMakeFiles/glfw.dir/x11_window.c.o.provides.build
.PHONY : glfw-3.1/src/CMakeFiles/glfw.dir/x11_window.c.o.provides

glfw-3.1/src/CMakeFiles/glfw.dir/x11_window.c.o.provides.build: glfw-3.1/src/CMakeFiles/glfw.dir/x11_window.c.o

glfw-3.1/src/CMakeFiles/glfw.dir/xkb_unicode.c.o: glfw-3.1/src/CMakeFiles/glfw.dir/flags.make
glfw-3.1/src/CMakeFiles/glfw.dir/xkb_unicode.c.o: ../glfw-3.1/src/xkb_unicode.c
	$(CMAKE_COMMAND) -E cmake_progress_report /home/evan/Dev/CG/Assig3/hw3/build/CMakeFiles $(CMAKE_PROGRESS_9)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object glfw-3.1/src/CMakeFiles/glfw.dir/xkb_unicode.c.o"
	cd /home/evan/Dev/CG/Assig3/hw3/build/glfw-3.1/src && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/glfw.dir/xkb_unicode.c.o   -c /home/evan/Dev/CG/Assig3/hw3/glfw-3.1/src/xkb_unicode.c

glfw-3.1/src/CMakeFiles/glfw.dir/xkb_unicode.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/glfw.dir/xkb_unicode.c.i"
	cd /home/evan/Dev/CG/Assig3/hw3/build/glfw-3.1/src && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -E /home/evan/Dev/CG/Assig3/hw3/glfw-3.1/src/xkb_unicode.c > CMakeFiles/glfw.dir/xkb_unicode.c.i

glfw-3.1/src/CMakeFiles/glfw.dir/xkb_unicode.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/glfw.dir/xkb_unicode.c.s"
	cd /home/evan/Dev/CG/Assig3/hw3/build/glfw-3.1/src && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -S /home/evan/Dev/CG/Assig3/hw3/glfw-3.1/src/xkb_unicode.c -o CMakeFiles/glfw.dir/xkb_unicode.c.s

glfw-3.1/src/CMakeFiles/glfw.dir/xkb_unicode.c.o.requires:
.PHONY : glfw-3.1/src/CMakeFiles/glfw.dir/xkb_unicode.c.o.requires

glfw-3.1/src/CMakeFiles/glfw.dir/xkb_unicode.c.o.provides: glfw-3.1/src/CMakeFiles/glfw.dir/xkb_unicode.c.o.requires
	$(MAKE) -f glfw-3.1/src/CMakeFiles/glfw.dir/build.make glfw-3.1/src/CMakeFiles/glfw.dir/xkb_unicode.c.o.provides.build
.PHONY : glfw-3.1/src/CMakeFiles/glfw.dir/xkb_unicode.c.o.provides

glfw-3.1/src/CMakeFiles/glfw.dir/xkb_unicode.c.o.provides.build: glfw-3.1/src/CMakeFiles/glfw.dir/xkb_unicode.c.o

glfw-3.1/src/CMakeFiles/glfw.dir/linux_joystick.c.o: glfw-3.1/src/CMakeFiles/glfw.dir/flags.make
glfw-3.1/src/CMakeFiles/glfw.dir/linux_joystick.c.o: ../glfw-3.1/src/linux_joystick.c
	$(CMAKE_COMMAND) -E cmake_progress_report /home/evan/Dev/CG/Assig3/hw3/build/CMakeFiles $(CMAKE_PROGRESS_10)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object glfw-3.1/src/CMakeFiles/glfw.dir/linux_joystick.c.o"
	cd /home/evan/Dev/CG/Assig3/hw3/build/glfw-3.1/src && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/glfw.dir/linux_joystick.c.o   -c /home/evan/Dev/CG/Assig3/hw3/glfw-3.1/src/linux_joystick.c

glfw-3.1/src/CMakeFiles/glfw.dir/linux_joystick.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/glfw.dir/linux_joystick.c.i"
	cd /home/evan/Dev/CG/Assig3/hw3/build/glfw-3.1/src && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -E /home/evan/Dev/CG/Assig3/hw3/glfw-3.1/src/linux_joystick.c > CMakeFiles/glfw.dir/linux_joystick.c.i

glfw-3.1/src/CMakeFiles/glfw.dir/linux_joystick.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/glfw.dir/linux_joystick.c.s"
	cd /home/evan/Dev/CG/Assig3/hw3/build/glfw-3.1/src && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -S /home/evan/Dev/CG/Assig3/hw3/glfw-3.1/src/linux_joystick.c -o CMakeFiles/glfw.dir/linux_joystick.c.s

glfw-3.1/src/CMakeFiles/glfw.dir/linux_joystick.c.o.requires:
.PHONY : glfw-3.1/src/CMakeFiles/glfw.dir/linux_joystick.c.o.requires

glfw-3.1/src/CMakeFiles/glfw.dir/linux_joystick.c.o.provides: glfw-3.1/src/CMakeFiles/glfw.dir/linux_joystick.c.o.requires
	$(MAKE) -f glfw-3.1/src/CMakeFiles/glfw.dir/build.make glfw-3.1/src/CMakeFiles/glfw.dir/linux_joystick.c.o.provides.build
.PHONY : glfw-3.1/src/CMakeFiles/glfw.dir/linux_joystick.c.o.provides

glfw-3.1/src/CMakeFiles/glfw.dir/linux_joystick.c.o.provides.build: glfw-3.1/src/CMakeFiles/glfw.dir/linux_joystick.c.o

glfw-3.1/src/CMakeFiles/glfw.dir/posix_time.c.o: glfw-3.1/src/CMakeFiles/glfw.dir/flags.make
glfw-3.1/src/CMakeFiles/glfw.dir/posix_time.c.o: ../glfw-3.1/src/posix_time.c
	$(CMAKE_COMMAND) -E cmake_progress_report /home/evan/Dev/CG/Assig3/hw3/build/CMakeFiles $(CMAKE_PROGRESS_11)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object glfw-3.1/src/CMakeFiles/glfw.dir/posix_time.c.o"
	cd /home/evan/Dev/CG/Assig3/hw3/build/glfw-3.1/src && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/glfw.dir/posix_time.c.o   -c /home/evan/Dev/CG/Assig3/hw3/glfw-3.1/src/posix_time.c

glfw-3.1/src/CMakeFiles/glfw.dir/posix_time.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/glfw.dir/posix_time.c.i"
	cd /home/evan/Dev/CG/Assig3/hw3/build/glfw-3.1/src && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -E /home/evan/Dev/CG/Assig3/hw3/glfw-3.1/src/posix_time.c > CMakeFiles/glfw.dir/posix_time.c.i

glfw-3.1/src/CMakeFiles/glfw.dir/posix_time.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/glfw.dir/posix_time.c.s"
	cd /home/evan/Dev/CG/Assig3/hw3/build/glfw-3.1/src && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -S /home/evan/Dev/CG/Assig3/hw3/glfw-3.1/src/posix_time.c -o CMakeFiles/glfw.dir/posix_time.c.s

glfw-3.1/src/CMakeFiles/glfw.dir/posix_time.c.o.requires:
.PHONY : glfw-3.1/src/CMakeFiles/glfw.dir/posix_time.c.o.requires

glfw-3.1/src/CMakeFiles/glfw.dir/posix_time.c.o.provides: glfw-3.1/src/CMakeFiles/glfw.dir/posix_time.c.o.requires
	$(MAKE) -f glfw-3.1/src/CMakeFiles/glfw.dir/build.make glfw-3.1/src/CMakeFiles/glfw.dir/posix_time.c.o.provides.build
.PHONY : glfw-3.1/src/CMakeFiles/glfw.dir/posix_time.c.o.provides

glfw-3.1/src/CMakeFiles/glfw.dir/posix_time.c.o.provides.build: glfw-3.1/src/CMakeFiles/glfw.dir/posix_time.c.o

glfw-3.1/src/CMakeFiles/glfw.dir/posix_tls.c.o: glfw-3.1/src/CMakeFiles/glfw.dir/flags.make
glfw-3.1/src/CMakeFiles/glfw.dir/posix_tls.c.o: ../glfw-3.1/src/posix_tls.c
	$(CMAKE_COMMAND) -E cmake_progress_report /home/evan/Dev/CG/Assig3/hw3/build/CMakeFiles $(CMAKE_PROGRESS_12)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object glfw-3.1/src/CMakeFiles/glfw.dir/posix_tls.c.o"
	cd /home/evan/Dev/CG/Assig3/hw3/build/glfw-3.1/src && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/glfw.dir/posix_tls.c.o   -c /home/evan/Dev/CG/Assig3/hw3/glfw-3.1/src/posix_tls.c

glfw-3.1/src/CMakeFiles/glfw.dir/posix_tls.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/glfw.dir/posix_tls.c.i"
	cd /home/evan/Dev/CG/Assig3/hw3/build/glfw-3.1/src && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -E /home/evan/Dev/CG/Assig3/hw3/glfw-3.1/src/posix_tls.c > CMakeFiles/glfw.dir/posix_tls.c.i

glfw-3.1/src/CMakeFiles/glfw.dir/posix_tls.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/glfw.dir/posix_tls.c.s"
	cd /home/evan/Dev/CG/Assig3/hw3/build/glfw-3.1/src && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -S /home/evan/Dev/CG/Assig3/hw3/glfw-3.1/src/posix_tls.c -o CMakeFiles/glfw.dir/posix_tls.c.s

glfw-3.1/src/CMakeFiles/glfw.dir/posix_tls.c.o.requires:
.PHONY : glfw-3.1/src/CMakeFiles/glfw.dir/posix_tls.c.o.requires

glfw-3.1/src/CMakeFiles/glfw.dir/posix_tls.c.o.provides: glfw-3.1/src/CMakeFiles/glfw.dir/posix_tls.c.o.requires
	$(MAKE) -f glfw-3.1/src/CMakeFiles/glfw.dir/build.make glfw-3.1/src/CMakeFiles/glfw.dir/posix_tls.c.o.provides.build
.PHONY : glfw-3.1/src/CMakeFiles/glfw.dir/posix_tls.c.o.provides

glfw-3.1/src/CMakeFiles/glfw.dir/posix_tls.c.o.provides.build: glfw-3.1/src/CMakeFiles/glfw.dir/posix_tls.c.o

glfw-3.1/src/CMakeFiles/glfw.dir/glx_context.c.o: glfw-3.1/src/CMakeFiles/glfw.dir/flags.make
glfw-3.1/src/CMakeFiles/glfw.dir/glx_context.c.o: ../glfw-3.1/src/glx_context.c
	$(CMAKE_COMMAND) -E cmake_progress_report /home/evan/Dev/CG/Assig3/hw3/build/CMakeFiles $(CMAKE_PROGRESS_13)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object glfw-3.1/src/CMakeFiles/glfw.dir/glx_context.c.o"
	cd /home/evan/Dev/CG/Assig3/hw3/build/glfw-3.1/src && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/glfw.dir/glx_context.c.o   -c /home/evan/Dev/CG/Assig3/hw3/glfw-3.1/src/glx_context.c

glfw-3.1/src/CMakeFiles/glfw.dir/glx_context.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/glfw.dir/glx_context.c.i"
	cd /home/evan/Dev/CG/Assig3/hw3/build/glfw-3.1/src && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -E /home/evan/Dev/CG/Assig3/hw3/glfw-3.1/src/glx_context.c > CMakeFiles/glfw.dir/glx_context.c.i

glfw-3.1/src/CMakeFiles/glfw.dir/glx_context.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/glfw.dir/glx_context.c.s"
	cd /home/evan/Dev/CG/Assig3/hw3/build/glfw-3.1/src && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -S /home/evan/Dev/CG/Assig3/hw3/glfw-3.1/src/glx_context.c -o CMakeFiles/glfw.dir/glx_context.c.s

glfw-3.1/src/CMakeFiles/glfw.dir/glx_context.c.o.requires:
.PHONY : glfw-3.1/src/CMakeFiles/glfw.dir/glx_context.c.o.requires

glfw-3.1/src/CMakeFiles/glfw.dir/glx_context.c.o.provides: glfw-3.1/src/CMakeFiles/glfw.dir/glx_context.c.o.requires
	$(MAKE) -f glfw-3.1/src/CMakeFiles/glfw.dir/build.make glfw-3.1/src/CMakeFiles/glfw.dir/glx_context.c.o.provides.build
.PHONY : glfw-3.1/src/CMakeFiles/glfw.dir/glx_context.c.o.provides

glfw-3.1/src/CMakeFiles/glfw.dir/glx_context.c.o.provides.build: glfw-3.1/src/CMakeFiles/glfw.dir/glx_context.c.o

# Object files for target glfw
glfw_OBJECTS = \
"CMakeFiles/glfw.dir/context.c.o" \
"CMakeFiles/glfw.dir/init.c.o" \
"CMakeFiles/glfw.dir/input.c.o" \
"CMakeFiles/glfw.dir/monitor.c.o" \
"CMakeFiles/glfw.dir/window.c.o" \
"CMakeFiles/glfw.dir/x11_init.c.o" \
"CMakeFiles/glfw.dir/x11_monitor.c.o" \
"CMakeFiles/glfw.dir/x11_window.c.o" \
"CMakeFiles/glfw.dir/xkb_unicode.c.o" \
"CMakeFiles/glfw.dir/linux_joystick.c.o" \
"CMakeFiles/glfw.dir/posix_time.c.o" \
"CMakeFiles/glfw.dir/posix_tls.c.o" \
"CMakeFiles/glfw.dir/glx_context.c.o"

# External object files for target glfw
glfw_EXTERNAL_OBJECTS =

glfw-3.1/src/libglfw3.a: glfw-3.1/src/CMakeFiles/glfw.dir/context.c.o
glfw-3.1/src/libglfw3.a: glfw-3.1/src/CMakeFiles/glfw.dir/init.c.o
glfw-3.1/src/libglfw3.a: glfw-3.1/src/CMakeFiles/glfw.dir/input.c.o
glfw-3.1/src/libglfw3.a: glfw-3.1/src/CMakeFiles/glfw.dir/monitor.c.o
glfw-3.1/src/libglfw3.a: glfw-3.1/src/CMakeFiles/glfw.dir/window.c.o
glfw-3.1/src/libglfw3.a: glfw-3.1/src/CMakeFiles/glfw.dir/x11_init.c.o
glfw-3.1/src/libglfw3.a: glfw-3.1/src/CMakeFiles/glfw.dir/x11_monitor.c.o
glfw-3.1/src/libglfw3.a: glfw-3.1/src/CMakeFiles/glfw.dir/x11_window.c.o
glfw-3.1/src/libglfw3.a: glfw-3.1/src/CMakeFiles/glfw.dir/xkb_unicode.c.o
glfw-3.1/src/libglfw3.a: glfw-3.1/src/CMakeFiles/glfw.dir/linux_joystick.c.o
glfw-3.1/src/libglfw3.a: glfw-3.1/src/CMakeFiles/glfw.dir/posix_time.c.o
glfw-3.1/src/libglfw3.a: glfw-3.1/src/CMakeFiles/glfw.dir/posix_tls.c.o
glfw-3.1/src/libglfw3.a: glfw-3.1/src/CMakeFiles/glfw.dir/glx_context.c.o
glfw-3.1/src/libglfw3.a: glfw-3.1/src/CMakeFiles/glfw.dir/build.make
glfw-3.1/src/libglfw3.a: glfw-3.1/src/CMakeFiles/glfw.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking C static library libglfw3.a"
	cd /home/evan/Dev/CG/Assig3/hw3/build/glfw-3.1/src && $(CMAKE_COMMAND) -P CMakeFiles/glfw.dir/cmake_clean_target.cmake
	cd /home/evan/Dev/CG/Assig3/hw3/build/glfw-3.1/src && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/glfw.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
glfw-3.1/src/CMakeFiles/glfw.dir/build: glfw-3.1/src/libglfw3.a
.PHONY : glfw-3.1/src/CMakeFiles/glfw.dir/build

glfw-3.1/src/CMakeFiles/glfw.dir/requires: glfw-3.1/src/CMakeFiles/glfw.dir/context.c.o.requires
glfw-3.1/src/CMakeFiles/glfw.dir/requires: glfw-3.1/src/CMakeFiles/glfw.dir/init.c.o.requires
glfw-3.1/src/CMakeFiles/glfw.dir/requires: glfw-3.1/src/CMakeFiles/glfw.dir/input.c.o.requires
glfw-3.1/src/CMakeFiles/glfw.dir/requires: glfw-3.1/src/CMakeFiles/glfw.dir/monitor.c.o.requires
glfw-3.1/src/CMakeFiles/glfw.dir/requires: glfw-3.1/src/CMakeFiles/glfw.dir/window.c.o.requires
glfw-3.1/src/CMakeFiles/glfw.dir/requires: glfw-3.1/src/CMakeFiles/glfw.dir/x11_init.c.o.requires
glfw-3.1/src/CMakeFiles/glfw.dir/requires: glfw-3.1/src/CMakeFiles/glfw.dir/x11_monitor.c.o.requires
glfw-3.1/src/CMakeFiles/glfw.dir/requires: glfw-3.1/src/CMakeFiles/glfw.dir/x11_window.c.o.requires
glfw-3.1/src/CMakeFiles/glfw.dir/requires: glfw-3.1/src/CMakeFiles/glfw.dir/xkb_unicode.c.o.requires
glfw-3.1/src/CMakeFiles/glfw.dir/requires: glfw-3.1/src/CMakeFiles/glfw.dir/linux_joystick.c.o.requires
glfw-3.1/src/CMakeFiles/glfw.dir/requires: glfw-3.1/src/CMakeFiles/glfw.dir/posix_time.c.o.requires
glfw-3.1/src/CMakeFiles/glfw.dir/requires: glfw-3.1/src/CMakeFiles/glfw.dir/posix_tls.c.o.requires
glfw-3.1/src/CMakeFiles/glfw.dir/requires: glfw-3.1/src/CMakeFiles/glfw.dir/glx_context.c.o.requires
.PHONY : glfw-3.1/src/CMakeFiles/glfw.dir/requires

glfw-3.1/src/CMakeFiles/glfw.dir/clean:
	cd /home/evan/Dev/CG/Assig3/hw3/build/glfw-3.1/src && $(CMAKE_COMMAND) -P CMakeFiles/glfw.dir/cmake_clean.cmake
.PHONY : glfw-3.1/src/CMakeFiles/glfw.dir/clean

glfw-3.1/src/CMakeFiles/glfw.dir/depend:
	cd /home/evan/Dev/CG/Assig3/hw3/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/evan/Dev/CG/Assig3/hw3 /home/evan/Dev/CG/Assig3/hw3/glfw-3.1/src /home/evan/Dev/CG/Assig3/hw3/build /home/evan/Dev/CG/Assig3/hw3/build/glfw-3.1/src /home/evan/Dev/CG/Assig3/hw3/build/glfw-3.1/src/CMakeFiles/glfw.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : glfw-3.1/src/CMakeFiles/glfw.dir/depend

