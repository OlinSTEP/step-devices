/* USER CODE BEGIN Header */
/**
  ******************************************************************************
  * @file    custom_stm.h
  * @author  MCD Application Team
  * @brief   Header for custom_stm.c module.
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

/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __CUSTOM_STM_H
#define __CUSTOM_STM_H

#ifdef __cplusplus
extern "C" {
#endif

/* Includes ------------------------------------------------------------------*/
/* USER CODE BEGIN Includes */

/* USER CODE END Includes */

/* Exported types ------------------------------------------------------------*/
typedef enum
{
  /* STEP_Accelerometer */
  CUSTOM_STM_X_ACCEL,
  CUSTOM_STM_Y_ACCEL,
  CUSTOM_STM_Z_ACCEL,
  /* STEP_Button */
  CUSTOM_STM_BUTT,
} Custom_STM_Char_Opcode_t;

typedef enum
{
  /* X_acceleration */
  CUSTOM_STM_X_ACCEL_NOTIFY_ENABLED_EVT,
  CUSTOM_STM_X_ACCEL_NOTIFY_DISABLED_EVT,
  /* Y_acceleration */
  CUSTOM_STM_Y_ACCEL_NOTIFY_ENABLED_EVT,
  CUSTOM_STM_Y_ACCEL_NOTIFY_DISABLED_EVT,
  /* Z_acceleration */
  CUSTOM_STM_Z_ACCEL_NOTIFY_ENABLED_EVT,
  CUSTOM_STM_Z_ACCEL_NOTIFY_DISABLED_EVT,
  /* Button_Data */
  CUSTOM_STM_BUTT_NOTIFY_ENABLED_EVT,
  CUSTOM_STM_BUTT_NOTIFY_DISABLED_EVT,

  CUSTOM_STM_BOOT_REQUEST_EVT
} Custom_STM_Opcode_evt_t;

typedef struct
{
  uint8_t * pPayload;
  uint8_t   Length;
} Custom_STM_Data_t;

typedef struct
{
  Custom_STM_Opcode_evt_t       Custom_Evt_Opcode;
  Custom_STM_Data_t             DataTransfered;
  uint16_t                      ConnectionHandle;
  uint8_t                       ServiceInstance;
} Custom_STM_App_Notification_evt_t;

/* USER CODE BEGIN ET */
  typedef enum
  {
    CUSTOM_STM_HRS_HRM_VALUE_FORMAT_UINT16       = 1,
    CUSTOM_STM_HRS_HRM_SENSOR_CONTACTS_PRESENT   = 2,
    CUSTOM_STM_HRS_HRM_SENSOR_CONTACTS_SUPPORTED = 4,
    CUSTOM_STM_HRS_HRM_ENERGY_EXPENDED_PRESENT   = 8,
    CUSTOM_STM_HRS_HRM_RR_INTERVAL_PRESENT       = 0x10
  } Custom_STM_HRS_HrmFlags_t;

  typedef enum
  {
    CUSTOM_STM_HRS_BODY_SENSOR_LOCATION_OTHER    = 0,
    CUSTOM_STM_HRS_BODY_SENSOR_LOCATION_CHEST    = 1,
    CUSTOM_STM_HRS_BODY_SENSOR_LOCATION_WRIST    = 2,
    CUSTOM_STM_HRS_BODY_SENSOR_LOCATION_FINGER   = 3,
    CUSTOM_STM_HRS_BODY_SENSOR_LOCATION_HAND     = 4,
    CUSTOM_STM_HRS_BODY_SENSOR_LOCATION_EAR_LOBE = 5,
    CUSTOM_STM_HRS_BODY_SENSOR_LOCATION_FOOT     = 6
  } Custom_STM_HRS_BodySensorLocation_t;

/* USER CODE END ET */

/* Exported constants --------------------------------------------------------*/
/* USER CODE BEGIN EC */

/* USER CODE END EC */

/* External variables --------------------------------------------------------*/
/* USER CODE BEGIN EV */

/* USER CODE END EV */

/* Exported macros -----------------------------------------------------------*/
/* USER CODE BEGIN EM */

/* USER CODE END EM */

/* Exported functions ------------------------------------------------------- */
void SVCCTL_InitCustomSvc( void );
void Custom_STM_App_Notification(Custom_STM_App_Notification_evt_t *pNotification);
tBleStatus Custom_STM_App_Update_Char(Custom_STM_Char_Opcode_t CharOpcode,  uint8_t *pPayload);
/* USER CODE BEGIN EF */

/* USER CODE END EF */

#ifdef __cplusplus
}
#endif

#endif /*__CUSTOM_STM_H */
