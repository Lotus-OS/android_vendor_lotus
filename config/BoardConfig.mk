include vendor/lotus/config/BoardConfigKernel.mk

ifeq ($(BOARD_USES_QCOM_HARDWARE),true)
include vendor/lotus/config/BoardConfigQcom.mk
endif

include vendor/lotus/config/BoardConfigSoong.mk
