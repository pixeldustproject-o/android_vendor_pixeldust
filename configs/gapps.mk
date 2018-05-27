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

TARGET_MINIMAL_APPS ?= false

GAPPS_VARIANT := nano

ifeq ($(IS_PHONE),true)
GAPPS_FORCE_DIALER_OVERRIDES := true
GAPPS_FORCE_MMS_OVERRIDES := true
endif

GAPPS_PRODUCT_PACKAGES += GoogleContacts talkback LatinImeGoogle PrebuiltDeskClockGoogle CalculatorGoogle TagGoogle
GAPPS_FORCE_WEBVIEW_OVERRIDES := true
GAPPS_EXCLUDED_PACKAGES := PrebuiltGmsCoreInstantApps

ifeq ($(TARGET_MINIMAL_APPS),false)
GAPPS_FORCE_BROWSER_OVERRIDES := true
GAPPS_PRODUCT_PACKAGES += CalendarGooglePrebuilt Photos
else
GAPPS_EXCLUDED_PACKAGES += Velvet
endif

$(call inherit-product, vendor/opengapps/build/opengapps-packages.mk)
