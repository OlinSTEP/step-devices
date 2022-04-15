
FetchContent_GetProperties(stm32cubewb)
if (NOT stm32cubewb_POPULATED)
	FetchContent_Populate(stm32cubewb)
	
	# make variables pointing to directories and source code
	set(stm32wb_hal_dir ${stm32cubewb_SOURCE_DIR}/Drivers/STM32WBxx_HAL_Driver)
	set(freertos_dir ${stm32cubewb_SOURCE_DIR}/Middlewares/Third_Party/FreeRTOS/Source)
	set(cmsis_dir ${stm32cubewb_SOURCE_DIR}/Drivers/CMSIS)

	# CMSIS library
	add_library(cmsis INTERFACE)
	target_include_directories(cmsis
		INTERFACE ${cmsis_dir}/Core/Include
		INTERFACE ${cmsis_dir}/Device/ST/STM32WBxx/Include
	)

	# Required CMSIS startup/system files
	add_library(stm32wb OBJECT
		${cmsis_dir}/Device/ST/STM32WBxx/Source/Templates/system_${MCU_LOWER_SHORT}.c
		${cmsis_dir}/Device/ST/STM32WBxx/Source/Templates/gcc/startup_${MCU_LOWER_LONG}_cm4.s
	)
	target_link_libraries(stm32wb
		PRIVATE cmsis
	)

	# HAL shared object file
	add_library(stm32wbxx_hal
		${stm32wb_hal_dir}/Src/stm32wbxx_hal.c
		${stm32wb_hal_dir}/Src/stm32wbxx_hal_tim.c
		${stm32wb_hal_dir}/Src/stm32wbxx_hal_tim_ex.c
		${stm32wb_hal_dir}/Src/stm32wbxx_hal_uart.c
		${stm32wb_hal_dir}/Src/stm32wbxx_hal_uart_ex.c
		${stm32wb_hal_dir}/Src/stm32wbxx_hal_rcc.c
		${stm32wb_hal_dir}/Src/stm32wbxx_hal_rcc_ex.c
		${stm32wb_hal_dir}/Src/stm32wbxx_hal_flash.c
		${stm32wb_hal_dir}/Src/stm32wbxx_hal_flash_ex.c
		${stm32wb_hal_dir}/Src/stm32wbxx_hal_gpio.c
		${stm32wb_hal_dir}/Src/stm32wbxx_hal_hsem.c
		${stm32wb_hal_dir}/Src/stm32wbxx_hal_dma.c
		${stm32wb_hal_dir}/Src/stm32wbxx_hal_dma_ex.c
		${stm32wb_hal_dir}/Src/stm32wbxx_hal_pwr.c
		${stm32wb_hal_dir}/Src/stm32wbxx_hal_pwr_ex.c
		${stm32wb_hal_dir}/Src/stm32wbxx_hal_cortex.c
		${stm32wb_hal_dir}/Src/stm32wbxx_hal_exti.c
		${stm32wb_hal_dir}/Src/stm32wbxx_hal_pcd.c
		${stm32wb_hal_dir}/Src/stm32wbxx_hal_pcd_ex.c
		${stm32wb_hal_dir}/Src/stm32wbxx_ll_usb.c
	)
	target_include_directories(stm32wbxx_hal
		PUBLIC ${CMAKE_SOURCE_DIR}/config
		PUBLIC ${stm32cubewb_SOURCE_DIR}/Drivers/STM32WBxx_HAL_Driver/Inc
	)
	target_link_libraries(stm32wbxx_hal
		PRIVATE cmsis
	)

	# FreeRTOS
	set(freertos_src
		${freertos_dir}/portable/GCC/ARM_CM4F/port.c
		${freertos_dir}/portable/MemMang/heap_1.c
		${freertos_dir}/portable/MemMang/heap_2.c
		${freertos_dir}/portable/MemMang/heap_3.c
		${freertos_dir}/portable/MemMang/heap_4.c
		${freertos_dir}/portable/MemMang/heap_5.c
		${freertos_dir}/croutine.c
		${freertos_dir}/event_groups.c
		${freertos_dir}/list.c
		${freertos_dir}/queue.c
		${freertos_dir}/stream_buffer.c
		${freertos_dir}/tasks.c
		${freertos_dir}/timers.c
	)
	


	add_library(freertos ${freertos_src})
	target_include_directories(freertos
		PUBLIC ${CMAKE_SOURCE_DIR}/config
		PUBLIC ${freertos_dir}/include
		PUBLIC ${freertos_dir}/portable/GCC/ARM_CM4F
	)
	set_target_properties(freertos PROPERTIES LINKER_LANGUAGE C)
	string(REPLACE "-flto" "" DEBUG_FLAGS "${DEBUG_FLAGS}")
endif()
