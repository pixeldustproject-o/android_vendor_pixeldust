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

# Backup Tool
PRODUCT_COPY_FILES += \
    vendor/pixeldust/prebuilt/bin/backuptool.sh:install/bin/backuptool.sh \
    vendor/pixeldust/prebuilt/bin/backuptool.functions:install/bin/backuptool.functions \
    vendor/pixeldust/prebuilt/bin/50-hosts.sh:system/addon.d/50-hosts.sh \
    vendor/pixeldust/prebuilt/bin/blacklist:system/addon.d/blacklist

# init.d script support
PRODUCT_COPY_FILES += \
    vendor/pixeldust/prebuilt/bin/sysinit:system/bin/sysinit

# Pixeldust-specific init file
PRODUCT_COPY_FILES += \
    vendor/pixeldust/prebuilt/etc/init.pixeldust.rc:root/init.pixeldust.rc

# Security Enhanced Linux
PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.selinux=1

# Speed up compiling time
EXCLUDE_SYSTEMUI_TESTS := true

# Include Substratum unless SUBSTRATUM is set to false
ifneq ($(SUBSTRATUM),false)
    PRODUCT_PACKAGES += \
        Substratum
endif

# Overlay Packages
PRODUCT_PACKAGES += \
    PixelOverlay

# Squisher Location
SQUISHER_SCRIPT := vendor/pixeldust/tools/squisher

# Include SDCLANG definitions if it is requested and available
ifeq ($(HOST_OS),linux)
    ifneq ($(wildcard vendor/qcom/sdclang-4.0/),)
        include vendor/pixeldust/sdclang/sdclang.mk
    endif
else
ifneq ($(sdclang_already_warned),true)
$(warning **********************************************)
$(warning * SDCLANG is not supported on non-linux hosts.)
$(warning **********************************************)
sdclang_already_warned := true
endif
endif

# Set custom volume steps
PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.media_vol_steps=30
