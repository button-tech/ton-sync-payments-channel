# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.15

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


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
CMAKE_COMMAND = /usr/local/Cellar/cmake/3.15.3/bin/cmake

# The command to remove a file.
RM = /usr/local/Cellar/cmake/3.15.3/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/erage/go/src/github.com/prazd/ton_build_sctipts/lite-client

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/erage/go/src/github.com/prazd/ton_build_sctipts/liteclient-build

# Include any dependencies generated for this target.
include tdtl/CMakeFiles/tdtl.dir/depend.make

# Include the progress variables for this target.
include tdtl/CMakeFiles/tdtl.dir/progress.make

# Include the compile flags for this target's objects.
include tdtl/CMakeFiles/tdtl.dir/flags.make

tdtl/CMakeFiles/tdtl.dir/td/tl/tl_config.cpp.o: tdtl/CMakeFiles/tdtl.dir/flags.make
tdtl/CMakeFiles/tdtl.dir/td/tl/tl_config.cpp.o: /Users/erage/go/src/github.com/prazd/ton_build_sctipts/lite-client/tdtl/td/tl/tl_config.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/erage/go/src/github.com/prazd/ton_build_sctipts/liteclient-build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object tdtl/CMakeFiles/tdtl.dir/td/tl/tl_config.cpp.o"
	cd /Users/erage/go/src/github.com/prazd/ton_build_sctipts/liteclient-build/tdtl && ccache /Library/Developer/CommandLineTools/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/tdtl.dir/td/tl/tl_config.cpp.o -c /Users/erage/go/src/github.com/prazd/ton_build_sctipts/lite-client/tdtl/td/tl/tl_config.cpp

tdtl/CMakeFiles/tdtl.dir/td/tl/tl_config.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/tdtl.dir/td/tl/tl_config.cpp.i"
	cd /Users/erage/go/src/github.com/prazd/ton_build_sctipts/liteclient-build/tdtl && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/erage/go/src/github.com/prazd/ton_build_sctipts/lite-client/tdtl/td/tl/tl_config.cpp > CMakeFiles/tdtl.dir/td/tl/tl_config.cpp.i

tdtl/CMakeFiles/tdtl.dir/td/tl/tl_config.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/tdtl.dir/td/tl/tl_config.cpp.s"
	cd /Users/erage/go/src/github.com/prazd/ton_build_sctipts/liteclient-build/tdtl && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/erage/go/src/github.com/prazd/ton_build_sctipts/lite-client/tdtl/td/tl/tl_config.cpp -o CMakeFiles/tdtl.dir/td/tl/tl_config.cpp.s

tdtl/CMakeFiles/tdtl.dir/td/tl/tl_core.cpp.o: tdtl/CMakeFiles/tdtl.dir/flags.make
tdtl/CMakeFiles/tdtl.dir/td/tl/tl_core.cpp.o: /Users/erage/go/src/github.com/prazd/ton_build_sctipts/lite-client/tdtl/td/tl/tl_core.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/erage/go/src/github.com/prazd/ton_build_sctipts/liteclient-build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object tdtl/CMakeFiles/tdtl.dir/td/tl/tl_core.cpp.o"
	cd /Users/erage/go/src/github.com/prazd/ton_build_sctipts/liteclient-build/tdtl && ccache /Library/Developer/CommandLineTools/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/tdtl.dir/td/tl/tl_core.cpp.o -c /Users/erage/go/src/github.com/prazd/ton_build_sctipts/lite-client/tdtl/td/tl/tl_core.cpp

tdtl/CMakeFiles/tdtl.dir/td/tl/tl_core.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/tdtl.dir/td/tl/tl_core.cpp.i"
	cd /Users/erage/go/src/github.com/prazd/ton_build_sctipts/liteclient-build/tdtl && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/erage/go/src/github.com/prazd/ton_build_sctipts/lite-client/tdtl/td/tl/tl_core.cpp > CMakeFiles/tdtl.dir/td/tl/tl_core.cpp.i

tdtl/CMakeFiles/tdtl.dir/td/tl/tl_core.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/tdtl.dir/td/tl/tl_core.cpp.s"
	cd /Users/erage/go/src/github.com/prazd/ton_build_sctipts/liteclient-build/tdtl && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/erage/go/src/github.com/prazd/ton_build_sctipts/lite-client/tdtl/td/tl/tl_core.cpp -o CMakeFiles/tdtl.dir/td/tl/tl_core.cpp.s

tdtl/CMakeFiles/tdtl.dir/td/tl/tl_file_outputer.cpp.o: tdtl/CMakeFiles/tdtl.dir/flags.make
tdtl/CMakeFiles/tdtl.dir/td/tl/tl_file_outputer.cpp.o: /Users/erage/go/src/github.com/prazd/ton_build_sctipts/lite-client/tdtl/td/tl/tl_file_outputer.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/erage/go/src/github.com/prazd/ton_build_sctipts/liteclient-build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object tdtl/CMakeFiles/tdtl.dir/td/tl/tl_file_outputer.cpp.o"
	cd /Users/erage/go/src/github.com/prazd/ton_build_sctipts/liteclient-build/tdtl && ccache /Library/Developer/CommandLineTools/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/tdtl.dir/td/tl/tl_file_outputer.cpp.o -c /Users/erage/go/src/github.com/prazd/ton_build_sctipts/lite-client/tdtl/td/tl/tl_file_outputer.cpp

tdtl/CMakeFiles/tdtl.dir/td/tl/tl_file_outputer.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/tdtl.dir/td/tl/tl_file_outputer.cpp.i"
	cd /Users/erage/go/src/github.com/prazd/ton_build_sctipts/liteclient-build/tdtl && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/erage/go/src/github.com/prazd/ton_build_sctipts/lite-client/tdtl/td/tl/tl_file_outputer.cpp > CMakeFiles/tdtl.dir/td/tl/tl_file_outputer.cpp.i

tdtl/CMakeFiles/tdtl.dir/td/tl/tl_file_outputer.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/tdtl.dir/td/tl/tl_file_outputer.cpp.s"
	cd /Users/erage/go/src/github.com/prazd/ton_build_sctipts/liteclient-build/tdtl && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/erage/go/src/github.com/prazd/ton_build_sctipts/lite-client/tdtl/td/tl/tl_file_outputer.cpp -o CMakeFiles/tdtl.dir/td/tl/tl_file_outputer.cpp.s

tdtl/CMakeFiles/tdtl.dir/td/tl/tl_file_utils.cpp.o: tdtl/CMakeFiles/tdtl.dir/flags.make
tdtl/CMakeFiles/tdtl.dir/td/tl/tl_file_utils.cpp.o: /Users/erage/go/src/github.com/prazd/ton_build_sctipts/lite-client/tdtl/td/tl/tl_file_utils.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/erage/go/src/github.com/prazd/ton_build_sctipts/liteclient-build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object tdtl/CMakeFiles/tdtl.dir/td/tl/tl_file_utils.cpp.o"
	cd /Users/erage/go/src/github.com/prazd/ton_build_sctipts/liteclient-build/tdtl && ccache /Library/Developer/CommandLineTools/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/tdtl.dir/td/tl/tl_file_utils.cpp.o -c /Users/erage/go/src/github.com/prazd/ton_build_sctipts/lite-client/tdtl/td/tl/tl_file_utils.cpp

tdtl/CMakeFiles/tdtl.dir/td/tl/tl_file_utils.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/tdtl.dir/td/tl/tl_file_utils.cpp.i"
	cd /Users/erage/go/src/github.com/prazd/ton_build_sctipts/liteclient-build/tdtl && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/erage/go/src/github.com/prazd/ton_build_sctipts/lite-client/tdtl/td/tl/tl_file_utils.cpp > CMakeFiles/tdtl.dir/td/tl/tl_file_utils.cpp.i

tdtl/CMakeFiles/tdtl.dir/td/tl/tl_file_utils.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/tdtl.dir/td/tl/tl_file_utils.cpp.s"
	cd /Users/erage/go/src/github.com/prazd/ton_build_sctipts/liteclient-build/tdtl && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/erage/go/src/github.com/prazd/ton_build_sctipts/lite-client/tdtl/td/tl/tl_file_utils.cpp -o CMakeFiles/tdtl.dir/td/tl/tl_file_utils.cpp.s

tdtl/CMakeFiles/tdtl.dir/td/tl/tl_generate.cpp.o: tdtl/CMakeFiles/tdtl.dir/flags.make
tdtl/CMakeFiles/tdtl.dir/td/tl/tl_generate.cpp.o: /Users/erage/go/src/github.com/prazd/ton_build_sctipts/lite-client/tdtl/td/tl/tl_generate.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/erage/go/src/github.com/prazd/ton_build_sctipts/liteclient-build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object tdtl/CMakeFiles/tdtl.dir/td/tl/tl_generate.cpp.o"
	cd /Users/erage/go/src/github.com/prazd/ton_build_sctipts/liteclient-build/tdtl && ccache /Library/Developer/CommandLineTools/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/tdtl.dir/td/tl/tl_generate.cpp.o -c /Users/erage/go/src/github.com/prazd/ton_build_sctipts/lite-client/tdtl/td/tl/tl_generate.cpp

tdtl/CMakeFiles/tdtl.dir/td/tl/tl_generate.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/tdtl.dir/td/tl/tl_generate.cpp.i"
	cd /Users/erage/go/src/github.com/prazd/ton_build_sctipts/liteclient-build/tdtl && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/erage/go/src/github.com/prazd/ton_build_sctipts/lite-client/tdtl/td/tl/tl_generate.cpp > CMakeFiles/tdtl.dir/td/tl/tl_generate.cpp.i

tdtl/CMakeFiles/tdtl.dir/td/tl/tl_generate.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/tdtl.dir/td/tl/tl_generate.cpp.s"
	cd /Users/erage/go/src/github.com/prazd/ton_build_sctipts/liteclient-build/tdtl && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/erage/go/src/github.com/prazd/ton_build_sctipts/lite-client/tdtl/td/tl/tl_generate.cpp -o CMakeFiles/tdtl.dir/td/tl/tl_generate.cpp.s

tdtl/CMakeFiles/tdtl.dir/td/tl/tl_outputer.cpp.o: tdtl/CMakeFiles/tdtl.dir/flags.make
tdtl/CMakeFiles/tdtl.dir/td/tl/tl_outputer.cpp.o: /Users/erage/go/src/github.com/prazd/ton_build_sctipts/lite-client/tdtl/td/tl/tl_outputer.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/erage/go/src/github.com/prazd/ton_build_sctipts/liteclient-build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building CXX object tdtl/CMakeFiles/tdtl.dir/td/tl/tl_outputer.cpp.o"
	cd /Users/erage/go/src/github.com/prazd/ton_build_sctipts/liteclient-build/tdtl && ccache /Library/Developer/CommandLineTools/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/tdtl.dir/td/tl/tl_outputer.cpp.o -c /Users/erage/go/src/github.com/prazd/ton_build_sctipts/lite-client/tdtl/td/tl/tl_outputer.cpp

tdtl/CMakeFiles/tdtl.dir/td/tl/tl_outputer.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/tdtl.dir/td/tl/tl_outputer.cpp.i"
	cd /Users/erage/go/src/github.com/prazd/ton_build_sctipts/liteclient-build/tdtl && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/erage/go/src/github.com/prazd/ton_build_sctipts/lite-client/tdtl/td/tl/tl_outputer.cpp > CMakeFiles/tdtl.dir/td/tl/tl_outputer.cpp.i

tdtl/CMakeFiles/tdtl.dir/td/tl/tl_outputer.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/tdtl.dir/td/tl/tl_outputer.cpp.s"
	cd /Users/erage/go/src/github.com/prazd/ton_build_sctipts/liteclient-build/tdtl && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/erage/go/src/github.com/prazd/ton_build_sctipts/lite-client/tdtl/td/tl/tl_outputer.cpp -o CMakeFiles/tdtl.dir/td/tl/tl_outputer.cpp.s

tdtl/CMakeFiles/tdtl.dir/td/tl/tl_string_outputer.cpp.o: tdtl/CMakeFiles/tdtl.dir/flags.make
tdtl/CMakeFiles/tdtl.dir/td/tl/tl_string_outputer.cpp.o: /Users/erage/go/src/github.com/prazd/ton_build_sctipts/lite-client/tdtl/td/tl/tl_string_outputer.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/erage/go/src/github.com/prazd/ton_build_sctipts/liteclient-build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building CXX object tdtl/CMakeFiles/tdtl.dir/td/tl/tl_string_outputer.cpp.o"
	cd /Users/erage/go/src/github.com/prazd/ton_build_sctipts/liteclient-build/tdtl && ccache /Library/Developer/CommandLineTools/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/tdtl.dir/td/tl/tl_string_outputer.cpp.o -c /Users/erage/go/src/github.com/prazd/ton_build_sctipts/lite-client/tdtl/td/tl/tl_string_outputer.cpp

tdtl/CMakeFiles/tdtl.dir/td/tl/tl_string_outputer.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/tdtl.dir/td/tl/tl_string_outputer.cpp.i"
	cd /Users/erage/go/src/github.com/prazd/ton_build_sctipts/liteclient-build/tdtl && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/erage/go/src/github.com/prazd/ton_build_sctipts/lite-client/tdtl/td/tl/tl_string_outputer.cpp > CMakeFiles/tdtl.dir/td/tl/tl_string_outputer.cpp.i

tdtl/CMakeFiles/tdtl.dir/td/tl/tl_string_outputer.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/tdtl.dir/td/tl/tl_string_outputer.cpp.s"
	cd /Users/erage/go/src/github.com/prazd/ton_build_sctipts/liteclient-build/tdtl && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/erage/go/src/github.com/prazd/ton_build_sctipts/lite-client/tdtl/td/tl/tl_string_outputer.cpp -o CMakeFiles/tdtl.dir/td/tl/tl_string_outputer.cpp.s

tdtl/CMakeFiles/tdtl.dir/td/tl/tl_writer.cpp.o: tdtl/CMakeFiles/tdtl.dir/flags.make
tdtl/CMakeFiles/tdtl.dir/td/tl/tl_writer.cpp.o: /Users/erage/go/src/github.com/prazd/ton_build_sctipts/lite-client/tdtl/td/tl/tl_writer.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/erage/go/src/github.com/prazd/ton_build_sctipts/liteclient-build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Building CXX object tdtl/CMakeFiles/tdtl.dir/td/tl/tl_writer.cpp.o"
	cd /Users/erage/go/src/github.com/prazd/ton_build_sctipts/liteclient-build/tdtl && ccache /Library/Developer/CommandLineTools/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/tdtl.dir/td/tl/tl_writer.cpp.o -c /Users/erage/go/src/github.com/prazd/ton_build_sctipts/lite-client/tdtl/td/tl/tl_writer.cpp

tdtl/CMakeFiles/tdtl.dir/td/tl/tl_writer.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/tdtl.dir/td/tl/tl_writer.cpp.i"
	cd /Users/erage/go/src/github.com/prazd/ton_build_sctipts/liteclient-build/tdtl && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/erage/go/src/github.com/prazd/ton_build_sctipts/lite-client/tdtl/td/tl/tl_writer.cpp > CMakeFiles/tdtl.dir/td/tl/tl_writer.cpp.i

tdtl/CMakeFiles/tdtl.dir/td/tl/tl_writer.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/tdtl.dir/td/tl/tl_writer.cpp.s"
	cd /Users/erage/go/src/github.com/prazd/ton_build_sctipts/liteclient-build/tdtl && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/erage/go/src/github.com/prazd/ton_build_sctipts/lite-client/tdtl/td/tl/tl_writer.cpp -o CMakeFiles/tdtl.dir/td/tl/tl_writer.cpp.s

# Object files for target tdtl
tdtl_OBJECTS = \
"CMakeFiles/tdtl.dir/td/tl/tl_config.cpp.o" \
"CMakeFiles/tdtl.dir/td/tl/tl_core.cpp.o" \
"CMakeFiles/tdtl.dir/td/tl/tl_file_outputer.cpp.o" \
"CMakeFiles/tdtl.dir/td/tl/tl_file_utils.cpp.o" \
"CMakeFiles/tdtl.dir/td/tl/tl_generate.cpp.o" \
"CMakeFiles/tdtl.dir/td/tl/tl_outputer.cpp.o" \
"CMakeFiles/tdtl.dir/td/tl/tl_string_outputer.cpp.o" \
"CMakeFiles/tdtl.dir/td/tl/tl_writer.cpp.o"

# External object files for target tdtl
tdtl_EXTERNAL_OBJECTS =

tdtl/libtdtl.a: tdtl/CMakeFiles/tdtl.dir/td/tl/tl_config.cpp.o
tdtl/libtdtl.a: tdtl/CMakeFiles/tdtl.dir/td/tl/tl_core.cpp.o
tdtl/libtdtl.a: tdtl/CMakeFiles/tdtl.dir/td/tl/tl_file_outputer.cpp.o
tdtl/libtdtl.a: tdtl/CMakeFiles/tdtl.dir/td/tl/tl_file_utils.cpp.o
tdtl/libtdtl.a: tdtl/CMakeFiles/tdtl.dir/td/tl/tl_generate.cpp.o
tdtl/libtdtl.a: tdtl/CMakeFiles/tdtl.dir/td/tl/tl_outputer.cpp.o
tdtl/libtdtl.a: tdtl/CMakeFiles/tdtl.dir/td/tl/tl_string_outputer.cpp.o
tdtl/libtdtl.a: tdtl/CMakeFiles/tdtl.dir/td/tl/tl_writer.cpp.o
tdtl/libtdtl.a: tdtl/CMakeFiles/tdtl.dir/build.make
tdtl/libtdtl.a: tdtl/CMakeFiles/tdtl.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/erage/go/src/github.com/prazd/ton_build_sctipts/liteclient-build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_9) "Linking CXX static library libtdtl.a"
	cd /Users/erage/go/src/github.com/prazd/ton_build_sctipts/liteclient-build/tdtl && $(CMAKE_COMMAND) -P CMakeFiles/tdtl.dir/cmake_clean_target.cmake
	cd /Users/erage/go/src/github.com/prazd/ton_build_sctipts/liteclient-build/tdtl && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/tdtl.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
tdtl/CMakeFiles/tdtl.dir/build: tdtl/libtdtl.a

.PHONY : tdtl/CMakeFiles/tdtl.dir/build

tdtl/CMakeFiles/tdtl.dir/clean:
	cd /Users/erage/go/src/github.com/prazd/ton_build_sctipts/liteclient-build/tdtl && $(CMAKE_COMMAND) -P CMakeFiles/tdtl.dir/cmake_clean.cmake
.PHONY : tdtl/CMakeFiles/tdtl.dir/clean

tdtl/CMakeFiles/tdtl.dir/depend:
	cd /Users/erage/go/src/github.com/prazd/ton_build_sctipts/liteclient-build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/erage/go/src/github.com/prazd/ton_build_sctipts/lite-client /Users/erage/go/src/github.com/prazd/ton_build_sctipts/lite-client/tdtl /Users/erage/go/src/github.com/prazd/ton_build_sctipts/liteclient-build /Users/erage/go/src/github.com/prazd/ton_build_sctipts/liteclient-build/tdtl /Users/erage/go/src/github.com/prazd/ton_build_sctipts/liteclient-build/tdtl/CMakeFiles/tdtl.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : tdtl/CMakeFiles/tdtl.dir/depend

