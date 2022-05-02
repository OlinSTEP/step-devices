/* USER CODE BEGIN Header */
/**
  ******************************************************************************
  * @file    custom_app.c
  * @author  MCD Application Team
  * @brief   Custom Example Application (Server)
  ******************************************************************************
  * @attention
  *
  * Copyright (c) 2020-2021 STMicroelectronics.
  * All rights reserved.
  *
  * This software is licensed under terms that can be found in the LICENSE file
  * in the root directory of this software component.
  * If no LICENSE file comes with this software, it is provided AS-IS.
  *
  ******************************************************************************
  */
/* USER CODE END Header */

/* Includes ------------------------------------------------------------------*/
#include "main.h"
#include "app_common.h"
#include "dbg_trace.h"
#include "ble.h"
#include "custom_app.h"
#include "custom_stm.h"
#include "stm32_seq.h"

/* Private includes ----------------------------------------------------------*/
/* USER CODE BEGIN Includes */

/* USER CODE END Includes */

/* Private typedef -----------------------------------------------------------*/
typedef struct
{
  /* STEP_Accelerometer */
  uint8_t               X_accel_Notification_Status;
  uint8_t               Y_accel_Notification_Status;
  uint8_t               Z_accel_Notification_Status;
  /* STEP_Button */
  uint8_t               Butt_Notification_Status;
  /* USER CODE BEGIN CUSTOM_APP_Context_t */

  /* USER CODE END CUSTOM_APP_Context_t */

  uint16_t              ConnectionHandle;
} Custom_App_Context_t;

/* USER CODE BEGIN PTD */

/* USER CODE END PTD */

/* Private defines ------------------------------------------------------------*/
/* USER CODE BEGIN PD */

/* USER CODE END PD */

/* Private macros -------------------------------------------------------------*/
/* USER CODE BEGIN PM */

/* USER CODE END PM */

/* Private variables ---------------------------------------------------------*/
/**
 * START of Section BLE_APP_CONTEXT
 */

PLACE_IN_SECTION("BLE_APP_CONTEXT") static Custom_App_Context_t Custom_App_Context;

/**
 * END of Section BLE_APP_CONTEXT
 */

/* USER CODE BEGIN PV */

uint8_t UpdateCharData[247];
uint8_t NotifyCharData[247];

uint8_t SecureReadData;

/* USER CODE END PV */

/* Private function prototypes -----------------------------------------------*/
  /* STEP_Accelerometer */
static void Custom_X_accel_Update_Char(void);
static void Custom_X_accel_Send_Notification(void);
static void Custom_Y_accel_Update_Char(void);
static void Custom_Y_accel_Send_Notification(void);
static void Custom_Z_accel_Update_Char(void);
static void Custom_Z_accel_Send_Notification(void);
  /* STEP_Button */
static void Custom_Butt_Update_Char(void);
static void Custom_Butt_Send_Notification(void);

/* USER CODE BEGIN PFP */

/* USER CODE END PFP */

/* Functions Definition ------------------------------------------------------*/
void Custom_STM_App_Notification(Custom_STM_App_Notification_evt_t *pNotification)
{
  /* USER CODE BEGIN CUSTOM_STM_App_Notification_1 */
    
  /* USER CODE END CUSTOM_STM_App_Notification_1 */
  switch(pNotification->Custom_Evt_Opcode)
  {
    /* USER CODE BEGIN CUSTOM_STM_App_Notification_Custom_Evt_Opcode */

    /* USER CODE END CUSTOM_STM_App_Notification_Custom_Evt_Opcode */

  /* STEP_Accelerometer */
    case CUSTOM_STM_X_ACCEL_NOTIFY_ENABLED_EVT:
      /* USER CODE BEGIN CUSTOM_STM_X_ACCEL_NOTIFY_ENABLED_EVT */

      /* USER CODE END CUSTOM_STM_X_ACCEL_NOTIFY_ENABLED_EVT */
      break;

    case CUSTOM_STM_X_ACCEL_NOTIFY_DISABLED_EVT:
      /* USER CODE BEGIN CUSTOM_STM_X_ACCEL_NOTIFY_DISABLED_EVT */

      /* USER CODE END CUSTOM_STM_X_ACCEL_NOTIFY_DISABLED_EVT */
      break;

    case CUSTOM_STM_Y_ACCEL_NOTIFY_ENABLED_EVT:
      /* USER CODE BEGIN CUSTOM_STM_Y_ACCEL_NOTIFY_ENABLED_EVT */

      /* USER CODE END CUSTOM_STM_Y_ACCEL_NOTIFY_ENABLED_EVT */
      break;

    case CUSTOM_STM_Y_ACCEL_NOTIFY_DISABLED_EVT:
      /* USER CODE BEGIN CUSTOM_STM_Y_ACCEL_NOTIFY_DISABLED_EVT */

      /* USER CODE END CUSTOM_STM_Y_ACCEL_NOTIFY_DISABLED_EVT */
      break;

    case CUSTOM_STM_Z_ACCEL_NOTIFY_ENABLED_EVT:
      /* USER CODE BEGIN CUSTOM_STM_Z_ACCEL_NOTIFY_ENABLED_EVT */

      /* USER CODE END CUSTOM_STM_Z_ACCEL_NOTIFY_ENABLED_EVT */
      break;

    case CUSTOM_STM_Z_ACCEL_NOTIFY_DISABLED_EVT:
      /* USER CODE BEGIN CUSTOM_STM_Z_ACCEL_NOTIFY_DISABLED_EVT */

      /* USER CODE END CUSTOM_STM_Z_ACCEL_NOTIFY_DISABLED_EVT */
      break;

  /* STEP_Button */
    case CUSTOM_STM_BUTT_NOTIFY_ENABLED_EVT:
      /* USER CODE BEGIN CUSTOM_STM_BUTT_NOTIFY_ENABLED_EVT */

      /* USER CODE END CUSTOM_STM_BUTT_NOTIFY_ENABLED_EVT */
      break;

    case CUSTOM_STM_BUTT_NOTIFY_DISABLED_EVT:
      /* USER CODE BEGIN CUSTOM_STM_BUTT_NOTIFY_DISABLED_EVT */

      /* USER CODE END CUSTOM_STM_BUTT_NOTIFY_DISABLED_EVT */
      break;

    default:
      /* USER CODE BEGIN CUSTOM_STM_App_Notification_default */

      /* USER CODE END CUSTOM_STM_App_Notification_default */
      break;
  }
  /* USER CODE BEGIN CUSTOM_STM_App_Notification_2 */

  /* USER CODE END CUSTOM_STM_App_Notification_2 */
  return;
}

void Custom_APP_Notification(Custom_App_ConnHandle_Not_evt_t *pNotification)
{
  /* USER CODE BEGIN CUSTOM_APP_Notification_1 */

  /* USER CODE END CUSTOM_APP_Notification_1 */

  switch(pNotification->Custom_Evt_Opcode)
  {
    /* USER CODE BEGIN CUSTOM_APP_Notification_Custom_Evt_Opcode */

    /* USER CODE END P2PS_CUSTOM_Notification_Custom_Evt_Opcode */
    case CUSTOM_CONN_HANDLE_EVT :
      /* USER CODE BEGIN CUSTOM_CONN_HANDLE_EVT */
          
      /* USER CODE END CUSTOM_CONN_HANDLE_EVT */
      break;

    case CUSTOM_DISCON_HANDLE_EVT :
      /* USER CODE BEGIN CUSTOM_DISCON_HANDLE_EVT */
      
      /* USER CODE END CUSTOM_DISCON_HANDLE_EVT */
      break;

    default:
      /* USER CODE BEGIN CUSTOM_APP_Notification_default */

      /* USER CODE END CUSTOM_APP_Notification_default */
      break;
  }

  /* USER CODE BEGIN CUSTOM_APP_Notification_2 */

  /* USER CODE END CUSTOM_APP_Notification_2 */

  return;
}

void Custom_APP_Init(void)
{
  /* USER CODE BEGIN CUSTOM_APP_Init */
  
  /* USER CODE END CUSTOM_APP_Init */
  return;
}

/* USER CODE BEGIN FD */
void notify() {
  NotifyCharData[0] = 0x42;
  Custom_App_Context.X_accel_Notification_Status = 1;
  Custom_X_accel_Send_Notification(); 
  Custom_App_Context.X_accel_Notification_Status = 0;
}

void butt_notify() {
  Custom_App_Context.Butt_Notification_Status = 1;
  Custom_Butt_Send_Notification();
  Custom_App_Context.Butt_Notification_Status = 0;

}
/* USER CODE END FD */

/*************************************************************
 *
 * LOCAL FUNCTIONS
 *
 *************************************************************/

  /* STEP_Accelerometer */
void Custom_X_accel_Update_Char(void) /* Property Read */
{
  Custom_STM_App_Update_Char(CUSTOM_STM_X_ACCEL, (uint8_t *)UpdateCharData);
  /* USER CODE BEGIN X_accel_UC*/
  
  /* USER CODE END X_accel_UC*/
  return;
}

void Custom_X_accel_Send_Notification(void) /* Property Notification */
 {
  if(Custom_App_Context.X_accel_Notification_Status)
  {
    Custom_STM_App_Update_Char(CUSTOM_STM_X_ACCEL, (uint8_t *)NotifyCharData);
    /* USER CODE BEGIN X_accel_NS*/

    /* USER CODE END X_accel_NS*/
  }
  else
  {
    APP_DBG_MSG("-- CUSTOM APPLICATION : CAN'T INFORM CLIENT -  NOTIFICATION DISABLED\n ");
  }
  return;
}

void Custom_Y_accel_Update_Char(void) /* Property Read */
{
  Custom_STM_App_Update_Char(CUSTOM_STM_Y_ACCEL, (uint8_t *)UpdateCharData);
  /* USER CODE BEGIN Y_accel_UC*/

  /* USER CODE END Y_accel_UC*/
  return;
}

void Custom_Y_accel_Send_Notification(void) /* Property Notification */
 {
  if(Custom_App_Context.Y_accel_Notification_Status)
  {
    Custom_STM_App_Update_Char(CUSTOM_STM_Y_ACCEL, (uint8_t *)NotifyCharData);
    /* USER CODE BEGIN Y_accel_NS*/

    /* USER CODE END Y_accel_NS*/
  }
  else
  {
    APP_DBG_MSG("-- CUSTOM APPLICATION : CAN'T INFORM CLIENT -  NOTIFICATION DISABLED\n ");
  }
  return;
}

void Custom_Z_accel_Update_Char(void) /* Property Read */
{
  Custom_STM_App_Update_Char(CUSTOM_STM_Z_ACCEL, (uint8_t *)UpdateCharData);
  /* USER CODE BEGIN Z_accel_UC*/

  /* USER CODE END Z_accel_UC*/
  return;
}

void Custom_Z_accel_Send_Notification(void) /* Property Notification */
 {
  if(Custom_App_Context.Z_accel_Notification_Status)
  {
    Custom_STM_App_Update_Char(CUSTOM_STM_Z_ACCEL, (uint8_t *)NotifyCharData);
    /* USER CODE BEGIN Z_accel_NS*/

    /* USER CODE END Z_accel_NS*/
  }
  else
  {
    APP_DBG_MSG("-- CUSTOM APPLICATION : CAN'T INFORM CLIENT -  NOTIFICATION DISABLED\n ");
  }
  return;
}

  /* STEP_Button */
void Custom_Butt_Update_Char(void) /* Property Read */
{
  Custom_STM_App_Update_Char(CUSTOM_STM_BUTT, (uint8_t *)UpdateCharData);
  /* USER CODE BEGIN Butt_UC*/

  /* USER CODE END Butt_UC*/
  return;
}

void Custom_Butt_Send_Notification(void) /* Property Notification */
 {
  if(Custom_App_Context.Butt_Notification_Status)
  {
    Custom_STM_App_Update_Char(CUSTOM_STM_BUTT, (uint8_t *)NotifyCharData);
    /* USER CODE BEGIN Butt_NS*/

    /* USER CODE END Butt_NS*/
  }
  else
  {
    APP_DBG_MSG("-- CUSTOM APPLICATION : CAN'T INFORM CLIENT -  NOTIFICATION DISABLED\n ");
  }
  return;
}

/* USER CODE BEGIN FD_LOCAL_FUNCTIONS*/

/* USER CODE END FD_LOCAL_FUNCTIONS*/
