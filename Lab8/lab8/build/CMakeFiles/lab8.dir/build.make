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
CMAKE_SOURCE_DIR = /home/evan/Dev/CG/Lab8/lab8

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/evan/Dev/CG/Lab8/lab8/build

# Include any dependencies generated for this target.
include CMakeFiles/lab8.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/lab8.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/lab8.dir/flags.make

CMakeFiles/lab8.dir/Framebuffer.o: CMakeFiles/lab8.dir/flags.make
CMakeFiles/lab8.dir/Framebuffer.o: ../Framebuffer.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/evan/Dev/CG/Lab8/lab8/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object CMakeFiles/lab8.dir/Framebuffer.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/lab8.dir/Framebuffer.o -c /home/evan/Dev/CG/Lab8/lab8/Framebuffer.cpp

CMakeFiles/lab8.dir/Framebuffer.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/lab8.dir/Framebuffer.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/evan/Dev/CG/Lab8/lab8/Framebuffer.cpp > CMakeFiles/lab8.dir/Framebuffer.i

CMakeFiles/lab8.dir/Framebuffer.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/lab8.dir/Framebuffer.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/evan/Dev/CG/Lab8/lab8/Framebuffer.cpp -o CMakeFiles/lab8.dir/Framebuffer.s

CMakeFiles/lab8.dir/Framebuffer.o.requires:
.PHONY : CMakeFiles/lab8.dir/Framebuffer.o.requires

CMakeFiles/lab8.dir/Framebuffer.o.provides: CMakeFiles/lab8.dir/Framebuffer.o.requires
	$(MAKE) -f CMakeFiles/lab8.dir/build.make CMakeFiles/lab8.dir/Framebuffer.o.provides.build
.PHONY : CMakeFiles/lab8.dir/Framebuffer.o.provides

CMakeFiles/lab8.dir/Framebuffer.o.provides.build: CMakeFiles/lab8.dir/Framebuffer.o

CMakeFiles/lab8.dir/Mesh.o: CMakeFiles/lab8.dir/flags.make
CMakeFiles/lab8.dir/Mesh.o: ../Mesh.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/evan/Dev/CG/Lab8/lab8/build/CMakeFiles $(CMAKE_PROGRESS_2)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object CMakeFiles/lab8.dir/Mesh.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/lab8.dir/Mesh.o -c /home/evan/Dev/CG/Lab8/lab8/Mesh.cpp

CMakeFiles/lab8.dir/Mesh.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/lab8.dir/Mesh.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/evan/Dev/CG/Lab8/lab8/Mesh.cpp > CMakeFiles/lab8.dir/Mesh.i

CMakeFiles/lab8.dir/Mesh.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/lab8.dir/Mesh.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/evan/Dev/CG/Lab8/lab8/Mesh.cpp -o CMakeFiles/lab8.dir/Mesh.s

CMakeFiles/lab8.dir/Mesh.o.requires:
.PHONY : CMakeFiles/lab8.dir/Mesh.o.requires

CMakeFiles/lab8.dir/Mesh.o.provides: CMakeFiles/lab8.dir/Mesh.o.requires
	$(MAKE) -f CMakeFiles/lab8.dir/build.make CMakeFiles/lab8.dir/Mesh.o.provides.build
.PHONY : CMakeFiles/lab8.dir/Mesh.o.provides

CMakeFiles/lab8.dir/Mesh.o.provides.build: CMakeFiles/lab8.dir/Mesh.o

CMakeFiles/lab8.dir/Shader.o: CMakeFiles/lab8.dir/flags.make
CMakeFiles/lab8.dir/Shader.o: ../Shader.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/evan/Dev/CG/Lab8/lab8/build/CMakeFiles $(CMAKE_PROGRESS_3)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object CMakeFiles/lab8.dir/Shader.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/lab8.dir/Shader.o -c /home/evan/Dev/CG/Lab8/lab8/Shader.cpp

CMakeFiles/lab8.dir/Shader.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/lab8.dir/Shader.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/evan/Dev/CG/Lab8/lab8/Shader.cpp > CMakeFiles/lab8.dir/Shader.i

CMakeFiles/lab8.dir/Shader.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/lab8.dir/Shader.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/evan/Dev/CG/Lab8/lab8/Shader.cpp -o CMakeFiles/lab8.dir/Shader.s

CMakeFiles/lab8.dir/Shader.o.requires:
.PHONY : CMakeFiles/lab8.dir/Shader.o.requires

CMakeFiles/lab8.dir/Shader.o.provides: CMakeFiles/lab8.dir/Shader.o.requires
	$(MAKE) -f CMakeFiles/lab8.dir/build.make CMakeFiles/lab8.dir/Shader.o.provides.build
.PHONY : CMakeFiles/lab8.dir/Shader.o.provides

CMakeFiles/lab8.dir/Shader.o.provides.build: CMakeFiles/lab8.dir/Shader.o

CMakeFiles/lab8.dir/lab8.o: CMakeFiles/lab8.dir/flags.make
CMakeFiles/lab8.dir/lab8.o: ../lab8.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/evan/Dev/CG/Lab8/lab8/build/CMakeFiles $(CMAKE_PROGRESS_4)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object CMakeFiles/lab8.dir/lab8.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/lab8.dir/lab8.o -c /home/evan/Dev/CG/Lab8/lab8/lab8.cpp

CMakeFiles/lab8.dir/lab8.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/lab8.dir/lab8.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/evan/Dev/CG/Lab8/lab8/lab8.cpp > CMakeFiles/lab8.dir/lab8.i

CMakeFiles/lab8.dir/lab8.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/lab8.dir/lab8.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/evan/Dev/CG/Lab8/lab8/lab8.cpp -o CMakeFiles/lab8.dir/lab8.s

CMakeFiles/lab8.dir/lab8.o.requires:
.PHONY : CMakeFiles/lab8.dir/lab8.o.requires

CMakeFiles/lab8.dir/lab8.o.provides: CMakeFiles/lab8.dir/lab8.o.requires
	$(MAKE) -f CMakeFiles/lab8.dir/build.make CMakeFiles/lab8.dir/lab8.o.provides.build
.PHONY : CMakeFiles/lab8.dir/lab8.o.provides

CMakeFiles/lab8.dir/lab8.o.provides.build: CMakeFiles/lab8.dir/lab8.o

# Object files for target lab8
lab8_OBJECTS = \
"CMakeFiles/lab8.dir/Framebuffer.o" \
"CMakeFiles/lab8.dir/Mesh.o" \
"CMakeFiles/lab8.dir/Shader.o" \
"CMakeFiles/lab8.dir/lab8.o"

# External object files for target lab8
lab8_EXTERNAL_OBJECTS =

lab8: CMakeFiles/lab8.dir/Framebuffer.o
lab8: CMakeFiles/lab8.dir/Mesh.o
lab8: CMakeFiles/lab8.dir/Shader.o
lab8: CMakeFiles/lab8.dir/lab8.o
lab8: CMakeFiles/lab8.dir/build.make
lab8: glfw-3.1/src/libglfw3.a
lab8: /usr/lib/x86_64-linux-gnu/libX11.so
lab8: /usr/lib/x86_64-linux-gnu/libXrandr.so
lab8: /usr/lib/x86_64-linux-gnu/libXinerama.so
lab8: /usr/lib/x86_64-linux-gnu/libXi.so
lab8: /usr/lib/x86_64-linux-gnu/libXxf86vm.so
lab8: /usr/lib/x86_64-linux-gnu/librt.so
lab8: /usr/lib/x86_64-linux-gnu/libm.so
lab8: /usr/lib/x86_64-linux-gnu/libXcursor.so
lab8: /usr/lib/x86_64-linux-gnu/libGL.so
lab8: CMakeFiles/lab8.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable lab8"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/lab8.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/lab8.dir/build: lab8
.PHONY : CMakeFiles/lab8.dir/build

CMakeFiles/lab8.dir/requires: CMakeFiles/lab8.dir/Framebuffer.o.requires
CMakeFiles/lab8.dir/requires: CMakeFiles/lab8.dir/Mesh.o.requires
CMakeFiles/lab8.dir/requires: CMakeFiles/lab8.dir/Shader.o.requires
CMakeFiles/lab8.dir/requires: CMakeFiles/lab8.dir/lab8.o.requires
.PHONY : CMakeFiles/lab8.dir/requires

CMakeFiles/lab8.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/lab8.dir/cmake_clean.cmake
.PHONY : CMakeFiles/lab8.dir/clean

CMakeFiles/lab8.dir/depend:
	cd /home/evan/Dev/CG/Lab8/lab8/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/evan/Dev/CG/Lab8/lab8 /home/evan/Dev/CG/Lab8/lab8 /home/evan/Dev/CG/Lab8/lab8/build /home/evan/Dev/CG/Lab8/lab8/build /home/evan/Dev/CG/Lab8/lab8/build/CMakeFiles/lab8.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/lab8.dir/depend
