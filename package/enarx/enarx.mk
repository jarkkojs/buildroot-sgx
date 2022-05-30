################################################################################
#
# enarx
#
################################################################################

ENARX_VERSION = master
ENARX_SITE = $(call github,enarx,enarx,$(ENARX_VERSION))
ENARX_LICENSE = GPL3
ENARX_LICENSE_FILES = LICENSE
ENARX_CARGO_BUILD_OPTS = \
	-Z bindeps
ENARX_CARGO_INSTALL_OPTS = \
	-Z bindeps

$(eval $(cargo-package))
