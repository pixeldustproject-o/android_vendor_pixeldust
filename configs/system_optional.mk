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

# Build PixelDust Walls
PRODUCT_PACKAGES += \
    PixelDustWallpapers

# Battery optimization tool
PRODUCT_PACKAGES += \
    Turbo

# Google Markup from Android P
PRODUCT_PACKAGES += \
    GoogleMarkup

# GoogleWebview (prevents new users ending up without webview on 1st install)
PRODUCT_PACKAGES += \
    GoogleWebview

# Include AmbientSense if it's available
-include vendor/ambientmusic/AmbientMusic.mk

