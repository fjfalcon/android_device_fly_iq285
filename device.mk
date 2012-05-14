#
# Copyright (C) 2011 The CyanogenMod Project
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

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
#$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# common msm8660 configs
$(call inherit-product, device/fly/iq285/msm8660.mk)

$(call inherit-product, vendor/fly/iq285/iq285-vendor.mk)
DEVICE_PACKAGE_OVERLAYS += device/fly/iq285/overlay

# GPS and Light
#PRODUCT_PACKAGES += \
#    gps. \
#    lights.pyramid

# Torch
PRODUCT_PACKAGES += \
    Torch

## The gps config appropriate for this device
PRODUCT_COPY_FILES += device/common/gps/gps.conf_EU:system/etc/gps.conf

# Bluetooth
#PRODUCT_COPY_FILES += \
    device/htc/msm8660-common/firmware/bcm4329.hcd:system/vendor/firmware/bcm4329.hcd

# Wifi
$(call inherit-product-if-exists, hardware/broadcom/wlan/bcmdhd/firmware/bcm4329/device-bcm.mk)

# Boot ramdisk setup
#PRODUCT_COPY_FILES += \
#    device/htc/pyramid/prebuilt/init:root/init \
#    device/htc/pyramid/ramdisk/init.pyramid.rc:root/init.pyramid.rc \
#    device/htc/pyramid/ramdisk/init.pyramid.usb.rc:root/init.pyramid.usb.rc \
#    device/htc/pyramid/ramdisk/ueventd.pyramid.rc:root/ueventd.pyramid.rc

## recovery and custom charging
#PRODUCT_COPY_FILES += \
    device/htc/pyramid/prebuilt/init:recovery/root/init \
    device/htc/pyramid/recovery/sbin/choice_fn:recovery/root/sbin/choice_fn \
    device/htc/pyramid/recovery/sbin/power_test:recovery/root/sbin/power_test \
    device/htc/pyramid/recovery/sbin/offmode_charging:recovery/root/sbin/offmode_charging \
    device/htc/pyramid/recovery/sbin/detect_key:recovery/root/sbin/detect_key \
    device/htc/pyramid/recovery/sbin/htcbatt:recovery/root/sbin/htcbatt

# Some misc configeration files
PRODUCT_COPY_FILES += \
    device/fly/iq285/vold.fstab:system/etc/vold.fstab

# Keylayouts and Keychars
PRODUCT_COPY_FILES += \
    device/fly/iq285/keychars/K4_keypad.kcm.bin:system/usr/keychars/K4_keypad.kcm.bin \
    device/fly/iq285/keylayout/AVRCP.kl:system/usr/keylayout/AVRCP.kl \
    device/fly/iq285/keylayout/K4_touchscr.kl:system/usr/keylayout/K4_touchscr.kl \
    device/fly/iq285/keylayout/K4_headset.kl:system/usr/keylayout/K4_headset.kl \
    device/fly/iq285/keylayout/K4_keypad.kl:system/usr/keylayout/K4_keipad.kl \
	device/fly/iq285/keylayout/K4_vkey.kl:system/usr/keylayout/K4_vkey.kl \
	device/fly/iq285/keylayout/pmic8058_pwrkey.kl:system/usr/keylayout/pmic8058_pwrkey.kl \
	device/fly/iq285/keylayout/qwerty.kl:system/usr/keylayout/qwerty.kl
# QC thermald config
PRODUCT_COPY_FILES += device/fly/iq285/configs/thermald.conf:system/etc/thermald.conf

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml

## misc
PRODUCT_PROPERTY_OVERRIDES += \
    ro.setupwizard.enable_bypass=1 \
    dalvik.vm.lockprof.threshold=500 \
    ro.com.google.locationfeatures=1 \
    dalvik.vm.dexopt-flags=m=y

# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi
PRODUCT_LOCALES += en_US hdpi

ifeq ($(TARGET_PREBUILT_KERNEL),)
LOCAL_KERNEL := device/fly/iq285/prebuilt/kernel
else
LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel \

# call the proprietary setup
$(call inherit-product-if-exists, vendor/fly/iq285/K4-vendor.mk)


