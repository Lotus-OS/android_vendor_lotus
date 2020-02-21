ifeq ($(CUSTOM_BUILD_TYPE), OFFICIAL)

CUSTOM_OTA_VERSION_CODE := Quoche

CUSTOM_PROPERTIES += \
    ro.lotus.ota.version_code=$(CUSTOM_OTA_VERSION_CODE)

PRODUCT_PACKAGES += \
    Updates

PRODUCT_COPY_FILES += \
    vendor/lotus/config/permissions/ro.lotus.ota.xml:system/etc/permissions/ro.lotus.ota.xml

endif
