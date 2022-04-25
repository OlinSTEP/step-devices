FetchContent_GetProperties(stm32cubewb)

# set directory variables
set(stm32wbxx_hal_directory ${stm32cubewb_SOURCE_DIR}/Drivers/STM32WBxx_HAL_Driver)
set(cmsis_directory ${stm32cubewb_SOURCE_DIR}/Drivers/CMSIS)
set(freertos_directory ${stm32cubewb_SOURCE_DIR}/Middlewares/Third_Party/FreeRTOS/Source)
set(bsp_directory ${stm32cubewb_SOURCE_DIR}/Drivers/BSP)
set(stm32_wpan_directory ${stm32cubewb_SOURCE_DIR}/Middlewares/ST/STM32_WPAN)
set(lpm_directory ${stm32cubewb_SOURCE_DIR}/Utilities/lpm)
set(sequencer_directory ${stm32cubewb_SOURCE_DIR}/Utilities/sequencer)

# CMSIS
set(cmsis_dir
	${cmsis_directory}/Core/Include
	${cmsis_directory}/Device/ST/STM32WBxx/Include
)

# STM32WB55xx System
set(stm32wb55xx_system_src
	${cmsis_directory}/Device/ST/STM32WBxx/Source/Templates/system_${MCU_LOWER_SHORT}.c
    ${cmsis_directory}/Device/ST/STM32WBxx/Source/Templates/gcc/startup_${MCU_LOWER_LONG}_cm4.s
)

# HAL
set(stm32wbxx_hal_dir
	${stm32wbxx_hal_directory}/Inc
)

set(stm32wbxx_hal_src
    ${stm32wbxx_hal_directory}/Src/stm32wbxx_hal_adc.c
    ${stm32wbxx_hal_directory}/Src/stm32wbxx_hal_adc_ex.c
    ${stm32wbxx_hal_directory}/Src/stm32wbxx_hal.c
    ${stm32wbxx_hal_directory}/Src/stm32wbxx_hal_comp.c
    ${stm32wbxx_hal_directory}/Src/stm32wbxx_hal_cortex.c
    ${stm32wbxx_hal_directory}/Src/stm32wbxx_hal_crc.c
    ${stm32wbxx_hal_directory}/Src/stm32wbxx_hal_crc_ex.c
    ${stm32wbxx_hal_directory}/Src/stm32wbxx_hal_cryp.c
    ${stm32wbxx_hal_directory}/Src/stm32wbxx_hal_cryp_ex.c
    ${stm32wbxx_hal_directory}/Src/stm32wbxx_hal_dma.c
    ${stm32wbxx_hal_directory}/Src/stm32wbxx_hal_dma_ex.c
    ${stm32wbxx_hal_directory}/Src/stm32wbxx_hal_exti.c
    ${stm32wbxx_hal_directory}/Src/stm32wbxx_hal_flash.c
    ${stm32wbxx_hal_directory}/Src/stm32wbxx_hal_flash_ex.c
    ${stm32wbxx_hal_directory}/Src/stm32wbxx_hal_gpio.c
    ${stm32wbxx_hal_directory}/Src/stm32wbxx_hal_hsem.c
    ${stm32wbxx_hal_directory}/Src/stm32wbxx_hal_i2c.c
    ${stm32wbxx_hal_directory}/Src/stm32wbxx_hal_i2c_ex.c
    ${stm32wbxx_hal_directory}/Src/stm32wbxx_hal_ipcc.c
    ${stm32wbxx_hal_directory}/Src/stm32wbxx_hal_irda.c
    ${stm32wbxx_hal_directory}/Src/stm32wbxx_hal_iwdg.c
    ${stm32wbxx_hal_directory}/Src/stm32wbxx_hal_lcd.c
    ${stm32wbxx_hal_directory}/Src/stm32wbxx_hal_lptim.c
    ${stm32wbxx_hal_directory}/Src/stm32wbxx_hal_pcd.c
    ${stm32wbxx_hal_directory}/Src/stm32wbxx_hal_pcd_ex.c
    ${stm32wbxx_hal_directory}/Src/stm32wbxx_hal_pka.c
    ${stm32wbxx_hal_directory}/Src/stm32wbxx_hal_pwr.c
    ${stm32wbxx_hal_directory}/Src/stm32wbxx_hal_pwr_ex.c
    ${stm32wbxx_hal_directory}/Src/stm32wbxx_hal_qspi.c
    ${stm32wbxx_hal_directory}/Src/stm32wbxx_hal_rcc.c
    ${stm32wbxx_hal_directory}/Src/stm32wbxx_hal_rcc_ex.c
    ${stm32wbxx_hal_directory}/Src/stm32wbxx_hal_rng.c
    ${stm32wbxx_hal_directory}/Src/stm32wbxx_hal_rtc.c
    ${stm32wbxx_hal_directory}/Src/stm32wbxx_hal_rtc_ex.c
    ${stm32wbxx_hal_directory}/Src/stm32wbxx_hal_sai.c
    ${stm32wbxx_hal_directory}/Src/stm32wbxx_hal_sai_ex.c
    ${stm32wbxx_hal_directory}/Src/stm32wbxx_hal_smartcard.c
    ${stm32wbxx_hal_directory}/Src/stm32wbxx_hal_smartcard_ex.c
    ${stm32wbxx_hal_directory}/Src/stm32wbxx_hal_smbus.c
    ${stm32wbxx_hal_directory}/Src/stm32wbxx_hal_smbus_ex.c
    ${stm32wbxx_hal_directory}/Src/stm32wbxx_hal_spi.c
    ${stm32wbxx_hal_directory}/Src/stm32wbxx_hal_spi_ex.c
    ${stm32wbxx_hal_directory}/Src/stm32wbxx_hal_tim.c
    ${stm32wbxx_hal_directory}/Src/stm32wbxx_hal_tim_ex.c
    ${stm32wbxx_hal_directory}/Src/stm32wbxx_hal_tsc.c
    ${stm32wbxx_hal_directory}/Src/stm32wbxx_hal_uart.c
    ${stm32wbxx_hal_directory}/Src/stm32wbxx_hal_uart_ex.c
    ${stm32wbxx_hal_directory}/Src/stm32wbxx_hal_usart.c
    ${stm32wbxx_hal_directory}/Src/stm32wbxx_hal_usart_ex.c
    ${stm32wbxx_hal_directory}/Src/stm32wbxx_hal_wwdg.c
    ${stm32wbxx_hal_directory}/Src/stm32wbxx_ll_adc.c
    ${stm32wbxx_hal_directory}/Src/stm32wbxx_ll_comp.c
    ${stm32wbxx_hal_directory}/Src/stm32wbxx_ll_crc.c
    ${stm32wbxx_hal_directory}/Src/stm32wbxx_ll_crs.c
    ${stm32wbxx_hal_directory}/Src/stm32wbxx_ll_dma.c
    ${stm32wbxx_hal_directory}/Src/stm32wbxx_ll_exti.c
    ${stm32wbxx_hal_directory}/Src/stm32wbxx_ll_gpio.c
    ${stm32wbxx_hal_directory}/Src/stm32wbxx_ll_i2c.c
    ${stm32wbxx_hal_directory}/Src/stm32wbxx_ll_lptim.c
    ${stm32wbxx_hal_directory}/Src/stm32wbxx_ll_lpuart.c
    ${stm32wbxx_hal_directory}/Src/stm32wbxx_ll_pka.c
    ${stm32wbxx_hal_directory}/Src/stm32wbxx_ll_pwr.c
    ${stm32wbxx_hal_directory}/Src/stm32wbxx_ll_rcc.c
    ${stm32wbxx_hal_directory}/Src/stm32wbxx_ll_rng.c
    ${stm32wbxx_hal_directory}/Src/stm32wbxx_ll_rtc.c
    ${stm32wbxx_hal_directory}/Src/stm32wbxx_ll_spi.c
    ${stm32wbxx_hal_directory}/Src/stm32wbxx_ll_tim.c
    ${stm32wbxx_hal_directory}/Src/stm32wbxx_ll_usart.c
    ${stm32wbxx_hal_directory}/Src/stm32wbxx_ll_usb.c
    ${stm32wbxx_hal_directory}/Src/stm32wbxx_ll_utils.c
)

set(stm32wbxx_hal_inc
    ${stm32wbxx_hal_directory}/Inc/stm32wbxx_hal_adc_ex.h
    ${stm32wbxx_hal_directory}/Inc/stm32wbxx_hal_adc.h
    ${stm32wbxx_hal_directory}/Inc/stm32wbxx_hal_comp.h
    ${stm32wbxx_hal_directory}/Inc/stm32wbxx_hal_cortex.h
    ${stm32wbxx_hal_directory}/Inc/stm32wbxx_hal_crc_ex.h
    ${stm32wbxx_hal_directory}/Inc/stm32wbxx_hal_crc.h
    ${stm32wbxx_hal_directory}/Inc/stm32wbxx_hal_cryp_ex.h
    ${stm32wbxx_hal_directory}/Inc/stm32wbxx_hal_cryp.h
    ${stm32wbxx_hal_directory}/Inc/stm32wbxx_hal_def.h
    ${stm32wbxx_hal_directory}/Inc/stm32wbxx_hal_dma_ex.h
    ${stm32wbxx_hal_directory}/Inc/stm32wbxx_hal_dma.h
    ${stm32wbxx_hal_directory}/Inc/stm32wbxx_hal_exti.h
    ${stm32wbxx_hal_directory}/Inc/stm32wbxx_hal_flash_ex.h
    ${stm32wbxx_hal_directory}/Inc/stm32wbxx_hal_flash.h
    ${stm32wbxx_hal_directory}/Inc/stm32wbxx_hal_gpio_ex.h
    ${stm32wbxx_hal_directory}/Inc/stm32wbxx_hal_gpio.h
    ${stm32wbxx_hal_directory}/Inc/stm32wbxx_hal.h
    ${stm32wbxx_hal_directory}/Inc/stm32wbxx_hal_hsem.h
    ${stm32wbxx_hal_directory}/Inc/stm32wbxx_hal_i2c_ex.h
    ${stm32wbxx_hal_directory}/Inc/stm32wbxx_hal_i2c.h
    ${stm32wbxx_hal_directory}/Inc/stm32wbxx_hal_ipcc.h
    ${stm32wbxx_hal_directory}/Inc/stm32wbxx_hal_irda_ex.h
    ${stm32wbxx_hal_directory}/Inc/stm32wbxx_hal_irda.h
    ${stm32wbxx_hal_directory}/Inc/stm32wbxx_hal_iwdg.h
    ${stm32wbxx_hal_directory}/Inc/stm32wbxx_hal_lcd.h
    ${stm32wbxx_hal_directory}/Inc/stm32wbxx_hal_lptim.h
    ${stm32wbxx_hal_directory}/Inc/stm32wbxx_hal_pcd_ex.h
    ${stm32wbxx_hal_directory}/Inc/stm32wbxx_hal_pcd.h
    ${stm32wbxx_hal_directory}/Inc/stm32wbxx_hal_pka.h
    ${stm32wbxx_hal_directory}/Inc/stm32wbxx_hal_pwr_ex.h
    ${stm32wbxx_hal_directory}/Inc/stm32wbxx_hal_pwr.h
    ${stm32wbxx_hal_directory}/Inc/stm32wbxx_hal_qspi.h
    ${stm32wbxx_hal_directory}/Inc/stm32wbxx_hal_rcc_ex.h
    ${stm32wbxx_hal_directory}/Inc/stm32wbxx_hal_rcc.h
    ${stm32wbxx_hal_directory}/Inc/stm32wbxx_hal_rng.h
    ${stm32wbxx_hal_directory}/Inc/stm32wbxx_hal_rtc_ex.h
    ${stm32wbxx_hal_directory}/Inc/stm32wbxx_hal_rtc.h
    ${stm32wbxx_hal_directory}/Inc/stm32wbxx_hal_sai_ex.h
    ${stm32wbxx_hal_directory}/Inc/stm32wbxx_hal_sai.h
    ${stm32wbxx_hal_directory}/Inc/stm32wbxx_hal_smartcard_ex.h
    ${stm32wbxx_hal_directory}/Inc/stm32wbxx_hal_smartcard.h
    ${stm32wbxx_hal_directory}/Inc/stm32wbxx_hal_smbus_ex.h
    ${stm32wbxx_hal_directory}/Inc/stm32wbxx_hal_smbus.h
    ${stm32wbxx_hal_directory}/Inc/stm32wbxx_hal_spi_ex.h
    ${stm32wbxx_hal_directory}/Inc/stm32wbxx_hal_spi.h
    ${stm32wbxx_hal_directory}/Inc/stm32wbxx_hal_tim_ex.h
    ${stm32wbxx_hal_directory}/Inc/stm32wbxx_hal_tim.h
    ${stm32wbxx_hal_directory}/Inc/stm32wbxx_hal_tsc.h
    ${stm32wbxx_hal_directory}/Inc/stm32wbxx_hal_uart_ex.h
    ${stm32wbxx_hal_directory}/Inc/stm32wbxx_hal_uart.h
    ${stm32wbxx_hal_directory}/Inc/stm32wbxx_hal_usart_ex.h
    ${stm32wbxx_hal_directory}/Inc/stm32wbxx_hal_usart.h
    ${stm32wbxx_hal_directory}/Inc/stm32wbxx_hal_wwdg.h
    ${stm32wbxx_hal_directory}/Inc/stm32wbxx_ll_adc.h
    ${stm32wbxx_hal_directory}/Inc/stm32wbxx_ll_bus.h
    ${stm32wbxx_hal_directory}/Inc/stm32wbxx_ll_comp.h
    ${stm32wbxx_hal_directory}/Inc/stm32wbxx_ll_cortex.h
    ${stm32wbxx_hal_directory}/Inc/stm32wbxx_ll_crc.h
    ${stm32wbxx_hal_directory}/Inc/stm32wbxx_ll_crs.h
    ${stm32wbxx_hal_directory}/Inc/stm32wbxx_ll_dma.h
    ${stm32wbxx_hal_directory}/Inc/stm32wbxx_ll_dmamux.h
    ${stm32wbxx_hal_directory}/Inc/stm32wbxx_ll_exti.h
    ${stm32wbxx_hal_directory}/Inc/stm32wbxx_ll_gpio.h
    ${stm32wbxx_hal_directory}/Inc/stm32wbxx_ll_hsem.h
    ${stm32wbxx_hal_directory}/Inc/stm32wbxx_ll_i2c.h
    ${stm32wbxx_hal_directory}/Inc/stm32wbxx_ll_ipcc.h
    ${stm32wbxx_hal_directory}/Inc/stm32wbxx_ll_iwdg.h
    ${stm32wbxx_hal_directory}/Inc/stm32wbxx_ll_lptim.h
    ${stm32wbxx_hal_directory}/Inc/stm32wbxx_ll_lpuart.h
    ${stm32wbxx_hal_directory}/Inc/stm32wbxx_ll_pka.h
    ${stm32wbxx_hal_directory}/Inc/stm32wbxx_ll_pwr.h
    ${stm32wbxx_hal_directory}/Inc/stm32wbxx_ll_rcc.h
    ${stm32wbxx_hal_directory}/Inc/stm32wbxx_ll_rng.h
    ${stm32wbxx_hal_directory}/Inc/stm32wbxx_ll_rtc.h
    ${stm32wbxx_hal_directory}/Inc/stm32wbxx_ll_spi.h
    ${stm32wbxx_hal_directory}/Inc/stm32wbxx_ll_system.h
    ${stm32wbxx_hal_directory}/Inc/stm32wbxx_ll_tim.h
    ${stm32wbxx_hal_directory}/Inc/stm32wbxx_ll_usart.h
    ${stm32wbxx_hal_directory}/Inc/stm32wbxx_ll_usb.h
    ${stm32wbxx_hal_directory}/Inc/stm32wbxx_ll_utils.h
    ${stm32wbxx_hal_directory}/Inc/stm32wbxx_ll_wwdg.h
)

# nucelo wb55 bsp
set(nucleo_wb55_src
    ${bsp_directory}/P-NUCLEO-WB55.Nucleo/stm32wbxx_nucleo.c
)
set(nucleo_wb55_inc
    ${bsp_directory}/P-NUCLEO-WB55.Nucleo/stm32wbxx_nucleo.h
)
set(nucleo_wb55_dir
    ${bsp_directory}/P-NUCLEO-WB55.Nucleo
)


# stm32_wpan
set(stm32_wpan_src
    ${stm32_wpan_directory}/ble/core/auto/ble_gap_aci.c
    ${stm32_wpan_directory}/ble/core/auto/ble_gatt_aci.c
    ${stm32_wpan_directory}/ble/core/auto/ble_hal_aci.c
    ${stm32_wpan_directory}/ble/core/auto/ble_hci_le.c
    ${stm32_wpan_directory}/utilities/dbg_trace.c
    ${stm32_wpan_directory}/interface/patterns/ble_thread/tl/hci_tl.c
    ${stm32_wpan_directory}/interface/patterns/ble_thread/tl/hci_tl_if.c
    ${stm32_wpan_directory}/ble/core/template/osal.c
    ${stm32_wpan_directory}/utilities/otp.c
    ${stm32_wpan_directory}/interface/patterns/ble_thread/shci/shci.c
    ${stm32_wpan_directory}/interface/patterns/ble_thread/tl/shci_tl.c
    ${stm32_wpan_directory}/interface/patterns/ble_thread/tl/shci_tl_if.c
    ${stm32_wpan_directory}/utilities/stm_list.c
    ${stm32_wpan_directory}/utilities/stm_queue.c
    ${stm32_wpan_directory}/ble/svc/Src/svc_ctl.c
    ${stm32_wpan_directory}/interface/patterns/ble_thread/tl/tl_mbox.c 
)

set(stm32_wpan_dir
    ${stm32_wpan_directory}
    ${stm32_wpan_directory}/interface/patterns/ble_thread
    ${stm32_wpan_directory}/interface/patterns/ble_thread/tl
    ${stm32_wpan_directory}/interface/patterns/ble_thread/shci
    ${stm32_wpan_directory}/utilities
    ${stm32_wpan_directory}/ble/core
    ${stm32_wpan_directory}/ble/core/auto
    ${stm32_wpan_directory}/ble/core/template
    ${stm32_wpan_directory}/ble/svc/Inc
    ${stm32_wpan_directory}/ble/svc/Src
    ${stm32_wpan_directory}/ble
)

# lpm
set(lpm_src
    ${lpm_directory}/tiny_lpm/stm32_lpm.c
)
set(lpm_inc
    ${lpm_directory}/tiny_lpm/stm32_lpm.h
)
set(lpm_dir
    ${lpm_directory}/tiny_lpm
)

# sequencer
set(sequencer_src
    ${sequencer_directory}/stm32_seq.c
)
set(sequencer_inc
    ${sequencer_directory}/stm32_seq.h
)
set(sequencer_dir
    ${sequencer_directory}
)

# FreeRTOS
set(freertos_cm4_src
    ${freertos_directory}/portable/GCC/ARM_CM4F/port.c
    ${freertos_directory}/portable/MemMang/heap_1.c
    # ${freertos_directory}/portable/MemMang/heap_2.c
    # ${freertos_directory}/portable/MemMang/heap_3.c
    # ${freertos_directory}/portable/MemMang/heap_4.c
    # ${freertos_directory}/portable/MemMang/heap_5.c
    ${freertos_directory}/croutine.c
    ${freertos_directory}/event_groups.c
    ${freertos_directory}/list.c
    ${freertos_directory}/queue.c
    ${freertos_directory}/stream_buffer.c
    ${freertos_directory}/tasks.c
    ${freertos_directory}/timers.c
	${freertos_directory}/CMSIS_RTOS/cmsis_os.c
)

set(freertos_cm4_inc
    ${freertos_directory}/include/atomic.h
    ${freertos_directory}/include/croutine.h
    ${freertos_directory}/include/deprecated_definitions.h
    ${freertos_directory}/include/event_groups.h
    ${freertos_directory}/include/FreeRTOS.h
    ${freertos_directory}/include/list.h
    ${freertos_directory}/include/message_buffer.h
    ${freertos_directory}/include/mpu_prototypes.h
    ${freertos_directory}/include/mpu_wrappers.h
    ${freertos_directory}/include/portable.h
    ${freertos_directory}/include/projdefs.h
    ${freertos_directory}/include/queue.h
    ${freertos_directory}/include/semphr.h
    ${freertos_directory}/include/stack_macros.h
    ${freertos_directory}/include/StackMacros.h
    ${freertos_directory}/include/stdint.readme
    ${freertos_directory}/include/stream_buffer.h
    ${freertos_directory}/include/task.h
    ${freertos_directory}/include/timers.h
    ${freertos_directory}/portable/GCC/ARM_CM4F/portmacro.h
	${freertos_directory}/CMSIS_RTOS/cmsis_os.h
)

set(freertos_cm4_dir
	${freertos_directory}/include
	${freertos_directory}/portable/GCC/ARM_CM4F
	${freertos_directory}/CMSIS_RTOS
)
