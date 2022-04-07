FetchContent_GetProperties(cmsis_core)
if (NOT cmsis_core_POPULATED)
	FetchContent_Populate(cmsis_core)
endif()

include_directories(${cmsis_core_SOURCE_DIR}/Core/Include/)