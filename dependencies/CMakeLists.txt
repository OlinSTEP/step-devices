include(FetchContent)

FetchContent_Declare(cmsis_device_wb
	GIT_REPOSITORY git@github.com:STMicroelectronics/cmsis_device_wb.git
	GIT_TAG 9c5d1920dd9fabbe2548e10561d63db829bb744f
	CONFIGURE_COMMAND ""
	BUILD_COMMAND ""
)

FetchContent_Declare(cmsis_core
	GIT_REPOSITORY git@github.com:STMicroelectronics/cmsis_core.git
	GIT_TAG 96d6da4e252b06dcfdc041e7df23e86161c33007
	CONFIGURE_COMMAND ""
	BUILD_COMMAND ""
)


add_subdirectory(cmsis_core)
add_subdirectory(cmsis_device_wb)