ifneq ($(IS_GENERIC_SYSTEM_IMAGE), true)
ifeq ($(LOTUS_BUILD_TYPE), OFFICIAL)

ifeq ($(IS_GO_VERSION), true)
LOTUS_OTA_VERSION_CODE := pie_go
else
LOTUS_OTA_VERSION_CODE := pie
endif

LOTUS_PROPERTIES += \
    org.pixelexperience.ota.version_code=$(LOTUS_OTA_VERSION_CODE) \
    sys.ota.disable_uncrypt=1

PRODUCT_PACKAGES += \
    Updates

PRODUCT_COPY_FILES += \
    vendor/lotus/config/permissions/org.pixelexperience.ota.xml:system/etc/permissions/org.pixelexperience.ota.xml

endif
endif
