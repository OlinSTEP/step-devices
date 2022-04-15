include(FetchContent)

FetchContent_Declare(cmsis_device_wb
	GIT_REPOSITORY git@github.com:STMicroelectronics/cmsis_device_wb.git
	GIT_TAG 9c5d1920dd9fabbe2548e10561d63db829bb744f
	CONFIGURE_COMMAND ""
	BUILD_COMMAND ""
)

FetchContent_Declare(cmsis_core
	GIT_REPOSITORY git@github.com:STMicroelectronics/cmsis_core.git
	GIT_TAG 96d6da4e252b06dcfdc041e7df23e86161c33007
	CONFIGURE_COMMAND ""
	BUILD_COMMAND ""
)

FetchContent_Declare(stm32cubewb
	GIT_REPOSITORY git@github.com:STMicroelectronics/STM32CubeWB.git
	GIT_TAG 398d0fbc5ef491da30f777575b911e50e68fa77f
	CONFIGURE_COMMAND ""
	BUILD_COMMAND ""
)

add_subdirectory(cmsis_core)

string(FIND ${MCU} "wb" mcu_stm32wb)
if (NOT mcu_stm32wb EQUAL -1)
	message(STATUS "WE ARE HERE")
	add_subdirectory(cmsis_device_wb)
	add_subdirectory(stm32cubewb)
endif()
