### Preamble
cmake_minimum_required(VERSION 3.11)
project(step-devices)


### Project wide setup
list(APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_LIST_DIR}/cmake)
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED YES)
set(CMAKE_CXX_EXTENSIONS NO)

# enable asm for stm startup.s file
enable_language(ASM)

# set variable for typically used flags
set(ARCH_FLAGS "\
	-mcpu=cortex-m4 \
	-mthumb \
	-mfpu=fpv4-sp-d16 \
	-mfloat-abi=hard"
)
set(ERROR_FLAGS "-Wall")
set(DEBUG_FLAGS "-Og -g -gdwarf-2")

# set compiler/assembler/linker flags
set(CMAKE_C_FLAGS
	"${ARCH_FLAGS} ${ERROR_FLAGS} ${DEBUG_FLAGS} -fdata-sections -ffunction-sections -Wa,-a,-ad,-alms=build/main.lst"
	CACHE INTERNAL "asm compiler flags"
)
set(CMAKE_ASM_FLAGS
	"-x assembler-with-cpp ${CMAKE_ASM_FLAGS}"
	CACHE INTERNAL "c compiler flags"
)
set(CMAKE_EXE_LINKER_FLAGS
	"${ARCH_FLAGS} -specs=nano.specs -lc -lm -lnosys  -Wl,-Map=linker.map,--cref -Wl,--gc-sections"
	CACHE INTERNAL "exe link flags"
)


### Externally provided content
add_subdirectory(dependencies)


### Main targets built by this project
add_subdirectory(projects/blinky)
