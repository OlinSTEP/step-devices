file(GLOB C_SOURCE
	main.c
)

add_executable(${PROJECT_NAME}.elf
	${C_SOURCE}
	$<TARGET_OBJECTS:stm32wb>
)
target_link_libraries(${PROJECT_NAME}.elf 
	PRIVATE cmsis_device_wb
)
