.ONESHELL:
SHELL = /bin/bash
.SHELLFLAGS += -e

LINUX_KERNEL_CENTEC_URL = https://github.com/CentecNetworks/sonic-binaries/blob/master/$(PLATFORM_ARCH)/$(LINUX_KERNEL)
LINUX_KERNEL_DEBIMG_URL = https://github.com/CentecNetworks/sonic-binaries/blob/master/$(PLATFORM_ARCH)/$(LINUX_KERNEL_DEBIMG)
LINUX_KERNEL_HEADERS_URL = https://github.com/CentecNetworks/sonic-binaries/blob/master/$(PLATFORM_ARCH)/$(LINUX_KERNEL_HEADERS)

$(addprefix $(DEST)/, $(LINUX_KERNEL)): $(DEST)/% :
	# get deb package
	wget -O $(DEST)/$(LINUX_KERNEL) $(LINUX_KERNEL_CENTEC_URL)
	wget -O $(DEST)/$(LINUX_KERNEL) $(LINUX_KERNEL_DEBIMG_URL)
	wget -O $(DEST)/$(LINUX_KERNEL) $(LINUX_KERNEL_HEADERS_URL)

