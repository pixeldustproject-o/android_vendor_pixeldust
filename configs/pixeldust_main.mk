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

# Use the default language for output
export LC_ALL=C

# Include overlays
PRODUCT_PACKAGE_OVERLAYS += \
    vendor/pixeldust/overlay/common

# Main Required Packages
PRODUCT_PACKAGES += \
    DeskClock \
    WebViewGoogle \
    LiveWallpapersPicker

# Include explicitly to work around Facelock issues
PRODUCT_PACKAGES += \
    librsjni

# Custom Packages
PRODUCT_PACKAGES += \
    WallpaperPickerGooglePrebuilt \
    NexusLauncherPrebuilt \
    LatinIMEGooglePrebuilt \
    Busybox \
    OmniJaws \
    OmniStyle

