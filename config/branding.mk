# Set all versions
LOTUS_BUILD_TYPE ?= UNOFFICIAL

LOTUS_DATE_YEAR := $(shell date -u +%Y)
LOTUS_DATE_MONTH := $(shell date -u +%m)
LOTUS_DATE_DAY := $(shell date -u +%d)
LOTUS_DATE_HOUR := $(shell date -u +%H)
LOTUS_DATE_MINUTE := $(shell date -u +%M)
LOTUS_BUILD_DATE_UTC := $(shell date -d '$(LOTUS_DATE_YEAR)-$(LOTUS_DATE_MONTH)-$(LOTUS_DATE_DAY) $(LOTUS_DATE_HOUR):$(LOTUS_DATE_MINUTE) UTC' +%s)
LOTUS_BUILD_DATE := $(LOTUS_DATE_YEAR)$(LOTUS_DATE_MONTH)$(LOTUS_DATE_DAY)-$(LOTUS_DATE_HOUR)$(LOTUS_DATE_MINUTE)

LOTUS_PLATFORM_VERSION := 10.0

LOTUS_VERSION_NUMBER := v1.6-alpha

LOTUS_VERSION_TEXT := Quiche

TARGET_PRODUCT_SHORT := $(subst lotus_,,$(LOTUS_BUILD))

LOTUS_VERSION := LotusOS-$(LOTUS_BUILD)-$(LOTUS_VERSION_NUMBER)-$(LOTUS_BUILD_DATE)-$(LOTUS_VERSION_TEXT)
LOTUS_VERSION_PROP := 10

LOTUS_PROPERTIES := \
    ro.lotus.version=$(LOTUS_VERSION_PROP) \
    ro.lotus.version.display=$(LOTUS_VERSION) \
    ro.lotus.build_date=$(LOTUS_BUILD_DATE) \
    ro.lotus.build_date_utc=$(LOTUS_BUILD_DATE_UTC) \
    ro.lotus.build_type=$(LOTUS_BUILD_TYPE)

ifeq ($(LOTUS_BUILD_TYPE), OFFICIAL)
PRODUCT_DEFAULT_DEV_CERTIFICATE := vendor/secure/releasekey
endif
