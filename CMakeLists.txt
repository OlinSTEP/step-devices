# Preamble
cmake_minimum_required(VERSION 3.11)
project(step-devices)


# Project wide setup
list(APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_LIST_DIR}/cmake)
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED YES)
set(CMAKE_CXX_EXTENSIONS NO)

# enable asm for stm startup.s file
enable_language(ASM)

set(COMPILER_OPTIMISATION "-Og")

# Set custom flags for compiling and for the STM32
set(STM32WB_ASM_OPTIONS "-x assembler-with-cpp -mcpu=cortex-m4 -mthumb -mfpu=fpv4-sp d16 -mfloat-abi=hard")
set(CMAKE_ASM_FLAGS "${STM32WB_ASM_OPTIONS}" CACHE INTERNAL "asm compiler flags")

set(STM32_COMPILER_OPTIONS " \
    -mcpu=cortex-m4 \
    -mthumb \
    -mfpu=fpv4-sp d16 \
    -mfloat-abi=hard \
    -ffunction-sections \
    -fdata-sections \
    -Wall -Werror \
    -Wl,-Map=output.map -Wl,--gc-sections \
    -lm -lc"
)
set(CMAKE_C_FLAGS "${STM32WB_COMPILER_OPTIONS} ${COMPILER_OPTIMISATION}" CACHE INTERNAL "c compiler flags")

set(EXTRA_LINKER_FLAGS "-lm -lc --specs=nano.specs --specs=nosys.specs ")
set(CMAKE_EXE_LINKER_FLAGS "${STM32WB_COMPILER_OPTIONS} -Wl,-Map=linker.map -Wl,-cref " CACHE INTERNAL "exe link flags")
set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} ${EXTRA_LINKER_FLAGS} -T${LINKER_FILE}")

# Externally provided content
add_subdirectory(dependencies)



# Main targets built by this project (add a separate line here for each project in /projects)
add_subdirectory(projects/blinky)