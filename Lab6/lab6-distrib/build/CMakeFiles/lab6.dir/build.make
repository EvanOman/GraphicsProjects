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
include CMakeFiles/lab6.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/lab6.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/lab6.dir/flags.make

CMakeFiles/lab6.dir/lab6.o: CMakeFiles/lab6.dir/flags.make
CMakeFiles/lab6.dir/lab6.o: ../lab6.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/evan/Dev/CG/Lab6/lab6-distrib/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object CMakeFiles/lab6.dir/lab6.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/lab6.dir/lab6.o -c /home/evan/Dev/CG/Lab6/lab6-distrib/lab6.cpp

CMakeFiles/lab6.dir/lab6.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/lab6.dir/lab6.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/evan/Dev/CG/Lab6/lab6-distrib/lab6.cpp > CMakeFiles/lab6.dir/lab6.i

CMakeFiles/lab6.dir/lab6.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/lab6.dir/lab6.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/evan/Dev/CG/Lab6/lab6-distrib/lab6.cpp -o CMakeFiles/lab6.dir/lab6.s

CMakeFiles/lab6.dir/lab6.o.requires:
.PHONY : CMakeFiles/lab6.dir/lab6.o.requires

CMakeFiles/lab6.dir/lab6.o.provides: CMakeFiles/lab6.dir/lab6.o.requires
	$(MAKE) -f CMakeFiles/lab6.dir/build.make CMakeFiles/lab6.dir/lab6.o.provides.build
.PHONY : CMakeFiles/lab6.dir/lab6.o.provides

CMakeFiles/lab6.dir/lab6.o.provides.build: CMakeFiles/lab6.dir/lab6.o

CMakeFiles/lab6.dir/CircleInclude.o: CMakeFiles/lab6.dir/flags.make
CMakeFiles/lab6.dir/CircleInclude.o: ../CircleInclude.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/evan/Dev/CG/Lab6/lab6-distrib/build/CMakeFiles $(CMAKE_PROGRESS_2)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object CMakeFiles/lab6.dir/CircleInclude.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/lab6.dir/CircleInclude.o -c /home/evan/Dev/CG/Lab6/lab6-distrib/CircleInclude.cpp

CMakeFiles/lab6.dir/CircleInclude.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/lab6.dir/CircleInclude.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/evan/Dev/CG/Lab6/lab6-distrib/CircleInclude.cpp > CMakeFiles/lab6.dir/CircleInclude.i

CMakeFiles/lab6.dir/CircleInclude.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/lab6.dir/CircleInclude.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/evan/Dev/CG/Lab6/lab6-distrib/CircleInclude.cpp -o CMakeFiles/lab6.dir/CircleInclude.s

CMakeFiles/lab6.dir/CircleInclude.o.requires:
.PHONY : CMakeFiles/lab6.dir/CircleInclude.o.requires

CMakeFiles/lab6.dir/CircleInclude.o.provides: CMakeFiles/lab6.dir/CircleInclude.o.requires
	$(MAKE) -f CMakeFiles/lab6.dir/build.make CMakeFiles/lab6.dir/CircleInclude.o.provides.build
.PHONY : CMakeFiles/lab6.dir/CircleInclude.o.provides

CMakeFiles/lab6.dir/CircleInclude.o.provides.build: CMakeFiles/lab6.dir/CircleInclude.o

CMakeFiles/lab6.dir/TorusInclude.o: CMakeFiles/lab6.dir/flags.make
CMakeFiles/lab6.dir/TorusInclude.o: ../TorusInclude.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/evan/Dev/CG/Lab6/lab6-distrib/build/CMakeFiles $(CMAKE_PROGRESS_3)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object CMakeFiles/lab6.dir/TorusInclude.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/lab6.dir/TorusInclude.o -c /home/evan/Dev/CG/Lab6/lab6-distrib/TorusInclude.cpp

CMakeFiles/lab6.dir/TorusInclude.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/lab6.dir/TorusInclude.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/evan/Dev/CG/Lab6/lab6-distrib/TorusInclude.cpp > CMakeFiles/lab6.dir/TorusInclude.i

CMakeFiles/lab6.dir/TorusInclude.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/lab6.dir/TorusInclude.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/evan/Dev/CG/Lab6/lab6-distrib/TorusInclude.cpp -o CMakeFiles/lab6.dir/TorusInclude.s

CMakeFiles/lab6.dir/TorusInclude.o.requires:
.PHONY : CMakeFiles/lab6.dir/TorusInclude.o.requires

CMakeFiles/lab6.dir/TorusInclude.o.provides: CMakeFiles/lab6.dir/TorusInclude.o.requires
	$(MAKE) -f CMakeFiles/lab6.dir/build.make CMakeFiles/lab6.dir/TorusInclude.o.provides.build
.PHONY : CMakeFiles/lab6.dir/TorusInclude.o.provides

CMakeFiles/lab6.dir/TorusInclude.o.provides.build: CMakeFiles/lab6.dir/TorusInclude.o

# Object files for target lab6
lab6_OBJECTS = \
"CMakeFiles/lab6.dir/lab6.o" \
"CMakeFiles/lab6.dir/CircleInclude.o" \
"CMakeFiles/lab6.dir/TorusInclude.o"

# External object files for target lab6
lab6_EXTERNAL_OBJECTS =

lab6: CMakeFiles/lab6.dir/lab6.o
lab6: CMakeFiles/lab6.dir/CircleInclude.o
lab6: CMakeFiles/lab6.dir/TorusInclude.o
lab6: CMakeFiles/lab6.dir/build.make
lab6: glfw-3.1/src/libglfw3.a
lab6: /usr/lib/x86_64-linux-gnu/libX11.so
lab6: /usr/lib/x86_64-linux-gnu/libXrandr.so
lab6: /usr/lib/x86_64-linux-gnu/libXinerama.so
lab6: /usr/lib/x86_64-linux-gnu/libXi.so
lab6: /usr/lib/x86_64-linux-gnu/libXxf86vm.so
lab6: /usr/lib/x86_64-linux-gnu/librt.so
lab6: /usr/lib/x86_64-linux-gnu/libm.so
lab6: /usr/lib/x86_64-linux-gnu/libXcursor.so
lab6: /usr/lib/x86_64-linux-gnu/libGL.so
lab6: CMakeFiles/lab6.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable lab6"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/lab6.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/lab6.dir/build: lab6
.PHONY : CMakeFiles/lab6.dir/build

CMakeFiles/lab6.dir/requires: CMakeFiles/lab6.dir/lab6.o.requires
CMakeFiles/lab6.dir/requires: CMakeFiles/lab6.dir/CircleInclude.o.requires
CMakeFiles/lab6.dir/requires: CMakeFiles/lab6.dir/TorusInclude.o.requires
.PHONY : CMakeFiles/lab6.dir/requires

CMakeFiles/lab6.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/lab6.dir/cmake_clean.cmake
.PHONY : CMakeFiles/lab6.dir/clean

CMakeFiles/lab6.dir/depend:
	cd /home/evan/Dev/CG/Lab6/lab6-distrib/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/evan/Dev/CG/Lab6/lab6-distrib /home/evan/Dev/CG/Lab6/lab6-distrib /home/evan/Dev/CG/Lab6/lab6-distrib/build /home/evan/Dev/CG/Lab6/lab6-distrib/build /home/evan/Dev/CG/Lab6/lab6-distrib/build/CMakeFiles/lab6.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/lab6.dir/depend

