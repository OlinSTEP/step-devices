cmake_minimum_required(VERSION 3.11)
project(step-devices)
include(ExternalProject)

set(installDir ${CMAKE_CURRENT_BINARY_DIR}/install)

ExternalProject_Add(cmsis_device_wb
	GIT_REPOSITORY git@github.com:STMicroelectronics/cmsis_device_wb.git
	GIT_TAG 9c5d1920dd9fabbe2548e10561d63db829bb744f
	CONFIGURE_COMMAND ""
	BUILD_COMMAND ""
	INSTALL_COMMAND "git clone git@github.com:STMicroelectronics/cmsis_device_wb.git"
)
ExternalProject_Get_Property(cmsis_device_wb SOURCE_DIR)
message("Source dir of my cmsis_device_wb = ${SOURCE_DIR}")
