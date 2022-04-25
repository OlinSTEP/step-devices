function(stm32cubewb_setup target)
	include(stm32cubewb_files)
	if(${MCU} STREQUAL "stm32wb55xx")
		target_sources(${target}
			PRIVATE ${stm32wb55xx_system_src}
		)
	endif()
	foreach(dep IN LISTS ARGN)
		if(dep STREQUAL "cmsis")
			target_include_directories(${target}
				PUBLIC ${cmsis_dir}
			)
		endif()
		if(dep STREQUAL "hal")
			target_sources(${target}
				PRIVATE ${stm32wbxx_hal_src}
				PUBLIC ${stm32wbxx_hal_inc}
			)
			target_include_directories(${target}
				PUBLIC ${stm32wbxx_hal_dir}
			)
		endif()
		if(dep STREQUAL "bsp")
			target_sources(${target}
				PRIVATE ${nucleo_wb55_src}
				PUBLIC ${nucleo_wb55_inc}
			)
			target_include_directories(${target}
				PUBLIC ${nucleo_wb55_dir}
			)
			target_compile_definitions(${target}
				PRIVATE USE_STM32WBXX_NUCLEO
				PRIVATE USE_HAL_DRIVER
				PRIVATE DEBUG
			)
		endif()
		if(dep STREQUAL "stm32_wpan")
			target_sources(${target}
				PRIVATE ${stm32_wpan_src}
			)
			target_include_directories(${target}
				PUBLIC ${stm32_wpan_dir}
			)
		endif()
		if(dep STREQUAL "lpm")
			target_sources(${target}
				PRIVATE ${lpm_src}
				PUBLIC ${lpm_inc}
			)
			target_include_directories(${target}
				PUBLIC ${lpm_dir}
			)
		endif()
		if(dep STREQUAL "sequencer")
			target_sources(${target}
				PRIVATE ${sequencer_src}
				PUBLIC ${sequencer_inc}
			)
			target_include_directories(${target}
				PUBLIC ${sequencer_dir}
			)
		endif()
		if(dep STREQUAL "rtos")
			target_sources(${target}
				PRIVATE ${freertos_cm4_src}
				PUBLIC ${freertos_cm4_inc}
			)
			target_include_directories(${target}
				PUBLIC ${freertos_cm4_dir}
			)
		endif()
	endforeach()
	get_target_property(result ${target} INCLUDE_DIRECTORIES)
endfunction()
