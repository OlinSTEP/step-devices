include(stm32cubewb_setup)
get_filename_component(project_name ${CMAKE_CURRENT_LIST_DIR} NAME)

file(GLOB_RECURSE C_SOURCE
	src/*.c
)

file(GLOB_RECURSE C_INCLUDE
	inc/*.h
)

add_executable(${project_name}.elf)

stm32cubewb_setup(${project_name}.elf "cmsis" "hal" "bsp" "lpm" "sequencer" "stm32_wpan")

target_sources(${project_name}.elf
	PRIVATE ${C_SOURCE}
	PUBLIC ${C_INCLUDE}
)

target_include_directories(${project_name}.elf
	PUBLIC ${CMAKE_CURRENT_LIST_DIR}/inc
	PUBLIC ${CMAKE_CURRENT_LIST_DIR}/config
)

add_custom_target(${project_name}.bin ALL
	COMMAND ${CMAKE_OBJCOPY} -O binary -S ${project_name}.elf ${project_name}.bin
	DEPENDS ${project_name}.elf
)
