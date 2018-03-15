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
ifeq ($(AB_OTA_UPDATER),true)
PRODUCT_COPY_FILES += \
    vendor/pixeldust/prebuilt/bin/backuptool_ab.sh:system/bin/backuptool_ab.sh \
    vendor/pixeldust/prebuilt/bin/backuptool_ab.functions:system/bin/backuptool_ab.functions \
    vendor/pixeldust/prebuilt/bin/backuptool_postinstall.sh:system/bin/backuptool_postinstall.sh
else
PRODUCT_COPY_FILES += \
    vendor/pixeldust/prebuilt/bin/backuptool.sh:install/bin/backuptool.sh \
    vendor/pixeldust/prebuilt/bin/backuptool.functions:install/bin/backuptool.functions \
    vendor/pixeldust/prebuilt/bin/50-hosts.sh:system/addon.d/50-hosts.sh \
    vendor/pixeldust/prebuilt/bin/blacklist:system/addon.d/blacklist
endif

# init.d script support
PRODUCT_COPY_FILES += \
    vendor/pixeldust/prebuilt/bin/sysinit:system/bin/sysinit

# Pixeldust-specific init file
PRODUCT_PACKAGES += \
    init.pixeldust.rc

# SELinux Permissive Workaround for SafetyNet
ifeq ($(TARGET_TRICK_SELINUX),true)
PRODUCT_PACKAGES += \
    init.sehide.rc
endif

# Security Enhanced Linux
PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.selinux=1

# Speed up compiling time
EXCLUDE_SYSTEMUI_TESTS := true

# Include Substratum unless SUBSTRATUM is set to false
ifneq ($(SUBSTRATUM),false)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.substratum.aopt=true
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

# DU Utils Library
PRODUCT_BOOT_JARS += \
    org.dirtyunicorns.utils

# DU Utils Library
PRODUCT_PACKAGES += \
    org.dirtyunicorns.utils

# Fonts
PRODUCT_PACKAGES += \
    DU-Fonts

# Packages
PRODUCT_PACKAGES += \
    GBoardDarkTheme \
    SystemUIDarkTheme \
    SettingsDarkTheme \
    SystemDarkTheme \
    SettingsBlackTheme \
    SystemBlackTheme \
    SettingsShishuTheme \
    SystemShishuTheme \
    SettingsShishuNightsTheme \
    SystemShishuNightsTheme

# Overlays
PRODUCT_PACKAGES += \
    AmberAccent \
    BlackAccent \
    BlueAccent \
    BlueGreyAccent \
    BrownAccent \
    CyanAccent \
    DeepOrangeAccent \
    DeepPurpleAccent \
    GreenAccent \
    GreyAccent \
    IndigoAccent \
    LightBlueAccent \
    LightGreenAccent \
    LimeAccent \
    OrangeAccent \
    PinkAccent \
    PurpleAccent \
    RedAccent \
    TealAccent \
    YellowAccent \
    WhiteAccent

# Extra packages
PRODUCT_PACKAGES += \
    libbfqio

# Default Theme
PRODUCT_PROPERTY_OVERRIDES += \
    ro.boot.vendor.overlay.theme=com.google.android.theme.pixel

# Google Markup from Android P
PRODUCT_PACKAGES += \
    GoogleMarkup

# Additional System fonts
PRODUCT_COPY_FILES += \
    vendor/pixeldust/prebuilt/fonts/gobold/Gobold.ttf:system/fonts/Gobold.ttf \
    vendor/pixeldust/prebuilt/fonts/gobold/Gobold-Italic.ttf:system/fonts/Gobold-Italic.ttf \
    vendor/pixeldust/prebuilt/fonts/gobold/GoboldBold.ttf:system/fonts/GoboldBold.ttf \
    vendor/pixeldust/prebuilt/fonts/gobold/GoboldBold-Italic.ttf:system/fonts/GoboldBold-Italic.ttf \
    vendor/pixeldust/prebuilt/fonts/gobold/GoboldThinLight.ttf:system/fonts/GoboldThinLight.ttf \
    vendor/pixeldust/prebuilt/fonts/gobold/GoboldThinLight-Italic.ttf:system/fonts/GoboldThinLight-Italic.ttf \
    vendor/pixeldust/prebuilt/fonts/roadrage/road_rage.ttf:system/fonts/RoadRage-Regular.ttf \
    vendor/pixeldust/prebuilt/fonts/snowstorm/snowstorm.ttf:system/fonts/Snowstorm-Regular.ttf \
    vendor/pixeldust/prebuilt/fonts/vcrosd/vcr_osd_mono.ttf:system/fonts/ThemeableFont-Regular.ttf \
    vendor/pixeldust/prebuilt/fonts/googlesans/GoogleSans-Regular.ttf:system/fonts/GoogleSans-Medium.ttf

# GoogleWebview (prevents new users ending up without webview on 1st install)
PRODUCT_PACKAGES += \
    GoogleWebview

