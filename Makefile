# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.23

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
CMAKE_COMMAND = /opt/homebrew/Cellar/cmake/3.23.2/bin/cmake

# The command to remove a file.
RM = /opt/homebrew/Cellar/cmake/3.23.2/bin/cmake -E rm -f

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
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --cyan "Running CMake cache editor..."
	/opt/homebrew/Cellar/cmake/3.23.2/bin/ccmake -S$(CMAKE_SOURCE_DIR) -B$(CMAKE_BINARY_DIR)
.PHONY : edit_cache

# Special rule for the target edit_cache
edit_cache/fast: edit_cache
.PHONY : edit_cache/fast

# Special rule for the target rebuild_cache
rebuild_cache:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --cyan "Running CMake to regenerate build system..."
	/opt/homebrew/Cellar/cmake/3.23.2/bin/cmake --regenerate-during-build -S$(CMAKE_SOURCE_DIR) -B$(CMAKE_BINARY_DIR)
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

src/Decoder.o: src/Decoder.cpp.o
.PHONY : src/Decoder.o

# target to build an object file
src/Decoder.cpp.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/receiver.dir/build.make CMakeFiles/receiver.dir/src/Decoder.cpp.o
.PHONY : src/Decoder.cpp.o

src/Decoder.i: src/Decoder.cpp.i
.PHONY : src/Decoder.i

# target to preprocess a source file
src/Decoder.cpp.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/receiver.dir/build.make CMakeFiles/receiver.dir/src/Decoder.cpp.i
.PHONY : src/Decoder.cpp.i

src/Decoder.s: src/Decoder.cpp.s
.PHONY : src/Decoder.s

# target to generate assembly for a file
src/Decoder.cpp.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/receiver.dir/build.make CMakeFiles/receiver.dir/src/Decoder.cpp.s
.PHONY : src/Decoder.cpp.s

src/Streamer.o: src/Streamer.cpp.o
.PHONY : src/Streamer.o

# target to build an object file
src/Streamer.cpp.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/receiver.dir/build.make CMakeFiles/receiver.dir/src/Streamer.cpp.o
.PHONY : src/Streamer.cpp.o

src/Streamer.i: src/Streamer.cpp.i
.PHONY : src/Streamer.i

# target to preprocess a source file
src/Streamer.cpp.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/receiver.dir/build.make CMakeFiles/receiver.dir/src/Streamer.cpp.i
.PHONY : src/Streamer.cpp.i

src/Streamer.s: src/Streamer.cpp.s
.PHONY : src/Streamer.s

# target to generate assembly for a file
src/Streamer.cpp.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/receiver.dir/build.make CMakeFiles/receiver.dir/src/Streamer.cpp.s
.PHONY : src/Streamer.cpp.s

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
	@echo "... src/Decoder.o"
	@echo "... src/Decoder.i"
	@echo "... src/Decoder.s"
	@echo "... src/Streamer.o"
	@echo "... src/Streamer.i"
	@echo "... src/Streamer.s"
.PHONY : help



#=============================================================================
# Special targets to cleanup operation of make.

# Special rule to run CMake to check the build system integrity.
# No rule that depends on this can have commands that come from listfiles
# because they might be regenerated.
cmake_check_build_system:
	$(CMAKE_COMMAND) -S$(CMAKE_SOURCE_DIR) -B$(CMAKE_BINARY_DIR) --check-build-system CMakeFiles/Makefile.cmake 0
.PHONY : cmake_check_build_system

