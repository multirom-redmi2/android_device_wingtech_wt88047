#
# Copyright (C) 2015 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

FORCE_32_BIT := true

include device/cyanogen/msm8916-common/BoardConfigCommon.mk
DEVICE_PATH := device/wingtech/wt88047
TARGET_SPECIFIC_HEADER_PATH := $(DEVICE_PATH)/include

# Enables CSVT
TARGET_USES_CSVT := true

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME :=

# Kernel
BOARD_CUSTOM_BOOTIMG_MK := $(DEVICE_PATH)/mkbootimg.mk
BOARD_KERNEL_CMDLINE += phy-msm-usb.floated_charger_enable=1
TARGET_KERNEL_SOURCE := kernel/cyanogen/msm8916
TARGET_KERNEL_CONFIG := cyanogenmod_wt88047_defconfig


# CPU
TARGET_CPU_CORTEX_A53 := true

# WT88047 init
TARGET_LIBINIT_DEFINES_FILE := $(DEVICE_PATH)/init/init_wt88047.cpp
TARGET_UNIFIED_DEVICE := true

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(DEVICE_PATH)/bluetooth

# Display
TARGET_CONTINUOUS_SPLASH_ENABLED := false
TARGET_FORCE_HWC_FOR_VIRTUAL_DISPLAYS := true
MAX_VIRTUAL_DISPLAY_DIMENSION := 2048

# Charger
BOARD_CHARGER_DISABLE_INIT_BLANK := true
BOARD_HAL_STATIC_LIBRARIES := libhealthd.wt88047

# Camera
BOARD_CAMERA_SENSORS := \
    ov2680_5987fhq \
    ov8865_q8v18a \
    ov2680_skuhf
TARGET_USE_VENDOR_CAMERA_EXT := true
USE_DEVICE_SPECIFIC_CAMERA := true

# Disable Jack & Jill compilation
ANDROID_COMPILE_WITH_JACK := false

# DPM NSRM Feature
TARGET_LDPRELOAD := libNimsWrap.so

# Flags
TARGET_GLOBAL_CFLAGS += -DNO_SECURE_DISCARD

# GPS
USE_DEVICE_SPECIFIC_GPS := true
TARGET_NO_RPC := true

# Lights
TARGET_PROVIDES_LIBLIGHT := true

# Partitions
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_BOOTIMAGE_PARTITION_SIZE := 33554432
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_CACHEIMAGE_PARTITION_SIZE := 335544320
BOARD_PERSISTIMAGE_PARTITION_SIZE := 33554432
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 33554432
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1073741824
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_USERDATAIMAGE_PARTITION_SIZE := 5939100672


# Recovery
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/etc/fstab.qcom
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_SUPPRESS_SECURE_ERASE := true

# TWRP-Specific
DEVICE_RESOLUTION := 720x1280
TW_TARGET_USES_QCOM_BSP := false
TW_NEW_ION_HEAP := true
TARGET_RECOVERY_PIXEL_FORMAT := "RGBA_8888"
RECOVERY_GRAPHICS_USE_LINELENGTH := true
TW_INCLUDE_CRYPTO := true
BOARD_SUPPRESS_EMMC_WIPE := true
TW_UNMOUNT_FIRMWARE_ON_BOOT := true
TWHAVE_SELINUX := true
RECOVERY_SDCARD_ON_DATA := true
BOARD_SUPPRESS_SECURE_ERASE := true
TARGET_RECOVERY_QCOM_RTC_FIX := true
TW_BRIGHTNESS_PATH := /sys/class/leds/lcd-backlight/brightness
TW_MAX_BRIGHTNESS := 255
TW_DEFAULT_BRIGHTNESS := 70
TW_DEFAULT_EXTERNAL_STORAGE := true
TW_THEME := portrait_hdpi

#MultiROM config. MultiROM also uses parts of TWRP config
TW_USE_TOOLBOX := true
MR_CONTINUOUS_FB_UPDATE := true
MR_DEV_BLOCK_BOOTDEVICE := true
MR_ALLOW_NKK71_NOKEXEC_WORKAROUND := true
MR_DPI := hdpi
MR_DPI_FONT := 192
MR_FSTAB := $(DEVICE_PATH)/multirom/mrom.fstab
MR_INIT_DEVICES := $(DEVICE_PATH)/multirom/mr_init_devices.c
MR_INPUT_TYPE := type_b
MR_KEXEC_MEM_MIN := 0x85F00000
MR_KEXEC_DTB := true
MR_PIXEL_FORMAT := "RGBA_8888"
MR_USE_MROM_FSTAB := true
TARGET_RECOVERY_IS_MULTIROM := true

#Force populating /dev/block/platform/7824900.sdhci/by-name
#from the emmc
MR_POPULATE_BY_NAME_PATH := "/dev/block/platform/7824900.sdhci/by-name"

# copy mrom.fstab to /
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/multirom/mrom.fstab:root/mrom.fstab

TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop

BOARD_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy

# inherit from the proprietary version
-include vendor/wingtech/wt88047/BoardConfigVendor.mk
