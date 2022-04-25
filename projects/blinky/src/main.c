#include "stm32wbxx.h"

volatile uint32_t ticks = 0;
volatile uint32_t TimingDelay;

void SysTick_Initialize(uint32_t ticks) {
	SysTick->CTRL = 0;
	SysTick->LOAD = ticks - 1;

	NVIC_SetPriority(SysTick_IRQn, (1<<__NVIC_PRIO_BITS) -1);

	SysTick->VAL = 0;

	SysTick->CTRL |= SysTick_CTRL_CLKSOURCE_Pos;

	SysTick->CTRL |= SysTick_CTRL_TICKINT_Pos;

	SysTick->CTRL |= SysTick_CTRL_ENABLE_Pos;
}

void SysTick_Handler(void) {
	if (TimingDelay != 0) {
		TimingDelay--;
	}
}

void Delay(uint32_t nTime) {
	TimingDelay = nTime;
	while(TimingDelay != 0);
}

int main(void) {
	// Enable the GPIO Clock for Port B using AHB & RCC
	RCC->AHB2ENR |= RCC_AHB2ENR_GPIOBEN;
	// Set the mode of the Port B, Pin 3
	GPIOB->MODER |= GPIO_MODER_MODE5_0;
	GPIOB->MODER &= ~(GPIO_MODER_MODE5_1);
	// Set the output type for Port B, Pin 3
	GPIOB->OTYPER &= ~(GPIO_OTYPER_OT5);
	// Set the speed of Port B, Pin 3
	GPIOB->OSPEEDR |= GPIO_OSPEEDR_OSPEED5_1;
	GPIOB->OSPEEDR &= ~(GPIO_OSPEEDR_OSPEED5_0);
	// Set pull up/pull down resistor
	GPIOB->PUPDR &= ~(GPIO_PUPDR_PUPD5);

	SysTick_Initialize(8000);

	while (1) {

		// Turn LED on by setting the Pin
		GPIOB->ODR ^= GPIO_ODR_OD5;
		
		Delay(500);

		
	}
}
