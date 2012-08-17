# Copyright (C) 2009 The Android Open Source Project
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

#
# This file is the build configuration for a full Android
# build for sapphire hardware. This cleanly combines a set of
# device-specific aspects (drivers) with a device-agnostic
# product configuration (apps).
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)

$(call inherit-product, device/common/gps/gps_us_supl.mk)

DEVICE_PACKAGE_OVERLAYS := device/zte/blade/overlay

PRODUCT_PACKAGES += \
    LiveWallpapers \
    LiveWallpapersPicker \
    MagicSmokeWallpapers \
    VisualizationWallpapers \
    librs_jni \
    Gallery3d \
    SpareParts \
    Development \
    Term \
    BladeUpdater \
    CMDroidwall \
    CMTimers \
    gralloc.blade \
    copybit.blade \
    gps.blade \
    lights.blade \
    sensors.blade \
    libOmxCore \
    libOmxVidEnc \
    FM \
    dump_image \
    e2fsck \
    rzscontrol \
    abtfilt \
    BladeParts \
    prox_cal \
    erase_image \
    flash_image \
    screencap \
    dexpreopt

# proprietary side of the device
$(call inherit-product-if-exists, vendor/zte/blade/blade-vendor.mk)

DISABLE_DEXPREOPT := false

PRODUCT_COPY_FILES += \
    device/zte/blade/qwerty.kl:system/usr/keylayout/qwerty.kl \
    device/zte/blade/blade_keypad.kcm.bin:system/usr/keychars/blade_keypad.kcm.bin

# fstab
PRODUCT_COPY_FILES += \
    device/zte/blade/vold.fstab:system/etc/vold.fstab

# Init
PRODUCT_COPY_FILES += \
    device/zte/blade/init.blade.rc:root/init.blade.rc \
    device/zte/blade/ueventd.blade.rc:root/ueventd.blade.rc

# Audio
PRODUCT_COPY_FILES += \
    device/zte/blade/AudioFilter.csv:system/etc/AudioFilter.csv \
    device/zte/blade/AutoVolumeControl.txt:system/etc/AutoVolumeControl.txt

# WLAN + BT
PRODUCT_COPY_FILES += \
    device/zte/blade/init.bt.sh:system/etc/init.bt.sh \
    device/zte/blade/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    device/zte/blade/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf \
    device/zte/blade/prebuilt/hostapd:system/bin/hostapd \
    device/zte/blade/prebuilt/hostapd.conf:system/etc/wifi/hostapd.conf

# Install the features available on this device.
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml

#Kernel Modules
PRODUCT_COPY_FILES += \
    device/zte/blade/prebuilt/ar6000.ko:system/wifi/ar6000.ko

#WiFi firmware
PRODUCT_COPY_FILES += \
    device/zte/blade/firmware/regcode:system/wifi/regcode \
    device/zte/blade/firmware/data.patch.hw2_0.bin:system/wifi/data.patch.hw2_0.bin \
    device/zte/blade/firmware/athwlan.bin.z77:system/wifi/athwlan.bin.z77 \
    device/zte/blade/firmware/athtcmd_ram.bin:system/wifi/athtcmd_ram.bin \
    device/zte/blade/firmware/device.bin:system/wifi/device.bin \
    device/zte/blade/firmware/eeprom.bin:system/wifi/eeprom.bin \
    device/zte/blade/firmware/eeprom.data:system/wifi/eeprom.data

#Media profile
PRODUCT_COPY_FILES += \
    device/zte/blade/media_profiles.xml:system/etc/media_profiles.xml \
    device/zte/blade/poweron.ogg:system/media/poweron.ogg \
    device/zte/blade/camera_click.ogg:system/media/audio/ui/camera_click.ogg \
    device/zte/blade/VideoRecord.ogg:system/media/audio/ui/VideoRecord.ogg

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
# Discard inherited values and use our own instead.
PRODUCT_NAME := zte_blade
PRODUCT_DEVICE := blade
PRODUCT_MODEL := ZTE Blade

# Blade uses high-density artwork where available
PRODUCT_LOCALES += hdpi

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

