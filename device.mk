#
# Copyright (C) 2016 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product, vendor/huawei/hwgra/hwgra-vendor.mk)
$(call inherit-product, build/target/product/core_64_bit.mk)

DEVICE_PACKAGE_OVERLAYS += \
	device/huawei/hwgra/overlay

# NFC
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/com.nxp.mifare.xml:system/etc/permissions/com.nxp.mifare.xml \
	frameworks/native/data/etc/com.android.nfc_extras.xml:system/etc/permissions/com.android.nfc_extras.xml \
	frameworks/native/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml \
	frameworks/native/data/etc/android.hardware.nfc.hce.xml:system/etc/permissions/android.hardware.nfc.hce.xml \
	$(LOCAL_PATH)/prebuilts/libnfc-nxp_grace.conf:system/etc/libnfc-nxp.conf \
	$(LOCAL_PATH)/prebuilts/libnfc-brcm_grace.conf:system/etc/libnfc-brcm_grace.conf \
	$(LOCAL_PATH)/prebuilts/libnfc-nxp_grace.conf:system/etc/libnfc-nxp.conf \
	$(LOCAL_PATH)/prebuilts/libnfc-brcm_grace.conf:system/etc/libnfc-brcm_grace.conf \
	$(LOCAL_PATH)/prebuilts/libnfc-brcm.conf:system/etc/libnfc-brcm.conf 

# GPS
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilts/clatd.conf:system/etc/clatd.conf \
    $(LOCAL_PATH)/prebuilts/gps.conf:system/etc/gps.conf \
    $(LOCAL_PATH)/prebuilts/gpsconfig.xml:system/etc/gpsconfig.xml \
    $(LOCAL_PATH)/prebuilts/gpsconfig_beta.xml:system/etc/gpsconfig_beta.xml \
    $(LOCAL_PATH)/prebuilts/gps47531config.xml:system/etc/gps47531config.xml \
    $(LOCAL_PATH)/prebuilts/gps4752.conf:system/etc/gps4752.conf

# AUDIO CONFIG
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilts/audio_effects.conf:system/vendor/etc/audio_effects.conf \
    $(LOCAL_PATH)/prebuilts/audio_policy.conf:system/etc/audio_policy.conf

# CAMERA
PRODUCT_PACKAGES += \
	Camera2

# LibShim
PRODUCT_PACKAGES += \
	libshim \
    libshim_icu \
    libshim_camera \
    libhw_log \
    libshim_log \
    libshim_algo \
    libshim_hwui \
    libshim_gpsd

# GPS
PRODUCT_PACKAGES += \
	libgccdemangle

# debug
PRODUCT_PACKAGES += \
	dlopen32 \
	dlopen64

# Fix camera
PRODUCT_PACKAGES += \
	libstlport \
	libCameraHwExtend \
	camera.hi3635 \
	libunwind-ptrace

# Bluetooth config
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/bluetooth/bt_vendor.conf:system/etc/bluetooth/bt_vendor.conf

# Thermal engine
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilts/thermald.xml:system/etc/thermald.xml \
    $(LOCAL_PATH)/prebuilts/thermald_performance.xml:system/etc/thermald_performance.xml

# PERMISSIONS
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.camera.external.xml:system/etc/permissions/android.hardware.camera.external.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.full.xml:system/etc/permissions/android.hardware.camera.full.xml \
    frameworks/native/data/etc/android.hardware.camera.raw.xml:system/etc/permissions/android.hardware.camera.raw.xml \
    frameworks/native/data/etc/android.software.midi.xml:system/etc/permissions/android.software.midi.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:system/etc/permissions/android.hardware.sensor.stepcounter.xml \
    frameworks/native/data/etc/android.hardware.opengles.aep.xml:system/etc/permissions/android.hardware.opengles.aep.xml \
    frameworks/native/data/etc/android.software.app_widgets.xml:system/etc/permissions/android.software.app_widgets.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    $(LOCAL_PATH)/prebuilts/permissions/android.hardware.huawei.xml:system/etc/permissions/android.hardware.huawei.xml 

# MEDIA
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilts/media_codecs.xml:system/etc/media_codecs.xml \
    $(LOCAL_PATH)/prebuilts/media_profiles.xml:system/etc/media_profiles.xml

#FM
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilts/libfm_jni.so:system/lib/libfmjni.so \
    $(LOCAL_PATH)/prebuilts/libfm_jni64.so:system/lib64/libfmjni.so

PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:system/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml

# HARDWARE
PRODUCT_PACKAGES += \
	hwcomposer.hi3635 \
	lights.hi3635 \
	power.hi3635 

# AUDIO
PRODUCT_PACKAGES += \
	audio.primary.default \
	audio.a2dp.default \
	audio.usb.default \
	audio.r_submix.default \
	libaudioutils \
	libaudioroute \
	libtinyalsa \
	tinyplay \
	tinycap \
	tinymix \
	tinypcminfo

# FM RADIO
PRODUCT_PACKAGES += \
	FMRadio

# GELLO
PRODUCT_PACKAGES += \
	Gello

#?
PRODUCT_PACKAGES += \
	flp.default

# FLIPFLAP
PRODUCT_PACKAGES += \
    FlipFlap

# NFC
PRODUCT_PACKAGES += \
	com.android.nfc_extras \
	com.nxp.nfc.nq \
	nfc_nci.pn54x.default \
	nqnfcee_access.xml \
	nqnfcse_access.xml \
    NQNfcNci \
    nqnfcee_access.xml \
    nqnfcse_access.xml \
	Tag

# WIFI
PRODUCT_PACKAGES += \
	libwpa_client \
	wpa_supplicant \
	hostapd \
	wificond \
	wifilogd

# RAMDISK
PRODUCT_PACKAGES += \
    fstab.hi3635 \
    init.chip.usb.rc \
    init.hi3635.power.rc \
    init.hi3635.rc \
    init.hi3635.usb.rc \
    ueventd.hi3635.rc

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
	persist.sys.root_access=3

PRODUCT_PROPERTY_OVERRIDES += \
	ro.build.selinux=0 \
	persist.sys.root_access=3

ADDITIONAL_DEFAULT_PROPERTIES += \
	ro.config.hw_perfhub=true \
	ro.adb.secure=0 \
	ro.secure=0 \
	ro.debuggable=1 \
	ro.allow.mock.location=1 \
	persist.sys.root_access=3 \
	ro.zygote=zygote64_32 \
	persist.logd.logpersistd=logcatd \
	sys.init_log_level=3 \
	persist.debug.wfd.enable=1

# Non-device-specific props
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.locationfeatures=1 \

PRODUCT_PROPERTY_OVERRIDES += \
    media.stagefright.legacyencoder=true \
    media.stagefright.less-secure=true

# DALVIK AND MEMORY
$(call inherit-product, frameworks/native/build/phone-xxhdpi-3072-dalvik-heap.mk)
$(call inherit-product, frameworks/native/build/phone-xxhdpi-3072-hwui-memory.mk)
