FetchContent_GetProperties(cmsis_core)
if (NOT cmsis_core_POPULATED)
	FetchContent_Populate(cmsis_core)
	add_library(cmsis_core INTERFACE IMPORTED GLOBAL)
	target_include_directories(cmsis_core
		INTERFACE ${cmsis_core_SOURCE_DIR}/Core/Include
	)
endif()

