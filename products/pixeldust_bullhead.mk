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

# Inherit AOSP device configuration for bullhead.
$(call inherit-product, device/lge/bullhead/aosp_bullhead.mk)

# Do not use DragonTC for this device
DISABLE_DTC_OPTS := true
TARGET_USE_SDCLANG := true

# Include common PixelDust stuff
include vendor/pixeldust/configs/pixeldust_phone.mk

# Setup device specific product configuration.
PRODUCT_NAME := pixeldust_bullhead
PRODUCT_BRAND := google
PRODUCT_DEVICE := bullhead
PRODUCT_MODEL := Nexus 5X
PRODUCT_MANUFACTURER := LGE

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=bullhead \
    BUILD_FINGERPRINT="google/bullhead/bullhead:8.0.0/OPR6.170623.023/4409485:user/release-keys" \
    PRIVATE_BUILD_DESC="bullhead-user 8.0.0 OPR6.170623.023 4409485 release-keys"

