# set the CMake toolchain to arm-none-eabi
set(CMAKE_TOOLCHAIN_FILE "${CMAKE_SOURCE_DIR}/cmake/arm-none-eabi-gcc.cmake")
include("arm-none-eabi-gcc")

# create variables with MCU names
set(MCU_UPPER_LONG "STM32WB55xx")
set(MCU_LOWER_LONG "stm32wb55xx")
set(MCU_UPPER_SHORT "STM32WBxx")
set(MCU_LOWER_SHORT "stm32wbxx")

# download linker
file(DOWNLOAD "https://raw.githubusercontent.com/STMicroelectronics/cmsis_device_wb/master/Source/Templates/gcc/linker/stm32wb55xx_flash_cm4.ld"
	${CMAKE_BINARY_DIR}/stm32wb55xx_flash_cm4.ld
)

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
set(ASM_OPTION_FLAGS "")

# set compiler/assembler/linker flags
string(APPEND CMAKE_C_FLAGS
	" ${ARCH_FLAGS} ${ERROR_FLAGS} ${DEBUG_FLAGS} ${OPTION_FLAGS} ${ASM_OPTION_FLAGS}"
)
string(APPEND CMAKE_CXX_FLAGS
	" ${CMAKE_C_FLAGS}"
)
string(APPEND CMAKE_ASM_FLAGS
	" ${ARCH_FLAGS} ${ASM_OPTION_FLAGS}"
)
string(APPEND CMAKE_EXE_LINKER_FLAGS
	" -T${CMAKE_BINARY_DIR}/stm32wb55xx_flash_cm4.ld"
)

