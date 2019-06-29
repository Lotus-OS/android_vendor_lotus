# Set all versions
LOTUS_BUILD_TYPE ?= UNOFFICIAL

LOTUS_DATE_YEAR := $(shell date -u +%Y)
LOTUS_DATE_MONTH := $(shell date -u +%m)
LOTUS_DATE_DAY := $(shell date -u +%d)
LOTUS_DATE_HOUR := $(shell date -u +%H)
LOTUS_DATE_MINUTE := $(shell date -u +%M)
LOTUS_VERSION_NUMBER := 1.0-Beta
LOTUS_BUILD_DATE_UTC := $(shell date -d '$(LOTUS_DATE_YEAR)-$(LOTUS_DATE_MONTH)-$(LOTUS_DATE_DAY) $(LOTUS_DATE_HOUR):$(LOTUS_DATE_MINUTE) UTC' +%s)
LOTUS_BUILD_DATE := $(LOTUS_DATE_YEAR)$(LOTUS_DATE_MONTH)$(LOTUS_DATE_DAY)-$(LOTUS_DATE_HOUR)$(LOTUS_DATE_MINUTE)

LOTUS_PLATFORM_VERSION := 9.0

TARGET_PRODUCT_SHORT := $(subst lotus_,,$(LOTUS_BUILD))

ifeq ($(IS_GO_VERSION), true)
LOTUS_VERSION := Lotus-OS_go-v$(LOTUS_VERSION_NUMBER)-$(LOTUS_BUILD)-$(LOTUS_BUILD_DATE)-$(LOTUS_BUILD_TYPE)
ROM_FINGERPRINT := Lotus-OS_go/v$(LOTUS_VERSION_NUMBER)/$(TARGET_PRODUCT_SHORT)/$(LOTUS_BUILD_DATE)
LOTUS_VERSION_PROP := Pie-GO
else
LOTUS_VERSION := Lotus-OS-v$(LOTUS_VERSION_NUMBER)-$(LOTUS_BUILD)-$(LOTUS_BUILD_DATE)-$(LOTUS_BUILD_TYPE)
LOTUS_VERSION_PROP := Pie
ROM_FINGERPRINT := Lotus-OS/v$(LOTUS_VERSION_NUMBER)/$(TARGET_PRODUCT_SHORT)/$(LOTUS_BUILD_DATE)
MODVERSION := Lotus-OS-v$(LOTUS_VERSION_NUMBER)-$(LOTUS_BUILD)-$(LOTUS_BUILD_DATE)
endif

CUSTOM_PROPERTIES := \
    ro.modversion==$(MODVERSION) \
    ro.lotus.version=$(LOTUS_VERSION_PROP) \
    ro.lotus.build_date=$(LOTUS_BUILD_DATE) \
    ro.lotus.build_date_utc=$(LOTUS_BUILD_DATE_UTC) \
    ro.lotus.build_type=$(LOTUS_BUILD_TYPE) \
    ro.lotus.fingerprint=$(ROM_FINGERPRINT)
