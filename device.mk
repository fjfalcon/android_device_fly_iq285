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

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/base/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/base/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/base/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/base/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml

# Media config
PRODUCT_COPY_FILES += \
    device/fly/iq285/configs/media_profiles.xml:system/etc/media_profiles.xml

# QCOM Display
PRODUCT_PACKAGES += \
    copybit.msm8660 \
    gralloc.msm8660 \
    hwcomposer.msm8660 \
    libgenlock \
    libmemalloc \
    liboverlay \
    libQcomUI \
    libtilerenderer

# Audio
PRODUCT_PACKAGES += \
    audio.a2dp.default \
    audio_policy.msm8660 \
    audio.primary.msm8660 \
    libaudioutils

# Omx
PRODUCT_PACKAGES += \
    libdivxdrmdecrypt \
    libmm-omxcore \
    libOmxCore \
    libOmxVdec \
    libOmxVenc \
    libstagefrighthw

# HDMI
#PRODUCT_PACKAGES += \
    hdmid

# Misc
PRODUCT_PACKAGES += \
    com.android.future.usb.accessory

# Live Wallpapers
PRODUCT_PACKAGES += \
    LiveWallpapers \
    LiveWallpapersPicker \
    VisualizationWallpapers \
    librs_jni

# Filesystem management tools
PRODUCT_PACKAGES += \
    make_ext4fs \
    setup_fs

# 8660 Common Firmware
PRODUCT_COPY_FILES += \
    device/fly/iq285/firmware/vidc_1080p.fw:system/etc/firmware/vidc_1080p.fw \
    device/fly/iq285/firmware/leia_pfp_470.fw:system/etc/firmware/leia_pfp_470.fw \
    device/fly/iq285/firmware/leia_pm4_470.fw:system/etc/firmware/leia_pm4_470.fw

# Common Qualcomm scripts
PRODUCT_COPY_FILES += \
    device/fly/iq285/prebuilt/init.qcom.post_boot.sh:system/etc/init.qcom.post_boot.sh \
    device/fly/iq285/prebuilt/init.qcom.efs.sync.sh:system/etc/init.qcom.efs.sync.sh

# We have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal hdpi


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

$(call inherit-product, vendor/fly/iq285/iq285-vendor.mk)

PRODUCT_NAME := full_iq285
PRODUCT_DEVICE := iq285
