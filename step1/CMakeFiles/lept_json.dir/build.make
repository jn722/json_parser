# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

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
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/wujilei/workspace/json_practice/step1

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/wujilei/workspace/json_practice/step1

# Include any dependencies generated for this target.
include CMakeFiles/lept_json.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/lept_json.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/lept_json.dir/flags.make

CMakeFiles/lept_json.dir/lept_json.c.o: CMakeFiles/lept_json.dir/flags.make
CMakeFiles/lept_json.dir/lept_json.c.o: lept_json.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/wujilei/workspace/json_practice/step1/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/lept_json.dir/lept_json.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/lept_json.dir/lept_json.c.o   -c /home/wujilei/workspace/json_practice/step1/lept_json.c

CMakeFiles/lept_json.dir/lept_json.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/lept_json.dir/lept_json.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/wujilei/workspace/json_practice/step1/lept_json.c > CMakeFiles/lept_json.dir/lept_json.c.i

CMakeFiles/lept_json.dir/lept_json.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/lept_json.dir/lept_json.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/wujilei/workspace/json_practice/step1/lept_json.c -o CMakeFiles/lept_json.dir/lept_json.c.s

# Object files for target lept_json
lept_json_OBJECTS = \
"CMakeFiles/lept_json.dir/lept_json.c.o"

# External object files for target lept_json
lept_json_EXTERNAL_OBJECTS =

liblept_json.a: CMakeFiles/lept_json.dir/lept_json.c.o
liblept_json.a: CMakeFiles/lept_json.dir/build.make
liblept_json.a: CMakeFiles/lept_json.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/wujilei/workspace/json_practice/step1/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C static library liblept_json.a"
	$(CMAKE_COMMAND) -P CMakeFiles/lept_json.dir/cmake_clean_target.cmake
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/lept_json.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/lept_json.dir/build: liblept_json.a

.PHONY : CMakeFiles/lept_json.dir/build

CMakeFiles/lept_json.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/lept_json.dir/cmake_clean.cmake
.PHONY : CMakeFiles/lept_json.dir/clean

CMakeFiles/lept_json.dir/depend:
	cd /home/wujilei/workspace/json_practice/step1 && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/wujilei/workspace/json_practice/step1 /home/wujilei/workspace/json_practice/step1 /home/wujilei/workspace/json_practice/step1 /home/wujilei/workspace/json_practice/step1 /home/wujilei/workspace/json_practice/step1/CMakeFiles/lept_json.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/lept_json.dir/depend
