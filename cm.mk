# Specify phone tech before including full_phone
$(call inherit-product, vendor/cm/config/gsm.mk)

# Release name
PRODUCT_RELEASE_NAME := flyiq285

TARGET_BOOTANIMATION_NAME := vertical-540x960

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/fly/iq285/device.mk)

# Device naming
PRODUCT_DEVICE := fluiq85
PRODUCT_NAME := cm_iq285
PRODUCT_BRAND := Fly
PRODUCT_MODEL := Fly Turbo IQ285
PRODUCT_MANUFACTURER := Fly

# Set build fingerprint / ID / Product Name ect.
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=htc_pyramid BUILD_FINGERPRINT=htc_europe/htc_pyramid/pyramid:4.0.3/IML74K/309896.3:user/release-keys PRIVATE_BUILD_DESC="3.32.401.3 CL309896 release-keys" BUILD_NUMBER=309896
