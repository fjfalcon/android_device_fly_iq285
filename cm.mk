# Specify phone tech before including full_phone
$(call inherit-product, vendor/cm/config/gsm.mk)

# Release name
PRODUCT_RELEASE_NAME := iq285

TARGET_BOOTANIMATION_NAME := vertical-540x960

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/fly/iq285/device.mk)

# Device naming
PRODUCT_DEVICE := iq285
PRODUCT_NAME := cm_iq285
PRODUCT_BRAND := fly
PRODUCT_MODEL := Fly Turbo IQ285
PRODUCT_MANUFACTURER := Fly

# Set build fingerprint / ID / Product Name ect.
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=Fly-IQ285 BUILD_FINGERPRINT=W/Fly_IQ285/K4:2.3.4/GINGERBREAD/SWA0032:user/release-keys PRIVATE_BUILD_DESC="K4-user 2.3.4 GINGERBREAD SWA0032 release-keys" 
