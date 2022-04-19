
FetchContent_GetProperties(stm32cubewb)
if (NOT stm32cubewb_POPULATED)
	FetchContent_Populate(stm32cubewb)
	
	# make variables pointing to directories and source code
	set(stm32wbxx_hal_dir ${stm32cubewb_SOURCE_DIR}/Drivers/STM32WBxx_HAL_Driver)
	set(freertos_dir ${stm32cubewb_SOURCE_DIR}/Middlewares/Third_Party/FreeRTOS/Source)
	set(cmsis_dir ${stm32cubewb_SOURCE_DIR}/Drivers/CMSIS)
	
	# include cmake files that define variables
	include(hal_files.cmake)

	# CMSIS library
	add_library(cmsis INTERFACE)
	target_include_directories(cmsis
		INTERFACE ${cmsis_dir}/Core/Include
		INTERFACE ${cmsis_dir}/Device/ST/STM32WBxx/Include
	)

	# Required CMSIS startup/system files
	add_library(stm32wb55xx OBJECT
		${cmsis_dir}/Device/ST/STM32WBxx/Source/Templates/system_${MCU_LOWER_SHORT}.c
		${cmsis_dir}/Device/ST/STM32WBxx/Source/Templates/gcc/startup_${MCU_LOWER_LONG}_cm4.s
	)
	target_link_libraries(stm32wb55xx
		PRIVATE cmsis
	)

	# HAL shared object file
	add_library(stm32wbxx_hal
		${stm32wbxx_hal_src}
		${st32mwbxx_hal_inc}
	)
	target_include_directories(stm32wbxx_hal
		PUBLIC ${CMAKE_SOURCE_DIR}/config
		PUBLIC ${stm32cubewb_SOURCE_DIR}/Drivers/STM32WBxx_HAL_Driver/Inc
	)
	target_link_libraries(stm32wbxx_hal
		PRIVATE cmsis
	)

	# FreeRTOS
	add_library(freertos_cm4
		${freertos_src}
		${freertos_inc}
	)
	target_include_directories(freertos_cm4
		PUBLIC ${CMAKE_SOURCE_DIR}/config
		PUBLIC ${freertos_dir}/include
		PUBLIC ${freertos_dir}/portable/GCC/ARM_CM4F
	)
	set_target_properties(freertos_cm4 PROPERTIES LINKER_LANGUAGE C)
	string(REPLACE "-flto" "" DEBUG_FLAGS "${DEBUG_FLAGS}")
endif()
