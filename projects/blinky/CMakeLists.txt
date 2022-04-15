get_filename_component(project_name ${CMAKE_CURRENT_LIST_DIR} NAME)

file(GLOB C_SOURCE
	main.c
)

add_executable(${project_name}.elf
	${C_SOURCE}
	$<TARGET_OBJECTS:stm32wb>
)

add_custom_target(${project_name}.bin ALL
	COMMAND ${CMAKE_OBJCOPY} -O binary -S ${project_name}.elf ${project_name}.bin
	DEPENDS ${project_name}.elf
)


target_link_libraries(${project_name}.elf 
	PRIVATE cmsis
)
