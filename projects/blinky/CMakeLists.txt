file(GLOB C_SOURCE
	main.c
)

add_executable(blinky.elf
	${C_SOURCE}
	$<TARGET_OBJECTS:stm32wb>
)

add_custom_target(blinky.bin ALL
	COMMAND ${CMAKE_OBJCOPY} -O binary -S blinky.elf blinky.bin
)

target_link_libraries(blinky.elf 
	PRIVATE cmsis_device_wb
)
