# Copyright (C) 2018 The PixelDust Project
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

# Boot animation
TARGET_SCREEN_HEIGHT := 2880
TARGET_SCREEN_WIDTH := 1440

# Include Nitrogen common configuration
include vendor/pixeldust/configs/pixeldust_phone.mk

# Include optional stuff (e.g. prebuilt apps)
include vendor/pixeldust/configs/system_optional.mk

# Google Apps
$(call inherit-product, vendor/googleapps/googleapps.mk)

# Inherit from the common Open Source product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)

# Inherit AOSP device configuration for  taimen
$(call inherit-product, device/google/taimen/aosp_taimen.mk)

# Do not use DragonTC for this device
DISABLE_DTC_OPTS := true
TARGET_USE_SDCLANG := true


# Override AOSP build properties
PRODUCT_NAME := pixeldust_taimen
PRODUCT_DEVICE := taimen
PRODUCT_BRAND := Google
PRODUCT_MODEL := Pixel 2 XL
PRODUCT_MANUFACTURER := Google
PRODUCT_RESTRICT_VENDOR_FILES := false

# Device Fingerprint
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=taimen \
    BUILD_FINGERPRINT=google/taimen/taimen:8.1.0/OPM2.171019.029.B1/4720900:user/release-keys \
    PRIVATE_BUILD_DESC="taimen-user 8.1.0 OPM2.171019.029.B1 4720900 release-keys"
$(call inherit-product-if-exists, vendor/google/taimen/taimen-vendor.mk)

PRODUCT_PROPERTY_OVERRIDES += \
    ro.pixeldust.maintainer="Nitin1438"
