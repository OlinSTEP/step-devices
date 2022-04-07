# Preamble
cmake_minimum_required(VERSION 3.11)
project(step-devices)


# Project wide setup
list(APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_LIST_DIR}/cmake)
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED YES)
set(CMAKE_CXX_EXTENSIONS NO)

# Externally provided content
add_subdirectory(dependencies)


# Main targets built by this project (add a separate line here for each project in /projects)
# add_subdirectory(src)