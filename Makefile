# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.22

# Default target executed when no arguments are given to make.
default_target: all
.PHONY : default_target

# Allow only one "make -f Makefile2" at a time, but pass parallelism.
.NOTPARALLEL:

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
CMAKE_COMMAND = /Applications/CLion.app/Contents/bin/cmake/mac/bin/cmake

# The command to remove a file.
RM = /Applications/CLion.app/Contents/bin/cmake/mac/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/genertorg/git/real_time_object_detection

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/genertorg/git/real_time_object_detection

#=============================================================================
# Targets provided globally by CMake.

# Special rule for the target edit_cache
edit_cache:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --cyan "No interactive CMake dialog available..."
	/Applications/CLion.app/Contents/bin/cmake/mac/bin/cmake -E echo No\ interactive\ CMake\ dialog\ available.
.PHONY : edit_cache

# Special rule for the target edit_cache
edit_cache/fast: edit_cache
.PHONY : edit_cache/fast

# Special rule for the target rebuild_cache
rebuild_cache:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --cyan "Running CMake to regenerate build system..."
	/Applications/CLion.app/Contents/bin/cmake/mac/bin/cmake --regenerate-during-build -S$(CMAKE_SOURCE_DIR) -B$(CMAKE_BINARY_DIR)
.PHONY : rebuild_cache

# Special rule for the target rebuild_cache
rebuild_cache/fast: rebuild_cache
.PHONY : rebuild_cache/fast

# The main all target
all: cmake_check_build_system
	$(CMAKE_COMMAND) -E cmake_progress_start /Users/genertorg/git/real_time_object_detection/CMakeFiles /Users/genertorg/git/real_time_object_detection//CMakeFiles/progress.marks
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 all
	$(CMAKE_COMMAND) -E cmake_progress_start /Users/genertorg/git/real_time_object_detection/CMakeFiles 0
.PHONY : all

# The main clean target
clean:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 clean
.PHONY : clean

# The main clean target
clean/fast: clean
.PHONY : clean/fast

# Prepare targets for installation.
preinstall: all
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 preinstall
.PHONY : preinstall

# Prepare targets for installation.
preinstall/fast:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 preinstall
.PHONY : preinstall/fast

# clear depends
depend:
	$(CMAKE_COMMAND) -S$(CMAKE_SOURCE_DIR) -B$(CMAKE_BINARY_DIR) --check-build-system CMakeFiles/Makefile.cmake 1
.PHONY : depend

#=============================================================================
# Target rules for targets named receiver

# Build rule for target.
receiver: cmake_check_build_system
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 receiver
.PHONY : receiver

# fast build rule for target.
receiver/fast:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/receiver.dir/build.make CMakeFiles/receiver.dir/build
.PHONY : receiver/fast

receiver.o: receiver.cpp.o
.PHONY : receiver.o

# target to build an object file
receiver.cpp.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/receiver.dir/build.make CMakeFiles/receiver.dir/receiver.cpp.o
.PHONY : receiver.cpp.o

receiver.i: receiver.cpp.i
.PHONY : receiver.i

# target to preprocess a source file
receiver.cpp.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/receiver.dir/build.make CMakeFiles/receiver.dir/receiver.cpp.i
.PHONY : receiver.cpp.i

receiver.s: receiver.cpp.s
.PHONY : receiver.s

# target to generate assembly for a file
receiver.cpp.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/receiver.dir/build.make CMakeFiles/receiver.dir/receiver.cpp.s
.PHONY : receiver.cpp.s

src/h264decoder.o: src/h264decoder.cpp.o
.PHONY : src/h264decoder.o

# target to build an object file
src/h264decoder.cpp.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/receiver.dir/build.make CMakeFiles/receiver.dir/src/h264decoder.cpp.o
.PHONY : src/h264decoder.cpp.o

src/h264decoder.i: src/h264decoder.cpp.i
.PHONY : src/h264decoder.i

# target to preprocess a source file
src/h264decoder.cpp.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/receiver.dir/build.make CMakeFiles/receiver.dir/src/h264decoder.cpp.i
.PHONY : src/h264decoder.cpp.i

src/h264decoder.s: src/h264decoder.cpp.s
.PHONY : src/h264decoder.s

# target to generate assembly for a file
src/h264decoder.cpp.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/receiver.dir/build.make CMakeFiles/receiver.dir/src/h264decoder.cpp.s
.PHONY : src/h264decoder.cpp.s

src/udpclient.o: src/udpclient.cpp.o
.PHONY : src/udpclient.o

# target to build an object file
src/udpclient.cpp.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/receiver.dir/build.make CMakeFiles/receiver.dir/src/udpclient.cpp.o
.PHONY : src/udpclient.cpp.o

src/udpclient.i: src/udpclient.cpp.i
.PHONY : src/udpclient.i

# target to preprocess a source file
src/udpclient.cpp.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/receiver.dir/build.make CMakeFiles/receiver.dir/src/udpclient.cpp.i
.PHONY : src/udpclient.cpp.i

src/udpclient.s: src/udpclient.cpp.s
.PHONY : src/udpclient.s

# target to generate assembly for a file
src/udpclient.cpp.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/receiver.dir/build.make CMakeFiles/receiver.dir/src/udpclient.cpp.s
.PHONY : src/udpclient.cpp.s

# Help Target
help:
	@echo "The following are some of the valid targets for this Makefile:"
	@echo "... all (the default if no target is provided)"
	@echo "... clean"
	@echo "... depend"
	@echo "... edit_cache"
	@echo "... rebuild_cache"
	@echo "... receiver"
	@echo "... receiver.o"
	@echo "... receiver.i"
	@echo "... receiver.s"
	@echo "... src/h264decoder.o"
	@echo "... src/h264decoder.i"
	@echo "... src/h264decoder.s"
	@echo "... src/udpclient.o"
	@echo "... src/udpclient.i"
	@echo "... src/udpclient.s"
.PHONY : help



#=============================================================================
# Special targets to cleanup operation of make.

# Special rule to run CMake to check the build system integrity.
# No rule that depends on this can have commands that come from listfiles
# because they might be regenerated.
cmake_check_build_system:
	$(CMAKE_COMMAND) -S$(CMAKE_SOURCE_DIR) -B$(CMAKE_BINARY_DIR) --check-build-system CMakeFiles/Makefile.cmake 0
.PHONY : cmake_check_build_system

