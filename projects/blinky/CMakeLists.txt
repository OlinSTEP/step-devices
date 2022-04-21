include(stm32cubewb_setup)
get_filename_component(project_name ${CMAKE_CURRENT_LIST_DIR} NAME)

file(GLOB C_SOURCE
	main.c
)
add_executable(${project_name}.elf
	${C_SOURCE}
)
target_include_directories(${project_name}.elf
	PUBLIC ${CMAKE_CURRENT_LIST_DIR}/config
)

stm32cubewb_setup(${project_name}.elf "cmsis" "hal")

add_custom_target(${project_name}.bin ALL
	COMMAND ${CMAKE_OBJCOPY} -O binary -S ${project_name}.elf ${project_name}.bin
	DEPENDS ${project_name}.elf
)
