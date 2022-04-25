# FreeRTOS Demo

This application uses the CMSIS RTOS API to create two threads with the same priority, which execute in 
a periodic cycle of 15 seconds. 

- In the first 5 seconds, the thread 1 toggles LED1 each 200 ms and the 
thread 2 toggles LED2 each 500 ms.
- In the following 5 seconds, the thread 1 suspends itself and the thread 2
continue toggling LED2.
- In the last 5 seconds, the thread 2 resumes execution of thread 1 then 
suspends itself, the thread 1 toggles the LED1 each 500 ms. 

The original source code for this project can be found in [STM32CubeWB repository](https://github.com/STMicroelectronics/STM32CubeWB/tree/11042898d71249ed9c698355fd7b7812b741a161/Projects/P-NUCLEO-WB55.Nucleo/Applications/FreeRTOS/FreeRTOS_ThreadCreation).
