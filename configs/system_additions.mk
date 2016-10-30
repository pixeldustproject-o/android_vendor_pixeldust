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

# init.d script support
PRODUCT_COPY_FILES += \
    vendor/pixeldust/prebuilt/bin/sysinit:system/bin/sysinit

# Pixeldust-specific init file
PRODUCT_COPY_FILES += \
    vendor/pixeldust/prebuilt/etc/init.pixeldust.rc:root/init.pixeldust.rc

# Backup Tool
PRODUCT_COPY_FILES += \
    vendor/pixeldust/prebuilt/bin/backuptool.sh:install/bin/backuptool.sh \
    vendor/pixeldust/prebuilt/bin/backuptool.functions:install/bin/backuptool.functions \
    vendor/pixeldust/prebuilt/bin/50-base.sh:system/addon.d/50-base.sh \

# Security Enhanced Linux
PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.selinux=1

# Allow recording ADB logcat during boot phase
ADDITIONAL_DEFAULT_PROPERTIES += \
    ro.adb.secure=0 \
    ro.secure=0 \
    persist.service.adb.enable=1

# Snap Camera
PRODUCT_PACKAGES += \
    SnapdragonCamera

# Unbreak videorecording with Snap Camera
PRODUCT_PROPERTY_OVERRIDES += \
	persist.camera.cpp.duplication=false
