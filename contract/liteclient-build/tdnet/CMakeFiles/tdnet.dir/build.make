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
include tdnet/CMakeFiles/tdnet.dir/depend.make

# Include the progress variables for this target.
include tdnet/CMakeFiles/tdnet.dir/progress.make

# Include the compile flags for this target's objects.
include tdnet/CMakeFiles/tdnet.dir/flags.make

tdnet/CMakeFiles/tdnet.dir/td/net/FdListener.cpp.o: tdnet/CMakeFiles/tdnet.dir/flags.make
tdnet/CMakeFiles/tdnet.dir/td/net/FdListener.cpp.o: /Users/erage/go/src/github.com/prazd/ton_build_sctipts/lite-client/tdnet/td/net/FdListener.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/erage/go/src/github.com/prazd/ton_build_sctipts/liteclient-build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object tdnet/CMakeFiles/tdnet.dir/td/net/FdListener.cpp.o"
	cd /Users/erage/go/src/github.com/prazd/ton_build_sctipts/liteclient-build/tdnet && ccache /Library/Developer/CommandLineTools/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/tdnet.dir/td/net/FdListener.cpp.o -c /Users/erage/go/src/github.com/prazd/ton_build_sctipts/lite-client/tdnet/td/net/FdListener.cpp

tdnet/CMakeFiles/tdnet.dir/td/net/FdListener.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/tdnet.dir/td/net/FdListener.cpp.i"
	cd /Users/erage/go/src/github.com/prazd/ton_build_sctipts/liteclient-build/tdnet && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/erage/go/src/github.com/prazd/ton_build_sctipts/lite-client/tdnet/td/net/FdListener.cpp > CMakeFiles/tdnet.dir/td/net/FdListener.cpp.i

tdnet/CMakeFiles/tdnet.dir/td/net/FdListener.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/tdnet.dir/td/net/FdListener.cpp.s"
	cd /Users/erage/go/src/github.com/prazd/ton_build_sctipts/liteclient-build/tdnet && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/erage/go/src/github.com/prazd/ton_build_sctipts/lite-client/tdnet/td/net/FdListener.cpp -o CMakeFiles/tdnet.dir/td/net/FdListener.cpp.s

tdnet/CMakeFiles/tdnet.dir/td/net/TcpListener.cpp.o: tdnet/CMakeFiles/tdnet.dir/flags.make
tdnet/CMakeFiles/tdnet.dir/td/net/TcpListener.cpp.o: /Users/erage/go/src/github.com/prazd/ton_build_sctipts/lite-client/tdnet/td/net/TcpListener.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/erage/go/src/github.com/prazd/ton_build_sctipts/liteclient-build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object tdnet/CMakeFiles/tdnet.dir/td/net/TcpListener.cpp.o"
	cd /Users/erage/go/src/github.com/prazd/ton_build_sctipts/liteclient-build/tdnet && ccache /Library/Developer/CommandLineTools/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/tdnet.dir/td/net/TcpListener.cpp.o -c /Users/erage/go/src/github.com/prazd/ton_build_sctipts/lite-client/tdnet/td/net/TcpListener.cpp

tdnet/CMakeFiles/tdnet.dir/td/net/TcpListener.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/tdnet.dir/td/net/TcpListener.cpp.i"
	cd /Users/erage/go/src/github.com/prazd/ton_build_sctipts/liteclient-build/tdnet && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/erage/go/src/github.com/prazd/ton_build_sctipts/lite-client/tdnet/td/net/TcpListener.cpp > CMakeFiles/tdnet.dir/td/net/TcpListener.cpp.i

tdnet/CMakeFiles/tdnet.dir/td/net/TcpListener.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/tdnet.dir/td/net/TcpListener.cpp.s"
	cd /Users/erage/go/src/github.com/prazd/ton_build_sctipts/liteclient-build/tdnet && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/erage/go/src/github.com/prazd/ton_build_sctipts/lite-client/tdnet/td/net/TcpListener.cpp -o CMakeFiles/tdnet.dir/td/net/TcpListener.cpp.s

tdnet/CMakeFiles/tdnet.dir/td/net/UdpServer.cpp.o: tdnet/CMakeFiles/tdnet.dir/flags.make
tdnet/CMakeFiles/tdnet.dir/td/net/UdpServer.cpp.o: /Users/erage/go/src/github.com/prazd/ton_build_sctipts/lite-client/tdnet/td/net/UdpServer.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/erage/go/src/github.com/prazd/ton_build_sctipts/liteclient-build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object tdnet/CMakeFiles/tdnet.dir/td/net/UdpServer.cpp.o"
	cd /Users/erage/go/src/github.com/prazd/ton_build_sctipts/liteclient-build/tdnet && ccache /Library/Developer/CommandLineTools/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/tdnet.dir/td/net/UdpServer.cpp.o -c /Users/erage/go/src/github.com/prazd/ton_build_sctipts/lite-client/tdnet/td/net/UdpServer.cpp

tdnet/CMakeFiles/tdnet.dir/td/net/UdpServer.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/tdnet.dir/td/net/UdpServer.cpp.i"
	cd /Users/erage/go/src/github.com/prazd/ton_build_sctipts/liteclient-build/tdnet && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/erage/go/src/github.com/prazd/ton_build_sctipts/lite-client/tdnet/td/net/UdpServer.cpp > CMakeFiles/tdnet.dir/td/net/UdpServer.cpp.i

tdnet/CMakeFiles/tdnet.dir/td/net/UdpServer.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/tdnet.dir/td/net/UdpServer.cpp.s"
	cd /Users/erage/go/src/github.com/prazd/ton_build_sctipts/liteclient-build/tdnet && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/erage/go/src/github.com/prazd/ton_build_sctipts/lite-client/tdnet/td/net/UdpServer.cpp -o CMakeFiles/tdnet.dir/td/net/UdpServer.cpp.s

# Object files for target tdnet
tdnet_OBJECTS = \
"CMakeFiles/tdnet.dir/td/net/FdListener.cpp.o" \
"CMakeFiles/tdnet.dir/td/net/TcpListener.cpp.o" \
"CMakeFiles/tdnet.dir/td/net/UdpServer.cpp.o"

# External object files for target tdnet
tdnet_EXTERNAL_OBJECTS =

tdnet/libtdnet.a: tdnet/CMakeFiles/tdnet.dir/td/net/FdListener.cpp.o
tdnet/libtdnet.a: tdnet/CMakeFiles/tdnet.dir/td/net/TcpListener.cpp.o
tdnet/libtdnet.a: tdnet/CMakeFiles/tdnet.dir/td/net/UdpServer.cpp.o
tdnet/libtdnet.a: tdnet/CMakeFiles/tdnet.dir/build.make
tdnet/libtdnet.a: tdnet/CMakeFiles/tdnet.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/erage/go/src/github.com/prazd/ton_build_sctipts/liteclient-build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Linking CXX static library libtdnet.a"
	cd /Users/erage/go/src/github.com/prazd/ton_build_sctipts/liteclient-build/tdnet && $(CMAKE_COMMAND) -P CMakeFiles/tdnet.dir/cmake_clean_target.cmake
	cd /Users/erage/go/src/github.com/prazd/ton_build_sctipts/liteclient-build/tdnet && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/tdnet.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
tdnet/CMakeFiles/tdnet.dir/build: tdnet/libtdnet.a

.PHONY : tdnet/CMakeFiles/tdnet.dir/build

tdnet/CMakeFiles/tdnet.dir/clean:
	cd /Users/erage/go/src/github.com/prazd/ton_build_sctipts/liteclient-build/tdnet && $(CMAKE_COMMAND) -P CMakeFiles/tdnet.dir/cmake_clean.cmake
.PHONY : tdnet/CMakeFiles/tdnet.dir/clean

tdnet/CMakeFiles/tdnet.dir/depend:
	cd /Users/erage/go/src/github.com/prazd/ton_build_sctipts/liteclient-build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/erage/go/src/github.com/prazd/ton_build_sctipts/lite-client /Users/erage/go/src/github.com/prazd/ton_build_sctipts/lite-client/tdnet /Users/erage/go/src/github.com/prazd/ton_build_sctipts/liteclient-build /Users/erage/go/src/github.com/prazd/ton_build_sctipts/liteclient-build/tdnet /Users/erage/go/src/github.com/prazd/ton_build_sctipts/liteclient-build/tdnet/CMakeFiles/tdnet.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : tdnet/CMakeFiles/tdnet.dir/depend

