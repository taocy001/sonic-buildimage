.ONESHELL:
SHELL = /bin/bash
.SHELLFLAGS += -e

CENTEC_SAI_URL = https://github.com/CentecNetworks/sonic-binaries/blob/master/$(PLATFORM_ARCH)/$(CENTEC_SAI)

$(addprefix $(DEST)/, $(CENTEC_SAI)): $(DEST)/% :
	# get deb package
	wget -O $(DEST)/$(CENTEC_SAI) $(CENTEC_SAI_URL)
