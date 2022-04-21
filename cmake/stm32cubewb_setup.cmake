function(stm32cubewb_setup target)
	include(stm32cubewb_files)
	foreach(dep IN LISTS ARGN)
		if(${MCU} STREQUAL "stm32wb55xx")
			target_sources(${target}
				PRIVATE ${stm32wb55xx_system_sir}
			)
		endif()
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
	endforeach()
	get_target_property(result ${target} INCLUDE_DIRECTORIES)
	message(STATUS ${result})
endfunction()
