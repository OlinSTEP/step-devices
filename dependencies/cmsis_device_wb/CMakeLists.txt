FetchContent_GetProperties(cmsis_device_wb)
if (NOT cmsis_device_wb_POPULATED)
	FetchContent_Populate(cmsis_device_wb)
	string(APPEND CMAKE_EXE_LINKER_FLAGS " -T${cmsis_device_wb_SOURCE_DIR}/Source/Templates/gcc/linker/${MCU_LOWER_LONG}_flash_cm4.ld")
	add_library(cmsis_device_wb INTERFACE)
	target_include_directories(cmsis_device_wb
		INTERFACE ${cmsis_device_wb_SOURCE_DIR}/Include
	)
	target_compile_definitions(cmsis_device_wb
		INTERFACE -D${MCU_UPPER_LONG}
	)
	target_link_libraries(cmsis_device_wb
		INTERFACE cmsis_core
	)
	add_library(stm32wb OBJECT 
		${cmsis_device_wb_SOURCE_DIR}/Source/Templates/system_${MCU_LOWER_SHORT}.c
		${cmsis_device_wb_SOURCE_DIR}/Source/Templates/gcc/startup_${MCU_LOWER_LONG}_cm4.s
	)
	target_link_libraries(stm32wb
		PRIVATE cmsis_device_wb
		PRIVATE cmsis_core
	)
endif()
