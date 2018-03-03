# Copyright (C) 2017 The Pixel Dust Project
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

# Add Pixel Dust ROM bootanimation based on device
ifneq ($(filter pixeldust_angler pixeldust_marlin pixeldust_sailfish,$(TARGET_PRODUCT)),)
    PRODUCT_COPY_FILES += \
        vendor/pixeldust/prebuilt/bootanimation/1440.zip:system/media/bootanimation.zip
endif
ifneq ($(filter pixeldust_bullhead pixeldust_mako pixeldust_Z00L,$(TARGET_PRODUCT)),)
    PRODUCT_COPY_FILES += \
        vendor/pixeldust/prebuilt/bootanimation/1080.zip:system/media/bootanimation.zip
endif

