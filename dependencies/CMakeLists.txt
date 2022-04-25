include(FetchContent)

FetchContent_Declare(stm32cubewb
	GIT_REPOSITORY git@github.com:STMicroelectronics/STM32CubeWB.git
	GIT_TAG 398d0fbc5ef491da30f777575b911e50e68fa77f
	CONFIGURE_COMMAND ""
	BUILD_COMMAND ""
)

string(FIND ${MCU} "wb" mcu_stm32wb)
if (NOT mcu_stm32wb EQUAL -1)
	add_subdirectory(stm32cubewb)
endif()
