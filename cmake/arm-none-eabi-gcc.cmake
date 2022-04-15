set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR arm-none-eabi)

if(MINGW OR CYGWIN OR WIN32)
    set(UTIL_SEARCH_CMD where)
elseif(UNIX OR APPLE)
    set(UTIL_SEARCH_CMD which)
endif()

set(TOOLCHAIN_PREFIX arm-none-eabi)

# this is a really dumb way of figuring out where our paths are
execute_process(
  COMMAND ${UTIL_SEARCH_CMD} ${TOOLCHAIN_PREFIX}-gcc
  OUTPUT_VARIABLE BINUTILS_PATH
  OUTPUT_STRIP_TRAILING_WHITESPACE
)
get_filename_component(ARM_TOOLCHAIN_DIR ${BINUTILS_PATH} DIRECTORY)

set(CMAKE_C_COMPILER		${TOOLCHAIN_PREFIX}-gcc)
set(CMAKE_ASM_COMPILER		${TOOLCHAIN_PREFIX}-gcc)
set(CMAKE_CXX_COMPILER		${TOOLCHAIN_PREFIX}-g++)
SET(CMAKE_AR				${TOOLCHAIN_PREFIX}-gcc-ar)
SET(CMAKE_RANLIB			${TOOLCHAIN_PREFIX}-gcc-ranlib)
SET(CMAKE_LD				${TOOLCHAIN_PREFIX}-ld)
set(CMAKE_OBJCOPY			${TOOLCHAIN_PREFIX}-objcopy CACHE INTERNAL "objcopy command")
set(CMAKE_OBJDUMP			${TOOLCHAIN_PREFIX}-objdump CACHE INTERNAL "objdump command")
set(CMAKE_GDB				${TOOLCHAIN_PREFIX}-gdb)
set(CMAKE_SIZE				${TOOLCHAIN_PREFIX}-size)
set(CMAKE_SIZE_UTIL			${TOOLCHAIN_PREFIX}-size CACHE INTERNAL "size tool")


# set(CMAKE_C_FLAGS "" CACHE INTERNAL "c compiler flags")
# set(CMAKE_CXX_FLAGS "" CACHE INTERNAL "cxx compiler flags")
# set(CMAKE_ASM_FLAGS "-x assembler-with-cpp " CACHE INTERNAL "asm compiler flags")
# set(CMAKE_EXE_LINKER_FLAGS "-Wl,-Map=linker.map -Wl,-cref -Wl,--gc-sections -lm -lc -lnosys --specs=nosys.specs --specs=nano.specs " CACHE INTERNAL "exe link flags")

set(CMAKE_C_FLAGS "" CACHE INTERNAL "c compiler flags")
set(CMAKE_ASM_FLAGS "" CACHE INTERNAL "cxx compiler flags")
set(CMAKE_EXE_LINKER_FLAGS "" CACHE INTERNAL "exe linker flags")

string(APPEND CMAKE_ASM_FLAGS " -x assembler-with-cpp")
string(APPEND CMAKE_EXE_LINKER_FLAGS " -Wl,-Map=linker.map -Wl,-cref -Wl,--gc-sections -lm -lc -lnosys --specs=nosys.specs --specs=nano.specs")

set(CMAKE_FIND_ROOT_PATH ${BINUTILS_PATH})
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
