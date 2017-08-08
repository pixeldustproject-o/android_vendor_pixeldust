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

# Include common PixelDust stuff
include vendor/pixeldust/configs/pixeldust_phone.mk

# Setup device specific product configuration.
PRODUCT_NAME := pixeldust_mako
PRODUCT_BRAND := google
PRODUCT_DEVICE := mako
PRODUCT_MODEL := Nexus 4
PRODUCT_MANUFACTURER := LGE

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=mako \
    BUILD_FINGERPRINT="google/mako/mako:7.1.2/NJH47F/4146041:user/release-keys" \
    PRIVATE_BUILD_DESC="mako-user 7.1.2 NJH47F 4146041 release-keys"

