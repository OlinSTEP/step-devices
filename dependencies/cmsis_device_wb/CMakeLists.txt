FetchContent_GetProperties(cmsis_device_wb)
if (NOT cmsis_device_wb_POPULATED)
	FetchContent_Populate(cmsis_device_wb)
endif()

include_directories(${cmsis_device_wb}/Include/)