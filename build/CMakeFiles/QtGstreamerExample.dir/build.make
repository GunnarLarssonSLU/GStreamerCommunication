# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.22

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
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
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/gunnar/code/GStreamerWorker

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/gunnar/code/GStreamerWorker/build

# Include any dependencies generated for this target.
include CMakeFiles/QtGstreamerExample.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/QtGstreamerExample.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/QtGstreamerExample.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/QtGstreamerExample.dir/flags.make

CMakeFiles/QtGstreamerExample.dir/QtGstreamerExample_autogen/mocs_compilation.cpp.o: CMakeFiles/QtGstreamerExample.dir/flags.make
CMakeFiles/QtGstreamerExample.dir/QtGstreamerExample_autogen/mocs_compilation.cpp.o: QtGstreamerExample_autogen/mocs_compilation.cpp
CMakeFiles/QtGstreamerExample.dir/QtGstreamerExample_autogen/mocs_compilation.cpp.o: CMakeFiles/QtGstreamerExample.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/gunnar/code/GStreamerWorker/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/QtGstreamerExample.dir/QtGstreamerExample_autogen/mocs_compilation.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/QtGstreamerExample.dir/QtGstreamerExample_autogen/mocs_compilation.cpp.o -MF CMakeFiles/QtGstreamerExample.dir/QtGstreamerExample_autogen/mocs_compilation.cpp.o.d -o CMakeFiles/QtGstreamerExample.dir/QtGstreamerExample_autogen/mocs_compilation.cpp.o -c /home/gunnar/code/GStreamerWorker/build/QtGstreamerExample_autogen/mocs_compilation.cpp

CMakeFiles/QtGstreamerExample.dir/QtGstreamerExample_autogen/mocs_compilation.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/QtGstreamerExample.dir/QtGstreamerExample_autogen/mocs_compilation.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/gunnar/code/GStreamerWorker/build/QtGstreamerExample_autogen/mocs_compilation.cpp > CMakeFiles/QtGstreamerExample.dir/QtGstreamerExample_autogen/mocs_compilation.cpp.i

CMakeFiles/QtGstreamerExample.dir/QtGstreamerExample_autogen/mocs_compilation.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/QtGstreamerExample.dir/QtGstreamerExample_autogen/mocs_compilation.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/gunnar/code/GStreamerWorker/build/QtGstreamerExample_autogen/mocs_compilation.cpp -o CMakeFiles/QtGstreamerExample.dir/QtGstreamerExample_autogen/mocs_compilation.cpp.s

CMakeFiles/QtGstreamerExample.dir/main.cpp.o: CMakeFiles/QtGstreamerExample.dir/flags.make
CMakeFiles/QtGstreamerExample.dir/main.cpp.o: ../main.cpp
CMakeFiles/QtGstreamerExample.dir/main.cpp.o: CMakeFiles/QtGstreamerExample.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/gunnar/code/GStreamerWorker/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/QtGstreamerExample.dir/main.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/QtGstreamerExample.dir/main.cpp.o -MF CMakeFiles/QtGstreamerExample.dir/main.cpp.o.d -o CMakeFiles/QtGstreamerExample.dir/main.cpp.o -c /home/gunnar/code/GStreamerWorker/main.cpp

CMakeFiles/QtGstreamerExample.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/QtGstreamerExample.dir/main.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/gunnar/code/GStreamerWorker/main.cpp > CMakeFiles/QtGstreamerExample.dir/main.cpp.i

CMakeFiles/QtGstreamerExample.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/QtGstreamerExample.dir/main.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/gunnar/code/GStreamerWorker/main.cpp -o CMakeFiles/QtGstreamerExample.dir/main.cpp.s

CMakeFiles/QtGstreamerExample.dir/gstreamerworker.cpp.o: CMakeFiles/QtGstreamerExample.dir/flags.make
CMakeFiles/QtGstreamerExample.dir/gstreamerworker.cpp.o: ../gstreamerworker.cpp
CMakeFiles/QtGstreamerExample.dir/gstreamerworker.cpp.o: CMakeFiles/QtGstreamerExample.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/gunnar/code/GStreamerWorker/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object CMakeFiles/QtGstreamerExample.dir/gstreamerworker.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/QtGstreamerExample.dir/gstreamerworker.cpp.o -MF CMakeFiles/QtGstreamerExample.dir/gstreamerworker.cpp.o.d -o CMakeFiles/QtGstreamerExample.dir/gstreamerworker.cpp.o -c /home/gunnar/code/GStreamerWorker/gstreamerworker.cpp

CMakeFiles/QtGstreamerExample.dir/gstreamerworker.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/QtGstreamerExample.dir/gstreamerworker.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/gunnar/code/GStreamerWorker/gstreamerworker.cpp > CMakeFiles/QtGstreamerExample.dir/gstreamerworker.cpp.i

CMakeFiles/QtGstreamerExample.dir/gstreamerworker.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/QtGstreamerExample.dir/gstreamerworker.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/gunnar/code/GStreamerWorker/gstreamerworker.cpp -o CMakeFiles/QtGstreamerExample.dir/gstreamerworker.cpp.s

# Object files for target QtGstreamerExample
QtGstreamerExample_OBJECTS = \
"CMakeFiles/QtGstreamerExample.dir/QtGstreamerExample_autogen/mocs_compilation.cpp.o" \
"CMakeFiles/QtGstreamerExample.dir/main.cpp.o" \
"CMakeFiles/QtGstreamerExample.dir/gstreamerworker.cpp.o"

# External object files for target QtGstreamerExample
QtGstreamerExample_EXTERNAL_OBJECTS =

QtGstreamerExample: CMakeFiles/QtGstreamerExample.dir/QtGstreamerExample_autogen/mocs_compilation.cpp.o
QtGstreamerExample: CMakeFiles/QtGstreamerExample.dir/main.cpp.o
QtGstreamerExample: CMakeFiles/QtGstreamerExample.dir/gstreamerworker.cpp.o
QtGstreamerExample: CMakeFiles/QtGstreamerExample.dir/build.make
QtGstreamerExample: /usr/lib/x86_64-linux-gnu/libQt5Widgets.so.5.15.3
QtGstreamerExample: /usr/lib/x86_64-linux-gnu/libQt5Gui.so.5.15.3
QtGstreamerExample: /usr/lib/x86_64-linux-gnu/libQt5Core.so.5.15.3
QtGstreamerExample: CMakeFiles/QtGstreamerExample.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/gunnar/code/GStreamerWorker/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Linking CXX executable QtGstreamerExample"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/QtGstreamerExample.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/QtGstreamerExample.dir/build: QtGstreamerExample
.PHONY : CMakeFiles/QtGstreamerExample.dir/build

CMakeFiles/QtGstreamerExample.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/QtGstreamerExample.dir/cmake_clean.cmake
.PHONY : CMakeFiles/QtGstreamerExample.dir/clean

CMakeFiles/QtGstreamerExample.dir/depend:
	cd /home/gunnar/code/GStreamerWorker/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/gunnar/code/GStreamerWorker /home/gunnar/code/GStreamerWorker /home/gunnar/code/GStreamerWorker/build /home/gunnar/code/GStreamerWorker/build /home/gunnar/code/GStreamerWorker/build/CMakeFiles/QtGstreamerExample.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/QtGstreamerExample.dir/depend

