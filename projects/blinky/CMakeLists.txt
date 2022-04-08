file(GLOB C_SOURCE
	main.c
)

add_executable(blinky.elf
	${C_SOURCE}
	$<TARGET_OBJECTS:stm32wb>
)
target_link_libraries(blinky.elf 
	PRIVATE cmsis_device_wb
)
