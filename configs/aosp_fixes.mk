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

# Google property overides
PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.com.google.clientidbase=android-google \
    ro.error.receiver.system.apps=com.google.android.gms \
    ro.setupwizard.require_network=any \
    ro.setupwizard.mode=OPTIONAL \
    ro.com.android.dataroaming=false \
    ro.atrace.core.services=com.google.android.gms,com.google.android.gms.ui,com.google.android.gms.persistent \
    ro.setupwizard.rotation_locked=true \
    ro.com.google.ime.theme_id=5 \
    ro.opa.eligible_device=true
    #    ro.control_privapp_permissions=enforce \

# Camera Effects for devices without a vendor partition
ifneq ($(filter shamu,$(TARGET_PRODUCT)),)
PRODUCT_COPY_FILES +=  \
    vendor/pixeldust/prebuilt/media/LMspeed_508.emd:system/vendor/media/LMspeed_508.emd \
    vendor/pixeldust/prebuilt/media/PFFprec_600.emd:system/vendor/media/PFFprec_600.emd
endif

# Proprietary latinime libs needed for Keyboard swyping
ifneq ($(filter pixeldust_mako,$(TARGET_PRODUCT)),)
PRODUCT_COPY_FILES += \
    vendor/pixeldust/prebuilt/lib/libjni_latinime.so:system/lib/libjni_latinime.so
    vendor/pixeldust/prebuilt/lib/libjni_latinimegoogle.so:system/lib/libjni_latinimegoogle.so
else
PRODUCT_COPY_FILES += \
    vendor/pixeldust/prebuilt/lib64/libjni_latinime.so:system/lib64/libjni_latinime.so
    vendor/pixeldust/prebuilt/lib64/libjni_latinimegoogle.so:system/lib64/libjni_latinimegoogle.so
endif

# Fix Dialer
PRODUCT_COPY_FILES +=  \
    vendor/pixeldust/prebuilt/etc/sysconfig/dialer_experience.xml:system/etc/sysconfig/dialer_experience.xml 
