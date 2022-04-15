# set the CMake toolchain to arm-none-eabi
set(CMAKE_TOOLCHAIN_FILE "${CMAKE_SOURCE_DIR}/cmake/arm-none-eabi-gcc.cmake")
include("arm-none-eabi-gcc")

# create variables with MCU names
set(MCU_UPPER_LONG "STM32WB55xx")
set(MCU_LOWER_LONG "stm32wb55xx")
set(MCU_UPPER_SHORT "STM32WBxx")
set(MCU_LOWER_SHORT "stm32wbxx")

# add compile defintions
add_definitions(-D${MCU_UPPER_LONG})

# enable asm for stm startup.s file
enable_language(ASM)

# set extra flags
set(ARCH_FLAGS "-mcpu=cortex-m4 -mthumb -mfpu=fpv4-sp-d16 -mfloat-abi=hard")
set(ERROR_FLAGS "-Wall")
set(DEBUG_FLAGS "-Og -g -gdwarf-2")
set(OPTION_FLAGS "-fdata-sections -ffunction-sections")
set(LD_OPTION_FLAGS "-Wl,-Map=output.map -Wl,--gc-sections")
set(ASM_OPTION_FLAGS "-Wa,-a,-ad")

# set compiler/assembler/linker flags
set(CMAKE_C_FLAGS
	"${ARCH_FLAGS} ${ERROR_FLAGS} ${DEBUG_FLAGS} ${OPTION_FLAGS} ${ASM_OPTION_FLAGS} ${CMAKE_C_FLAGS}"
	CACHE INTERNAL "c compiler flags"
)
set(CMAKE_CXX_FLAGS
	"${CMAKE_C_FLAGS} ${CMAKE_CXX_FLAGS}"
	CACHE INTERNAL "cxx compiler flags"
)
set(CMAKE_ASM_FLAGS
	"${ARCH_FLAGS} ${ASM_OPTION_FLAGS} ${CMAKE_ASM_FLAGS}"
	CACHE INTERNAL "asm compiler flags"
)
set(CMAKE_EXE_LINKER_FLAGS
	"${CMAKE_EXE_LINKER_FLAGS}"
	CACHE INTERNAL "exe link flags"
)

message(STATUS
    "BUILD FLAGS:\n"
    "   c flags         : ${CMAKE_C_FLAGS}\n\n"
    "   ld flags        : ${CMAKE_EXE_LINKER_FLAGS}\n\n"
    "   asm flags       : ${CMAKE_ASM_FLAGS}\n"
)
