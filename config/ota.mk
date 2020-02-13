ifeq ($(LOTUS_BUILD_TYPE), OFFICIAL)

LOTUS_OTA_VERSION_CODE := ten

LOTUS_PROPERTIES += \
    ro.lotus.ota.version_code=$(LOTUS_OTA_VERSION_CODE)

PRODUCT_PACKAGES += \
    Updates

PRODUCT_COPY_FILES += \
    vendor/lotus/config/permissions/ro.lotus.ota.xml:system/etc/permissions/ro.lotus.ota.xml

endif
