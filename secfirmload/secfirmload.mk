################################################################################
#
#secure firmware load
#
################################################################################
ifeq ($(BR2_PACKAGE_SECFIRMLOAD),y)
SECVIDEO_FIRMWARE_VERSION = 1.0
#prebuilt defines.
SECVIDEO_PREBUILT_SITE = $(TOPDIR)/../multimedia/secfirmload/secloadbin
SECVIDEO_PREBUILT_SITE_METHOD = local

ifeq ($(BR2_aarch64),y)
SECVIDEO_PREBUILT_DIRECTORY = multimedia/secfirmload/secloadbin/arm64
else
SECVIDEO_PREBUILT_DIRECTORY = multimedia/secfirmload/secloadbin/arm
endif

define SECFIRMLOAD_INSTALL_TARGET_CMDS
	cp -av $(TOPDIR)/../$(SECVIDEO_PREBUILT_DIRECTORY)/tee_preload_fw     $(TARGET_DIR)/usr/bin/tee_preload_fw
	cp -av $(TOPDIR)/../$(SECVIDEO_PREBUILT_DIRECTORY)/tee_preload_fw.so  $(TARGET_DIR)/usr/lib/tee_preload_fw.so
	cp -av $(TOPDIR)/../$(SECVIDEO_PREBUILT_DIRECTORY)/526fc4fc-7ee6-4a12-96e3-83da9565bce8.ta   $(TARGET_DIR)/lib/teetz/
endef

ifeq ($(BR2_PACKAGE_LAUNCHER_USE_SECFIRMLOAD), y)
define SECVIDEO_PREBUILT_INSTALL_INIT_SYSV
	rm -rvf $(TARGET_DIR)/etc/init.d/S60*
	$(INSTALL) -D -m -v 755 multimedia/secfirmload/secloadbin/S60secload $(TARGET_DIR)/etc/init.d/S60secload
endef
endif

$(eval $(generic-package))

endif

