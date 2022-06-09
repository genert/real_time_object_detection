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

src/H264SwDecApi.o: src/H264SwDecApi.c.o
.PHONY : src/H264SwDecApi.o

# target to build an object file
src/H264SwDecApi.c.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/receiver.dir/build.make CMakeFiles/receiver.dir/src/H264SwDecApi.c.o
.PHONY : src/H264SwDecApi.c.o

src/H264SwDecApi.i: src/H264SwDecApi.c.i
.PHONY : src/H264SwDecApi.i

# target to preprocess a source file
src/H264SwDecApi.c.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/receiver.dir/build.make CMakeFiles/receiver.dir/src/H264SwDecApi.c.i
.PHONY : src/H264SwDecApi.c.i

src/H264SwDecApi.s: src/H264SwDecApi.c.s
.PHONY : src/H264SwDecApi.s

# target to generate assembly for a file
src/H264SwDecApi.c.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/receiver.dir/build.make CMakeFiles/receiver.dir/src/H264SwDecApi.c.s
.PHONY : src/H264SwDecApi.c.s

src/extraFlags.o: src/extraFlags.c.o
.PHONY : src/extraFlags.o

# target to build an object file
src/extraFlags.c.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/receiver.dir/build.make CMakeFiles/receiver.dir/src/extraFlags.c.o
.PHONY : src/extraFlags.c.o

src/extraFlags.i: src/extraFlags.c.i
.PHONY : src/extraFlags.i

# target to preprocess a source file
src/extraFlags.c.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/receiver.dir/build.make CMakeFiles/receiver.dir/src/extraFlags.c.i
.PHONY : src/extraFlags.c.i

src/extraFlags.s: src/extraFlags.c.s
.PHONY : src/extraFlags.s

# target to generate assembly for a file
src/extraFlags.c.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/receiver.dir/build.make CMakeFiles/receiver.dir/src/extraFlags.c.s
.PHONY : src/extraFlags.c.s

src/h264bsd_byte_stream.o: src/h264bsd_byte_stream.c.o
.PHONY : src/h264bsd_byte_stream.o

# target to build an object file
src/h264bsd_byte_stream.c.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/receiver.dir/build.make CMakeFiles/receiver.dir/src/h264bsd_byte_stream.c.o
.PHONY : src/h264bsd_byte_stream.c.o

src/h264bsd_byte_stream.i: src/h264bsd_byte_stream.c.i
.PHONY : src/h264bsd_byte_stream.i

# target to preprocess a source file
src/h264bsd_byte_stream.c.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/receiver.dir/build.make CMakeFiles/receiver.dir/src/h264bsd_byte_stream.c.i
.PHONY : src/h264bsd_byte_stream.c.i

src/h264bsd_byte_stream.s: src/h264bsd_byte_stream.c.s
.PHONY : src/h264bsd_byte_stream.s

# target to generate assembly for a file
src/h264bsd_byte_stream.c.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/receiver.dir/build.make CMakeFiles/receiver.dir/src/h264bsd_byte_stream.c.s
.PHONY : src/h264bsd_byte_stream.c.s

src/h264bsd_cavlc.o: src/h264bsd_cavlc.c.o
.PHONY : src/h264bsd_cavlc.o

# target to build an object file
src/h264bsd_cavlc.c.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/receiver.dir/build.make CMakeFiles/receiver.dir/src/h264bsd_cavlc.c.o
.PHONY : src/h264bsd_cavlc.c.o

src/h264bsd_cavlc.i: src/h264bsd_cavlc.c.i
.PHONY : src/h264bsd_cavlc.i

# target to preprocess a source file
src/h264bsd_cavlc.c.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/receiver.dir/build.make CMakeFiles/receiver.dir/src/h264bsd_cavlc.c.i
.PHONY : src/h264bsd_cavlc.c.i

src/h264bsd_cavlc.s: src/h264bsd_cavlc.c.s
.PHONY : src/h264bsd_cavlc.s

# target to generate assembly for a file
src/h264bsd_cavlc.c.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/receiver.dir/build.make CMakeFiles/receiver.dir/src/h264bsd_cavlc.c.s
.PHONY : src/h264bsd_cavlc.c.s

src/h264bsd_conceal.o: src/h264bsd_conceal.c.o
.PHONY : src/h264bsd_conceal.o

# target to build an object file
src/h264bsd_conceal.c.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/receiver.dir/build.make CMakeFiles/receiver.dir/src/h264bsd_conceal.c.o
.PHONY : src/h264bsd_conceal.c.o

src/h264bsd_conceal.i: src/h264bsd_conceal.c.i
.PHONY : src/h264bsd_conceal.i

# target to preprocess a source file
src/h264bsd_conceal.c.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/receiver.dir/build.make CMakeFiles/receiver.dir/src/h264bsd_conceal.c.i
.PHONY : src/h264bsd_conceal.c.i

src/h264bsd_conceal.s: src/h264bsd_conceal.c.s
.PHONY : src/h264bsd_conceal.s

# target to generate assembly for a file
src/h264bsd_conceal.c.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/receiver.dir/build.make CMakeFiles/receiver.dir/src/h264bsd_conceal.c.s
.PHONY : src/h264bsd_conceal.c.s

src/h264bsd_deblocking.o: src/h264bsd_deblocking.c.o
.PHONY : src/h264bsd_deblocking.o

# target to build an object file
src/h264bsd_deblocking.c.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/receiver.dir/build.make CMakeFiles/receiver.dir/src/h264bsd_deblocking.c.o
.PHONY : src/h264bsd_deblocking.c.o

src/h264bsd_deblocking.i: src/h264bsd_deblocking.c.i
.PHONY : src/h264bsd_deblocking.i

# target to preprocess a source file
src/h264bsd_deblocking.c.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/receiver.dir/build.make CMakeFiles/receiver.dir/src/h264bsd_deblocking.c.i
.PHONY : src/h264bsd_deblocking.c.i

src/h264bsd_deblocking.s: src/h264bsd_deblocking.c.s
.PHONY : src/h264bsd_deblocking.s

# target to generate assembly for a file
src/h264bsd_deblocking.c.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/receiver.dir/build.make CMakeFiles/receiver.dir/src/h264bsd_deblocking.c.s
.PHONY : src/h264bsd_deblocking.c.s

src/h264bsd_decoder.o: src/h264bsd_decoder.c.o
.PHONY : src/h264bsd_decoder.o

# target to build an object file
src/h264bsd_decoder.c.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/receiver.dir/build.make CMakeFiles/receiver.dir/src/h264bsd_decoder.c.o
.PHONY : src/h264bsd_decoder.c.o

src/h264bsd_decoder.i: src/h264bsd_decoder.c.i
.PHONY : src/h264bsd_decoder.i

# target to preprocess a source file
src/h264bsd_decoder.c.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/receiver.dir/build.make CMakeFiles/receiver.dir/src/h264bsd_decoder.c.i
.PHONY : src/h264bsd_decoder.c.i

src/h264bsd_decoder.s: src/h264bsd_decoder.c.s
.PHONY : src/h264bsd_decoder.s

# target to generate assembly for a file
src/h264bsd_decoder.c.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/receiver.dir/build.make CMakeFiles/receiver.dir/src/h264bsd_decoder.c.s
.PHONY : src/h264bsd_decoder.c.s

src/h264bsd_dpb.o: src/h264bsd_dpb.c.o
.PHONY : src/h264bsd_dpb.o

# target to build an object file
src/h264bsd_dpb.c.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/receiver.dir/build.make CMakeFiles/receiver.dir/src/h264bsd_dpb.c.o
.PHONY : src/h264bsd_dpb.c.o

src/h264bsd_dpb.i: src/h264bsd_dpb.c.i
.PHONY : src/h264bsd_dpb.i

# target to preprocess a source file
src/h264bsd_dpb.c.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/receiver.dir/build.make CMakeFiles/receiver.dir/src/h264bsd_dpb.c.i
.PHONY : src/h264bsd_dpb.c.i

src/h264bsd_dpb.s: src/h264bsd_dpb.c.s
.PHONY : src/h264bsd_dpb.s

# target to generate assembly for a file
src/h264bsd_dpb.c.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/receiver.dir/build.make CMakeFiles/receiver.dir/src/h264bsd_dpb.c.s
.PHONY : src/h264bsd_dpb.c.s

src/h264bsd_image.o: src/h264bsd_image.c.o
.PHONY : src/h264bsd_image.o

# target to build an object file
src/h264bsd_image.c.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/receiver.dir/build.make CMakeFiles/receiver.dir/src/h264bsd_image.c.o
.PHONY : src/h264bsd_image.c.o

src/h264bsd_image.i: src/h264bsd_image.c.i
.PHONY : src/h264bsd_image.i

# target to preprocess a source file
src/h264bsd_image.c.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/receiver.dir/build.make CMakeFiles/receiver.dir/src/h264bsd_image.c.i
.PHONY : src/h264bsd_image.c.i

src/h264bsd_image.s: src/h264bsd_image.c.s
.PHONY : src/h264bsd_image.s

# target to generate assembly for a file
src/h264bsd_image.c.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/receiver.dir/build.make CMakeFiles/receiver.dir/src/h264bsd_image.c.s
.PHONY : src/h264bsd_image.c.s

src/h264bsd_inter_prediction.o: src/h264bsd_inter_prediction.c.o
.PHONY : src/h264bsd_inter_prediction.o

# target to build an object file
src/h264bsd_inter_prediction.c.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/receiver.dir/build.make CMakeFiles/receiver.dir/src/h264bsd_inter_prediction.c.o
.PHONY : src/h264bsd_inter_prediction.c.o

src/h264bsd_inter_prediction.i: src/h264bsd_inter_prediction.c.i
.PHONY : src/h264bsd_inter_prediction.i

# target to preprocess a source file
src/h264bsd_inter_prediction.c.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/receiver.dir/build.make CMakeFiles/receiver.dir/src/h264bsd_inter_prediction.c.i
.PHONY : src/h264bsd_inter_prediction.c.i

src/h264bsd_inter_prediction.s: src/h264bsd_inter_prediction.c.s
.PHONY : src/h264bsd_inter_prediction.s

# target to generate assembly for a file
src/h264bsd_inter_prediction.c.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/receiver.dir/build.make CMakeFiles/receiver.dir/src/h264bsd_inter_prediction.c.s
.PHONY : src/h264bsd_inter_prediction.c.s

src/h264bsd_intra_prediction.o: src/h264bsd_intra_prediction.c.o
.PHONY : src/h264bsd_intra_prediction.o

# target to build an object file
src/h264bsd_intra_prediction.c.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/receiver.dir/build.make CMakeFiles/receiver.dir/src/h264bsd_intra_prediction.c.o
.PHONY : src/h264bsd_intra_prediction.c.o

src/h264bsd_intra_prediction.i: src/h264bsd_intra_prediction.c.i
.PHONY : src/h264bsd_intra_prediction.i

# target to preprocess a source file
src/h264bsd_intra_prediction.c.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/receiver.dir/build.make CMakeFiles/receiver.dir/src/h264bsd_intra_prediction.c.i
.PHONY : src/h264bsd_intra_prediction.c.i

src/h264bsd_intra_prediction.s: src/h264bsd_intra_prediction.c.s
.PHONY : src/h264bsd_intra_prediction.s

# target to generate assembly for a file
src/h264bsd_intra_prediction.c.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/receiver.dir/build.make CMakeFiles/receiver.dir/src/h264bsd_intra_prediction.c.s
.PHONY : src/h264bsd_intra_prediction.c.s

src/h264bsd_macroblock_layer.o: src/h264bsd_macroblock_layer.c.o
.PHONY : src/h264bsd_macroblock_layer.o

# target to build an object file
src/h264bsd_macroblock_layer.c.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/receiver.dir/build.make CMakeFiles/receiver.dir/src/h264bsd_macroblock_layer.c.o
.PHONY : src/h264bsd_macroblock_layer.c.o

src/h264bsd_macroblock_layer.i: src/h264bsd_macroblock_layer.c.i
.PHONY : src/h264bsd_macroblock_layer.i

# target to preprocess a source file
src/h264bsd_macroblock_layer.c.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/receiver.dir/build.make CMakeFiles/receiver.dir/src/h264bsd_macroblock_layer.c.i
.PHONY : src/h264bsd_macroblock_layer.c.i

src/h264bsd_macroblock_layer.s: src/h264bsd_macroblock_layer.c.s
.PHONY : src/h264bsd_macroblock_layer.s

# target to generate assembly for a file
src/h264bsd_macroblock_layer.c.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/receiver.dir/build.make CMakeFiles/receiver.dir/src/h264bsd_macroblock_layer.c.s
.PHONY : src/h264bsd_macroblock_layer.c.s

src/h264bsd_nal_unit.o: src/h264bsd_nal_unit.c.o
.PHONY : src/h264bsd_nal_unit.o

# target to build an object file
src/h264bsd_nal_unit.c.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/receiver.dir/build.make CMakeFiles/receiver.dir/src/h264bsd_nal_unit.c.o
.PHONY : src/h264bsd_nal_unit.c.o

src/h264bsd_nal_unit.i: src/h264bsd_nal_unit.c.i
.PHONY : src/h264bsd_nal_unit.i

# target to preprocess a source file
src/h264bsd_nal_unit.c.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/receiver.dir/build.make CMakeFiles/receiver.dir/src/h264bsd_nal_unit.c.i
.PHONY : src/h264bsd_nal_unit.c.i

src/h264bsd_nal_unit.s: src/h264bsd_nal_unit.c.s
.PHONY : src/h264bsd_nal_unit.s

# target to generate assembly for a file
src/h264bsd_nal_unit.c.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/receiver.dir/build.make CMakeFiles/receiver.dir/src/h264bsd_nal_unit.c.s
.PHONY : src/h264bsd_nal_unit.c.s

src/h264bsd_neighbour.o: src/h264bsd_neighbour.c.o
.PHONY : src/h264bsd_neighbour.o

# target to build an object file
src/h264bsd_neighbour.c.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/receiver.dir/build.make CMakeFiles/receiver.dir/src/h264bsd_neighbour.c.o
.PHONY : src/h264bsd_neighbour.c.o

src/h264bsd_neighbour.i: src/h264bsd_neighbour.c.i
.PHONY : src/h264bsd_neighbour.i

# target to preprocess a source file
src/h264bsd_neighbour.c.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/receiver.dir/build.make CMakeFiles/receiver.dir/src/h264bsd_neighbour.c.i
.PHONY : src/h264bsd_neighbour.c.i

src/h264bsd_neighbour.s: src/h264bsd_neighbour.c.s
.PHONY : src/h264bsd_neighbour.s

# target to generate assembly for a file
src/h264bsd_neighbour.c.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/receiver.dir/build.make CMakeFiles/receiver.dir/src/h264bsd_neighbour.c.s
.PHONY : src/h264bsd_neighbour.c.s

src/h264bsd_pic_order_cnt.o: src/h264bsd_pic_order_cnt.c.o
.PHONY : src/h264bsd_pic_order_cnt.o

# target to build an object file
src/h264bsd_pic_order_cnt.c.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/receiver.dir/build.make CMakeFiles/receiver.dir/src/h264bsd_pic_order_cnt.c.o
.PHONY : src/h264bsd_pic_order_cnt.c.o

src/h264bsd_pic_order_cnt.i: src/h264bsd_pic_order_cnt.c.i
.PHONY : src/h264bsd_pic_order_cnt.i

# target to preprocess a source file
src/h264bsd_pic_order_cnt.c.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/receiver.dir/build.make CMakeFiles/receiver.dir/src/h264bsd_pic_order_cnt.c.i
.PHONY : src/h264bsd_pic_order_cnt.c.i

src/h264bsd_pic_order_cnt.s: src/h264bsd_pic_order_cnt.c.s
.PHONY : src/h264bsd_pic_order_cnt.s

# target to generate assembly for a file
src/h264bsd_pic_order_cnt.c.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/receiver.dir/build.make CMakeFiles/receiver.dir/src/h264bsd_pic_order_cnt.c.s
.PHONY : src/h264bsd_pic_order_cnt.c.s

src/h264bsd_pic_param_set.o: src/h264bsd_pic_param_set.c.o
.PHONY : src/h264bsd_pic_param_set.o

# target to build an object file
src/h264bsd_pic_param_set.c.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/receiver.dir/build.make CMakeFiles/receiver.dir/src/h264bsd_pic_param_set.c.o
.PHONY : src/h264bsd_pic_param_set.c.o

src/h264bsd_pic_param_set.i: src/h264bsd_pic_param_set.c.i
.PHONY : src/h264bsd_pic_param_set.i

# target to preprocess a source file
src/h264bsd_pic_param_set.c.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/receiver.dir/build.make CMakeFiles/receiver.dir/src/h264bsd_pic_param_set.c.i
.PHONY : src/h264bsd_pic_param_set.c.i

src/h264bsd_pic_param_set.s: src/h264bsd_pic_param_set.c.s
.PHONY : src/h264bsd_pic_param_set.s

# target to generate assembly for a file
src/h264bsd_pic_param_set.c.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/receiver.dir/build.make CMakeFiles/receiver.dir/src/h264bsd_pic_param_set.c.s
.PHONY : src/h264bsd_pic_param_set.c.s

src/h264bsd_reconstruct.o: src/h264bsd_reconstruct.c.o
.PHONY : src/h264bsd_reconstruct.o

# target to build an object file
src/h264bsd_reconstruct.c.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/receiver.dir/build.make CMakeFiles/receiver.dir/src/h264bsd_reconstruct.c.o
.PHONY : src/h264bsd_reconstruct.c.o

src/h264bsd_reconstruct.i: src/h264bsd_reconstruct.c.i
.PHONY : src/h264bsd_reconstruct.i

# target to preprocess a source file
src/h264bsd_reconstruct.c.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/receiver.dir/build.make CMakeFiles/receiver.dir/src/h264bsd_reconstruct.c.i
.PHONY : src/h264bsd_reconstruct.c.i

src/h264bsd_reconstruct.s: src/h264bsd_reconstruct.c.s
.PHONY : src/h264bsd_reconstruct.s

# target to generate assembly for a file
src/h264bsd_reconstruct.c.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/receiver.dir/build.make CMakeFiles/receiver.dir/src/h264bsd_reconstruct.c.s
.PHONY : src/h264bsd_reconstruct.c.s

src/h264bsd_seq_param_set.o: src/h264bsd_seq_param_set.c.o
.PHONY : src/h264bsd_seq_param_set.o

# target to build an object file
src/h264bsd_seq_param_set.c.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/receiver.dir/build.make CMakeFiles/receiver.dir/src/h264bsd_seq_param_set.c.o
.PHONY : src/h264bsd_seq_param_set.c.o

src/h264bsd_seq_param_set.i: src/h264bsd_seq_param_set.c.i
.PHONY : src/h264bsd_seq_param_set.i

# target to preprocess a source file
src/h264bsd_seq_param_set.c.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/receiver.dir/build.make CMakeFiles/receiver.dir/src/h264bsd_seq_param_set.c.i
.PHONY : src/h264bsd_seq_param_set.c.i

src/h264bsd_seq_param_set.s: src/h264bsd_seq_param_set.c.s
.PHONY : src/h264bsd_seq_param_set.s

# target to generate assembly for a file
src/h264bsd_seq_param_set.c.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/receiver.dir/build.make CMakeFiles/receiver.dir/src/h264bsd_seq_param_set.c.s
.PHONY : src/h264bsd_seq_param_set.c.s

src/h264bsd_slice_data.o: src/h264bsd_slice_data.c.o
.PHONY : src/h264bsd_slice_data.o

# target to build an object file
src/h264bsd_slice_data.c.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/receiver.dir/build.make CMakeFiles/receiver.dir/src/h264bsd_slice_data.c.o
.PHONY : src/h264bsd_slice_data.c.o

src/h264bsd_slice_data.i: src/h264bsd_slice_data.c.i
.PHONY : src/h264bsd_slice_data.i

# target to preprocess a source file
src/h264bsd_slice_data.c.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/receiver.dir/build.make CMakeFiles/receiver.dir/src/h264bsd_slice_data.c.i
.PHONY : src/h264bsd_slice_data.c.i

src/h264bsd_slice_data.s: src/h264bsd_slice_data.c.s
.PHONY : src/h264bsd_slice_data.s

# target to generate assembly for a file
src/h264bsd_slice_data.c.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/receiver.dir/build.make CMakeFiles/receiver.dir/src/h264bsd_slice_data.c.s
.PHONY : src/h264bsd_slice_data.c.s

src/h264bsd_slice_group_map.o: src/h264bsd_slice_group_map.c.o
.PHONY : src/h264bsd_slice_group_map.o

# target to build an object file
src/h264bsd_slice_group_map.c.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/receiver.dir/build.make CMakeFiles/receiver.dir/src/h264bsd_slice_group_map.c.o
.PHONY : src/h264bsd_slice_group_map.c.o

src/h264bsd_slice_group_map.i: src/h264bsd_slice_group_map.c.i
.PHONY : src/h264bsd_slice_group_map.i

# target to preprocess a source file
src/h264bsd_slice_group_map.c.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/receiver.dir/build.make CMakeFiles/receiver.dir/src/h264bsd_slice_group_map.c.i
.PHONY : src/h264bsd_slice_group_map.c.i

src/h264bsd_slice_group_map.s: src/h264bsd_slice_group_map.c.s
.PHONY : src/h264bsd_slice_group_map.s

# target to generate assembly for a file
src/h264bsd_slice_group_map.c.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/receiver.dir/build.make CMakeFiles/receiver.dir/src/h264bsd_slice_group_map.c.s
.PHONY : src/h264bsd_slice_group_map.c.s

src/h264bsd_slice_header.o: src/h264bsd_slice_header.c.o
.PHONY : src/h264bsd_slice_header.o

# target to build an object file
src/h264bsd_slice_header.c.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/receiver.dir/build.make CMakeFiles/receiver.dir/src/h264bsd_slice_header.c.o
.PHONY : src/h264bsd_slice_header.c.o

src/h264bsd_slice_header.i: src/h264bsd_slice_header.c.i
.PHONY : src/h264bsd_slice_header.i

# target to preprocess a source file
src/h264bsd_slice_header.c.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/receiver.dir/build.make CMakeFiles/receiver.dir/src/h264bsd_slice_header.c.i
.PHONY : src/h264bsd_slice_header.c.i

src/h264bsd_slice_header.s: src/h264bsd_slice_header.c.s
.PHONY : src/h264bsd_slice_header.s

# target to generate assembly for a file
src/h264bsd_slice_header.c.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/receiver.dir/build.make CMakeFiles/receiver.dir/src/h264bsd_slice_header.c.s
.PHONY : src/h264bsd_slice_header.c.s

src/h264bsd_storage.o: src/h264bsd_storage.c.o
.PHONY : src/h264bsd_storage.o

# target to build an object file
src/h264bsd_storage.c.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/receiver.dir/build.make CMakeFiles/receiver.dir/src/h264bsd_storage.c.o
.PHONY : src/h264bsd_storage.c.o

src/h264bsd_storage.i: src/h264bsd_storage.c.i
.PHONY : src/h264bsd_storage.i

# target to preprocess a source file
src/h264bsd_storage.c.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/receiver.dir/build.make CMakeFiles/receiver.dir/src/h264bsd_storage.c.i
.PHONY : src/h264bsd_storage.c.i

src/h264bsd_storage.s: src/h264bsd_storage.c.s
.PHONY : src/h264bsd_storage.s

# target to generate assembly for a file
src/h264bsd_storage.c.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/receiver.dir/build.make CMakeFiles/receiver.dir/src/h264bsd_storage.c.s
.PHONY : src/h264bsd_storage.c.s

src/h264bsd_stream.o: src/h264bsd_stream.c.o
.PHONY : src/h264bsd_stream.o

# target to build an object file
src/h264bsd_stream.c.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/receiver.dir/build.make CMakeFiles/receiver.dir/src/h264bsd_stream.c.o
.PHONY : src/h264bsd_stream.c.o

src/h264bsd_stream.i: src/h264bsd_stream.c.i
.PHONY : src/h264bsd_stream.i

# target to preprocess a source file
src/h264bsd_stream.c.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/receiver.dir/build.make CMakeFiles/receiver.dir/src/h264bsd_stream.c.i
.PHONY : src/h264bsd_stream.c.i

src/h264bsd_stream.s: src/h264bsd_stream.c.s
.PHONY : src/h264bsd_stream.s

# target to generate assembly for a file
src/h264bsd_stream.c.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/receiver.dir/build.make CMakeFiles/receiver.dir/src/h264bsd_stream.c.s
.PHONY : src/h264bsd_stream.c.s

src/h264bsd_transform.o: src/h264bsd_transform.c.o
.PHONY : src/h264bsd_transform.o

# target to build an object file
src/h264bsd_transform.c.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/receiver.dir/build.make CMakeFiles/receiver.dir/src/h264bsd_transform.c.o
.PHONY : src/h264bsd_transform.c.o

src/h264bsd_transform.i: src/h264bsd_transform.c.i
.PHONY : src/h264bsd_transform.i

# target to preprocess a source file
src/h264bsd_transform.c.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/receiver.dir/build.make CMakeFiles/receiver.dir/src/h264bsd_transform.c.i
.PHONY : src/h264bsd_transform.c.i

src/h264bsd_transform.s: src/h264bsd_transform.c.s
.PHONY : src/h264bsd_transform.s

# target to generate assembly for a file
src/h264bsd_transform.c.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/receiver.dir/build.make CMakeFiles/receiver.dir/src/h264bsd_transform.c.s
.PHONY : src/h264bsd_transform.c.s

src/h264bsd_util.o: src/h264bsd_util.c.o
.PHONY : src/h264bsd_util.o

# target to build an object file
src/h264bsd_util.c.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/receiver.dir/build.make CMakeFiles/receiver.dir/src/h264bsd_util.c.o
.PHONY : src/h264bsd_util.c.o

src/h264bsd_util.i: src/h264bsd_util.c.i
.PHONY : src/h264bsd_util.i

# target to preprocess a source file
src/h264bsd_util.c.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/receiver.dir/build.make CMakeFiles/receiver.dir/src/h264bsd_util.c.i
.PHONY : src/h264bsd_util.c.i

src/h264bsd_util.s: src/h264bsd_util.c.s
.PHONY : src/h264bsd_util.s

# target to generate assembly for a file
src/h264bsd_util.c.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/receiver.dir/build.make CMakeFiles/receiver.dir/src/h264bsd_util.c.s
.PHONY : src/h264bsd_util.c.s

src/h264bsd_vlc.o: src/h264bsd_vlc.c.o
.PHONY : src/h264bsd_vlc.o

# target to build an object file
src/h264bsd_vlc.c.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/receiver.dir/build.make CMakeFiles/receiver.dir/src/h264bsd_vlc.c.o
.PHONY : src/h264bsd_vlc.c.o

src/h264bsd_vlc.i: src/h264bsd_vlc.c.i
.PHONY : src/h264bsd_vlc.i

# target to preprocess a source file
src/h264bsd_vlc.c.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/receiver.dir/build.make CMakeFiles/receiver.dir/src/h264bsd_vlc.c.i
.PHONY : src/h264bsd_vlc.c.i

src/h264bsd_vlc.s: src/h264bsd_vlc.c.s
.PHONY : src/h264bsd_vlc.s

# target to generate assembly for a file
src/h264bsd_vlc.c.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/receiver.dir/build.make CMakeFiles/receiver.dir/src/h264bsd_vlc.c.s
.PHONY : src/h264bsd_vlc.c.s

src/h264bsd_vui.o: src/h264bsd_vui.c.o
.PHONY : src/h264bsd_vui.o

# target to build an object file
src/h264bsd_vui.c.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/receiver.dir/build.make CMakeFiles/receiver.dir/src/h264bsd_vui.c.o
.PHONY : src/h264bsd_vui.c.o

src/h264bsd_vui.i: src/h264bsd_vui.c.i
.PHONY : src/h264bsd_vui.i

# target to preprocess a source file
src/h264bsd_vui.c.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/receiver.dir/build.make CMakeFiles/receiver.dir/src/h264bsd_vui.c.i
.PHONY : src/h264bsd_vui.c.i

src/h264bsd_vui.s: src/h264bsd_vui.c.s
.PHONY : src/h264bsd_vui.s

# target to generate assembly for a file
src/h264bsd_vui.c.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/receiver.dir/build.make CMakeFiles/receiver.dir/src/h264bsd_vui.c.s
.PHONY : src/h264bsd_vui.c.s

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
	@echo "... src/H264SwDecApi.o"
	@echo "... src/H264SwDecApi.i"
	@echo "... src/H264SwDecApi.s"
	@echo "... src/extraFlags.o"
	@echo "... src/extraFlags.i"
	@echo "... src/extraFlags.s"
	@echo "... src/h264bsd_byte_stream.o"
	@echo "... src/h264bsd_byte_stream.i"
	@echo "... src/h264bsd_byte_stream.s"
	@echo "... src/h264bsd_cavlc.o"
	@echo "... src/h264bsd_cavlc.i"
	@echo "... src/h264bsd_cavlc.s"
	@echo "... src/h264bsd_conceal.o"
	@echo "... src/h264bsd_conceal.i"
	@echo "... src/h264bsd_conceal.s"
	@echo "... src/h264bsd_deblocking.o"
	@echo "... src/h264bsd_deblocking.i"
	@echo "... src/h264bsd_deblocking.s"
	@echo "... src/h264bsd_decoder.o"
	@echo "... src/h264bsd_decoder.i"
	@echo "... src/h264bsd_decoder.s"
	@echo "... src/h264bsd_dpb.o"
	@echo "... src/h264bsd_dpb.i"
	@echo "... src/h264bsd_dpb.s"
	@echo "... src/h264bsd_image.o"
	@echo "... src/h264bsd_image.i"
	@echo "... src/h264bsd_image.s"
	@echo "... src/h264bsd_inter_prediction.o"
	@echo "... src/h264bsd_inter_prediction.i"
	@echo "... src/h264bsd_inter_prediction.s"
	@echo "... src/h264bsd_intra_prediction.o"
	@echo "... src/h264bsd_intra_prediction.i"
	@echo "... src/h264bsd_intra_prediction.s"
	@echo "... src/h264bsd_macroblock_layer.o"
	@echo "... src/h264bsd_macroblock_layer.i"
	@echo "... src/h264bsd_macroblock_layer.s"
	@echo "... src/h264bsd_nal_unit.o"
	@echo "... src/h264bsd_nal_unit.i"
	@echo "... src/h264bsd_nal_unit.s"
	@echo "... src/h264bsd_neighbour.o"
	@echo "... src/h264bsd_neighbour.i"
	@echo "... src/h264bsd_neighbour.s"
	@echo "... src/h264bsd_pic_order_cnt.o"
	@echo "... src/h264bsd_pic_order_cnt.i"
	@echo "... src/h264bsd_pic_order_cnt.s"
	@echo "... src/h264bsd_pic_param_set.o"
	@echo "... src/h264bsd_pic_param_set.i"
	@echo "... src/h264bsd_pic_param_set.s"
	@echo "... src/h264bsd_reconstruct.o"
	@echo "... src/h264bsd_reconstruct.i"
	@echo "... src/h264bsd_reconstruct.s"
	@echo "... src/h264bsd_seq_param_set.o"
	@echo "... src/h264bsd_seq_param_set.i"
	@echo "... src/h264bsd_seq_param_set.s"
	@echo "... src/h264bsd_slice_data.o"
	@echo "... src/h264bsd_slice_data.i"
	@echo "... src/h264bsd_slice_data.s"
	@echo "... src/h264bsd_slice_group_map.o"
	@echo "... src/h264bsd_slice_group_map.i"
	@echo "... src/h264bsd_slice_group_map.s"
	@echo "... src/h264bsd_slice_header.o"
	@echo "... src/h264bsd_slice_header.i"
	@echo "... src/h264bsd_slice_header.s"
	@echo "... src/h264bsd_storage.o"
	@echo "... src/h264bsd_storage.i"
	@echo "... src/h264bsd_storage.s"
	@echo "... src/h264bsd_stream.o"
	@echo "... src/h264bsd_stream.i"
	@echo "... src/h264bsd_stream.s"
	@echo "... src/h264bsd_transform.o"
	@echo "... src/h264bsd_transform.i"
	@echo "... src/h264bsd_transform.s"
	@echo "... src/h264bsd_util.o"
	@echo "... src/h264bsd_util.i"
	@echo "... src/h264bsd_util.s"
	@echo "... src/h264bsd_vlc.o"
	@echo "... src/h264bsd_vlc.i"
	@echo "... src/h264bsd_vlc.s"
	@echo "... src/h264bsd_vui.o"
	@echo "... src/h264bsd_vui.i"
	@echo "... src/h264bsd_vui.s"
.PHONY : help



#=============================================================================
# Special targets to cleanup operation of make.

# Special rule to run CMake to check the build system integrity.
# No rule that depends on this can have commands that come from listfiles
# because they might be regenerated.
cmake_check_build_system:
	$(CMAKE_COMMAND) -S$(CMAKE_SOURCE_DIR) -B$(CMAKE_BINARY_DIR) --check-build-system CMakeFiles/Makefile.cmake 0
.PHONY : cmake_check_build_system

