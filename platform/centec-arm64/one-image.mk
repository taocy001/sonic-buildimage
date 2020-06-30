# sonic centec one image installer

SONIC_ONE_IMAGE = sonic-centec-arm64.bin
$(SONIC_ONE_IMAGE)_MACHINE = centec-arm64
$(SONIC_ONE_IMAGE)_IMAGE_TYPE = onie

$(SONIC_ONE_IMAGE)_INSTALLS += $(SYSTEMD_SONIC_GENERATOR)
$(SONIC_ONE_IMAGE)_INSTALLS += $(LINUX_KERNEL_DTB_INITRAMFS)
$(SONIC_ONE_IMAGE)_INSTALLS += $(TSINGMA_BSP_MODULE)
$(SONIC_ONE_IMAGE)_LAZY_INSTALLS += $(CENTEC_E530_48T4X_P_PLATFORM_MODULE)
$(SONIC_ONE_IMAGE)_LAZY_INSTALLS += $(CENTEC_E530_24X2C_PLATFORM_MODULE)

ifeq ($(INSTALL_DEBUG_TOOLS),y)
$(SONIC_ONE_IMAGE)_DOCKERS += $(SONIC_INSTALL_DOCKER_DBG_IMAGES)
$(SONIC_ONE_IMAGE)_DOCKERS += $(filter-out $(patsubst %-$(DBG_IMAGE_MARK).gz,%.gz, $(SONIC_INSTALL_DOCKER_DBG_IMAGES)), $(SONIC_INSTALL_DOCKER_IMAGES))
else
$(SONIC_ONE_IMAGE)_DOCKERS = $(SONIC_INSTALL_DOCKER_IMAGES)
endif
SONIC_INSTALLERS += $(SONIC_ONE_IMAGE)
