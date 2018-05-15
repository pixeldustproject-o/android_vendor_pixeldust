# Copyright (C) 2017 The PixelDust Project
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

# Inherit AOSP device configuration for mako.
$(call inherit-product, device/lge/mako/aosp_mako.mk)

# Do not use DragonTC for this device
DISABLE_DTC_OPTS := true
TARGET_USE_SDCLANG := true

# Include common PixelDust stuff
include vendor/pixeldust/configs/pixeldust_phone.mk

# Include optional stuff (e.g. prebuilt apps)
include vendor/pixeldust/configs/system_optional_legacy.mk

# Setup device specific product configuration.
PRODUCT_NAME := pixeldust_mako
PRODUCT_BRAND := google
PRODUCT_DEVICE := mako
PRODUCT_MODEL := Nexus 4
PRODUCT_MANUFACTURER := LGE

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=mako \
    BUILD_FINGERPRINT="google/mako/mako:8.0.0/OPR3.170623.013/4397526:user/release-keys" \
    PRIVATE_BUILD_DESC="mako-user 8.0.0 OPR3.170623.013 4397526 release-keys"

