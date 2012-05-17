# Copyright (C) 2009 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

# WARNING: This line must come *before* including the proprietary
# variant, so that it gets overwritten by the parent (which goes
# against the traditional rules of inheritance).

# inherit from common msm8660
-include device/fly/iq285/BoardConfigCommon.mk

# inherit from the proprietary version
-include vendor/fly/iq285/BoardConfigVendor.mk

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := K4

# Kernel
BOARD_KERNEL_BASE := 0x40200000
BOARD_KERNEL_PAGE_SIZE := 2048
BOARD_KERNEL_CMDLINE := console=ttyHSL0,115200,n8 androidboot.hardware=qcom board.revision=PP
TARGET_PREBUILT_KERNEL := device/fly/iq285/prebuilt/kernel

# QCOM Gralloc/Copybit/HWcomposer
TARGET_USES_OVERLAY := false

#Camera
#BOARD_HAVE_HTC_FFC := true

# Qcom GPS
#BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := iq285

# Filesystem

TARGET_USERIMAGES_USE_EXT4 := true
BOARD_BOOTIMAGE_MAX_SIZE := $(call image-size-from-data-size,0x00280000)
BOARD_RECOVERYIMAGE_MAX_SIZE := $(call image-size-from-data-size,0x00500000)
BOARD_SYSTEMIMAGE_MAX_SIZE := $(call image-size-from-data-size,0x07500000)
BOARD_USERDATAIMAGE_MAX_SIZE := $(call image-size-from-data-size,0x04ac0000)

#BOARD_BOOTIMAGE_PARTITION_SIZE := 4190208
#BOARD_RECOVERYIMAGE_PARTITION_SIZE := 7743488
#BOARD_SYSTEMIMAGE_PARTITION_SIZE := 419430400
#BOARD_USERDATAIMAGE_PARTITION_SIZE := 20971520

# Recovery
BOARD_CUSTOM_RECOVERY_KEYMAPPING := ../../device/fly/iq285/recovery/recovery_keys.c
BOARD_CUSTOM_GRAPHICS:= ../../../device/fly/iq285/recovery/graphics.c
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
#BOARD_USES_MMCUTILS := true
BOARD_HAS_NO_MISC_PARTITION := true


