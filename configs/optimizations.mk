# Copyright (C) 2018 The Pixel Dust Project
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

# Prop Optimizations
PRODUCT_PROPERTY_OVERRIDES += \
    debug.performance.tuning=1 \
    keyguard.no_require_sim=true

# Don't build debug for host or device
PRODUCT_ART_TARGET_INCLUDE_DEBUG_BUILD := false
ART_BUILD_TARGET_NDEBUG := true
ART_BUILD_TARGET_DEBUG := false
ART_BUILD_HOST_NDEBUG := true
ART_BUILD_HOST_DEBUG := false

# Dex pre-opt
WITH_DEXPREOPT := true
DEX_PREOPT_DEFAULT := nostripping

# Preopt apks like GMS chimara modules
PRODUCT_ALWAYS_PREOPT_EXTRACTED_APK := true

# Create profile for boot image
# Outputs to /system/etc/boot-image.prof
PRODUCT_USE_PROFILE_FOR_BOOT_IMAGE := true

# Speed apps
PRODUCT_DEXPREOPT_SPEED_APPS += \
  SystemUI \
  Settings \
  NexusLauncherPrebuilt \
  GoogleCamera
 
# Dex pre-opt profiles
ifneq ($(wildcard vendor/dexoptProfiles/),)
  PRODUCT_DEX_PREOPT_DEFAULT_COMPILER_FILTER := speed-profile
  PRODUCT_DEX_PREOPT_PROFILE_DIR := vendor/dexoptProfiles
  WITH_DEX_PREOPT_GENERATE_PROFILE := true
else
  PRODUCT_DEX_PREOPT_DEFAULT_COMPILER_FILTER := speed
endif

# Conditionally use either DragonTC OR SDCLANG Optimizations (in order to disable the use of DragonTC the relevant flags used below need to be inserted into your device make file in vendor/pixeldust/products)
ifneq ($(DISABLE_DTC_OPTS),true)
  # DragonTC info
  DRAGONTC_VERSION := 7.0

  DTC_PATH := prebuilts/clang/host/linux-x86/$(DRAGONTC_VERSION)
  DTC_VER := $(shell cat $(DTC_PATH)/VERSION)

  PRODUCT_PROPERTY_OVERRIDES += \
      ro.clang.version=$(DTC_VER)

  -include prebuilts/clang/host/linux-x86/$(DRAGONTC_VERSION)/DragonTC.mk
else
  # Toolchain and other
  TARGET_GCC_VERSION_KERNEL := 8.0

  ifeq ($(TARGET_USE_SDCLANG),true)
    # Disable cfi sanitizer
    ENABLE_CFI := false

    PRODUCT_PROPERTY_OVERRIDES += \
        ro.clang.version=Snapdragon-LLVM-4.0.2
  else
    # This path will only work in case of using a different manifest which excludes all changes required for compiling with DragonTC/clang7 and LTO. Here is the manifest https://github.com/pixeldustproject-o/manifest/tree/o2-dtc-removed
  endif
endif
