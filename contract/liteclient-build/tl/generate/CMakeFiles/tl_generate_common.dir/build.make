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

# Utility rule file for tl_generate_common.

# Include the progress variables for this target.
include tl/generate/CMakeFiles/tl_generate_common.dir/progress.make

tl/generate/CMakeFiles/tl_generate_common: /Users/erage/go/src/github.com/prazd/ton_build_sctipts/lite-client/tl/generate/auto/tl/ton_api.cpp
tl/generate/CMakeFiles/tl_generate_common: /Users/erage/go/src/github.com/prazd/ton_build_sctipts/lite-client/tl/generate/auto/tl/ton_api.h
tl/generate/CMakeFiles/tl_generate_common: /Users/erage/go/src/github.com/prazd/ton_build_sctipts/lite-client/tl/generate/auto/tl/ton_api.hpp
tl/generate/CMakeFiles/tl_generate_common: /Users/erage/go/src/github.com/prazd/ton_build_sctipts/lite-client/tl/generate/auto/tl/ton_api_json.cpp
tl/generate/CMakeFiles/tl_generate_common: /Users/erage/go/src/github.com/prazd/ton_build_sctipts/lite-client/tl/generate/auto/tl/ton_api_json.h
tl/generate/CMakeFiles/tl_generate_common: /Users/erage/go/src/github.com/prazd/ton_build_sctipts/lite-client/tl/generate/auto/tl/lite_api.cpp
tl/generate/CMakeFiles/tl_generate_common: /Users/erage/go/src/github.com/prazd/ton_build_sctipts/lite-client/tl/generate/auto/tl/lite_api.h
tl/generate/CMakeFiles/tl_generate_common: /Users/erage/go/src/github.com/prazd/ton_build_sctipts/lite-client/tl/generate/auto/tl/lite_api.hpp
tl/generate/CMakeFiles/tl_generate_common: /Users/erage/go/src/github.com/prazd/ton_build_sctipts/lite-client/tl/generate/auto/tl/tonlib_api.cpp
tl/generate/CMakeFiles/tl_generate_common: /Users/erage/go/src/github.com/prazd/ton_build_sctipts/lite-client/tl/generate/auto/tl/tonlib_api.h
tl/generate/CMakeFiles/tl_generate_common: /Users/erage/go/src/github.com/prazd/ton_build_sctipts/lite-client/tl/generate/auto/tl/tonlib_api.hpp
tl/generate/CMakeFiles/tl_generate_common: /Users/erage/go/src/github.com/prazd/ton_build_sctipts/lite-client/tl/generate/auto/tl/tonlib_api_json.cpp
tl/generate/CMakeFiles/tl_generate_common: /Users/erage/go/src/github.com/prazd/ton_build_sctipts/lite-client/tl/generate/auto/tl/tonlib_api_json.h


/Users/erage/go/src/github.com/prazd/ton_build_sctipts/lite-client/tl/generate/auto/tl/ton_api.cpp: tl/generate/generate_common
/Users/erage/go/src/github.com/prazd/ton_build_sctipts/lite-client/tl/generate/auto/tl/ton_api.cpp: /Users/erage/go/src/github.com/prazd/ton_build_sctipts/lite-client/tl/generate/scheme/ton_api.tlo
/Users/erage/go/src/github.com/prazd/ton_build_sctipts/lite-client/tl/generate/auto/tl/ton_api.cpp: /Users/erage/go/src/github.com/prazd/ton_build_sctipts/lite-client/tl/generate/scheme/lite_api.tlo
/Users/erage/go/src/github.com/prazd/ton_build_sctipts/lite-client/tl/generate/auto/tl/ton_api.cpp: /Users/erage/go/src/github.com/prazd/ton_build_sctipts/lite-client/tl/generate/scheme/tonlib_api.tlo
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/Users/erage/go/src/github.com/prazd/ton_build_sctipts/liteclient-build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Generate common tl source files"
	cd /Users/erage/go/src/github.com/prazd/ton_build_sctipts/lite-client/tl/generate && /Users/erage/go/src/github.com/prazd/ton_build_sctipts/liteclient-build/tl/generate/generate_common

/Users/erage/go/src/github.com/prazd/ton_build_sctipts/lite-client/tl/generate/auto/tl/ton_api.h: /Users/erage/go/src/github.com/prazd/ton_build_sctipts/lite-client/tl/generate/auto/tl/ton_api.cpp
	@$(CMAKE_COMMAND) -E touch_nocreate /Users/erage/go/src/github.com/prazd/ton_build_sctipts/lite-client/tl/generate/auto/tl/ton_api.h

/Users/erage/go/src/github.com/prazd/ton_build_sctipts/lite-client/tl/generate/auto/tl/ton_api.hpp: /Users/erage/go/src/github.com/prazd/ton_build_sctipts/lite-client/tl/generate/auto/tl/ton_api.cpp
	@$(CMAKE_COMMAND) -E touch_nocreate /Users/erage/go/src/github.com/prazd/ton_build_sctipts/lite-client/tl/generate/auto/tl/ton_api.hpp

/Users/erage/go/src/github.com/prazd/ton_build_sctipts/lite-client/tl/generate/auto/tl/ton_api_json.cpp: /Users/erage/go/src/github.com/prazd/ton_build_sctipts/lite-client/tl/generate/auto/tl/ton_api.cpp
	@$(CMAKE_COMMAND) -E touch_nocreate /Users/erage/go/src/github.com/prazd/ton_build_sctipts/lite-client/tl/generate/auto/tl/ton_api_json.cpp

/Users/erage/go/src/github.com/prazd/ton_build_sctipts/lite-client/tl/generate/auto/tl/ton_api_json.h: /Users/erage/go/src/github.com/prazd/ton_build_sctipts/lite-client/tl/generate/auto/tl/ton_api.cpp
	@$(CMAKE_COMMAND) -E touch_nocreate /Users/erage/go/src/github.com/prazd/ton_build_sctipts/lite-client/tl/generate/auto/tl/ton_api_json.h

/Users/erage/go/src/github.com/prazd/ton_build_sctipts/lite-client/tl/generate/auto/tl/lite_api.cpp: /Users/erage/go/src/github.com/prazd/ton_build_sctipts/lite-client/tl/generate/auto/tl/ton_api.cpp
	@$(CMAKE_COMMAND) -E touch_nocreate /Users/erage/go/src/github.com/prazd/ton_build_sctipts/lite-client/tl/generate/auto/tl/lite_api.cpp

/Users/erage/go/src/github.com/prazd/ton_build_sctipts/lite-client/tl/generate/auto/tl/lite_api.h: /Users/erage/go/src/github.com/prazd/ton_build_sctipts/lite-client/tl/generate/auto/tl/ton_api.cpp
	@$(CMAKE_COMMAND) -E touch_nocreate /Users/erage/go/src/github.com/prazd/ton_build_sctipts/lite-client/tl/generate/auto/tl/lite_api.h

/Users/erage/go/src/github.com/prazd/ton_build_sctipts/lite-client/tl/generate/auto/tl/lite_api.hpp: /Users/erage/go/src/github.com/prazd/ton_build_sctipts/lite-client/tl/generate/auto/tl/ton_api.cpp
	@$(CMAKE_COMMAND) -E touch_nocreate /Users/erage/go/src/github.com/prazd/ton_build_sctipts/lite-client/tl/generate/auto/tl/lite_api.hpp

/Users/erage/go/src/github.com/prazd/ton_build_sctipts/lite-client/tl/generate/auto/tl/tonlib_api.cpp: /Users/erage/go/src/github.com/prazd/ton_build_sctipts/lite-client/tl/generate/auto/tl/ton_api.cpp
	@$(CMAKE_COMMAND) -E touch_nocreate /Users/erage/go/src/github.com/prazd/ton_build_sctipts/lite-client/tl/generate/auto/tl/tonlib_api.cpp

/Users/erage/go/src/github.com/prazd/ton_build_sctipts/lite-client/tl/generate/auto/tl/tonlib_api.h: /Users/erage/go/src/github.com/prazd/ton_build_sctipts/lite-client/tl/generate/auto/tl/ton_api.cpp
	@$(CMAKE_COMMAND) -E touch_nocreate /Users/erage/go/src/github.com/prazd/ton_build_sctipts/lite-client/tl/generate/auto/tl/tonlib_api.h

/Users/erage/go/src/github.com/prazd/ton_build_sctipts/lite-client/tl/generate/auto/tl/tonlib_api.hpp: /Users/erage/go/src/github.com/prazd/ton_build_sctipts/lite-client/tl/generate/auto/tl/ton_api.cpp
	@$(CMAKE_COMMAND) -E touch_nocreate /Users/erage/go/src/github.com/prazd/ton_build_sctipts/lite-client/tl/generate/auto/tl/tonlib_api.hpp

/Users/erage/go/src/github.com/prazd/ton_build_sctipts/lite-client/tl/generate/auto/tl/tonlib_api_json.cpp: /Users/erage/go/src/github.com/prazd/ton_build_sctipts/lite-client/tl/generate/auto/tl/ton_api.cpp
	@$(CMAKE_COMMAND) -E touch_nocreate /Users/erage/go/src/github.com/prazd/ton_build_sctipts/lite-client/tl/generate/auto/tl/tonlib_api_json.cpp

/Users/erage/go/src/github.com/prazd/ton_build_sctipts/lite-client/tl/generate/auto/tl/tonlib_api_json.h: /Users/erage/go/src/github.com/prazd/ton_build_sctipts/lite-client/tl/generate/auto/tl/ton_api.cpp
	@$(CMAKE_COMMAND) -E touch_nocreate /Users/erage/go/src/github.com/prazd/ton_build_sctipts/lite-client/tl/generate/auto/tl/tonlib_api_json.h

tl_generate_common: tl/generate/CMakeFiles/tl_generate_common
tl_generate_common: /Users/erage/go/src/github.com/prazd/ton_build_sctipts/lite-client/tl/generate/auto/tl/ton_api.cpp
tl_generate_common: /Users/erage/go/src/github.com/prazd/ton_build_sctipts/lite-client/tl/generate/auto/tl/ton_api.h
tl_generate_common: /Users/erage/go/src/github.com/prazd/ton_build_sctipts/lite-client/tl/generate/auto/tl/ton_api.hpp
tl_generate_common: /Users/erage/go/src/github.com/prazd/ton_build_sctipts/lite-client/tl/generate/auto/tl/ton_api_json.cpp
tl_generate_common: /Users/erage/go/src/github.com/prazd/ton_build_sctipts/lite-client/tl/generate/auto/tl/ton_api_json.h
tl_generate_common: /Users/erage/go/src/github.com/prazd/ton_build_sctipts/lite-client/tl/generate/auto/tl/lite_api.cpp
tl_generate_common: /Users/erage/go/src/github.com/prazd/ton_build_sctipts/lite-client/tl/generate/auto/tl/lite_api.h
tl_generate_common: /Users/erage/go/src/github.com/prazd/ton_build_sctipts/lite-client/tl/generate/auto/tl/lite_api.hpp
tl_generate_common: /Users/erage/go/src/github.com/prazd/ton_build_sctipts/lite-client/tl/generate/auto/tl/tonlib_api.cpp
tl_generate_common: /Users/erage/go/src/github.com/prazd/ton_build_sctipts/lite-client/tl/generate/auto/tl/tonlib_api.h
tl_generate_common: /Users/erage/go/src/github.com/prazd/ton_build_sctipts/lite-client/tl/generate/auto/tl/tonlib_api.hpp
tl_generate_common: /Users/erage/go/src/github.com/prazd/ton_build_sctipts/lite-client/tl/generate/auto/tl/tonlib_api_json.cpp
tl_generate_common: /Users/erage/go/src/github.com/prazd/ton_build_sctipts/lite-client/tl/generate/auto/tl/tonlib_api_json.h
tl_generate_common: tl/generate/CMakeFiles/tl_generate_common.dir/build.make

.PHONY : tl_generate_common

# Rule to build all files generated by this target.
tl/generate/CMakeFiles/tl_generate_common.dir/build: tl_generate_common

.PHONY : tl/generate/CMakeFiles/tl_generate_common.dir/build

tl/generate/CMakeFiles/tl_generate_common.dir/clean:
	cd /Users/erage/go/src/github.com/prazd/ton_build_sctipts/liteclient-build/tl/generate && $(CMAKE_COMMAND) -P CMakeFiles/tl_generate_common.dir/cmake_clean.cmake
.PHONY : tl/generate/CMakeFiles/tl_generate_common.dir/clean

tl/generate/CMakeFiles/tl_generate_common.dir/depend:
	cd /Users/erage/go/src/github.com/prazd/ton_build_sctipts/liteclient-build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/erage/go/src/github.com/prazd/ton_build_sctipts/lite-client /Users/erage/go/src/github.com/prazd/ton_build_sctipts/lite-client/tl/generate /Users/erage/go/src/github.com/prazd/ton_build_sctipts/liteclient-build /Users/erage/go/src/github.com/prazd/ton_build_sctipts/liteclient-build/tl/generate /Users/erage/go/src/github.com/prazd/ton_build_sctipts/liteclient-build/tl/generate/CMakeFiles/tl_generate_common.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : tl/generate/CMakeFiles/tl_generate_common.dir/depend

