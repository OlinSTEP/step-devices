### Preamble
cmake_minimum_required(VERSION 3.11)
project(step-devices)


### Project wide setup
list(APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_LIST_DIR}/cmake)
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED YES)
set(CMAKE_CXX_EXTENSIONS NO)
set(BUILD_SHARED_LIBS YES)

if(NOT DEFINED MCU)
	message(STATUS "Setting default device to STM32WB55xx")
	set(MCU "stm32wb55xx")
endif()
include("${MCU}")

### Externally provided content
add_subdirectory(dependencies)

### Main targets built by this project
add_subdirectory(projects/blinky)
add_subdirectory(projects/bt-demo)
add_subdirectory(projects/rtos-demo)
add_subdirectory(projects/button)
