FetchContent_Declare(cmsis_device_wb
	GIT_REPOSITORY git@github.com:STMicroelectronics/cmsis_device_wb.git
	GIT_TAG git@github.com:STMicroelectronics/cmsis_device_wb.git
	CONFIGURE_COMMAND ""
	BUILD_COMMAND ""
)

FetchContent_GetProperties(cmsis_device_wb)
if (NOT cmsis_device_wb_POPULATED)
	FetchContent_Populated(cmsis_device_wb)
endif()


