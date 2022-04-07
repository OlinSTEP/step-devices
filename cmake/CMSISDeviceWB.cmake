FetchContent_Declare(cmsis_device_wb
	GIT_REPOSITORY git@github.com:STMicroelectronics/cmsis_device_wb.git
	GIT_TAG 9c5d1920dd9fabbe2548e10561d63db829bb744f
	CONFIGURE_COMMAND ""
	BUILD_COMMAND ""
)

FetchContent_GetProperties(cmsis_device_wb)
if (NOT cmsis_device_wb_POPULATED)
	FetchContent_Populate(cmsis_device_wb)
endif()

include_directories(${cmsis_device_wb}/Include/)
