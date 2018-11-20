TAR=libdolby_atmos.so
DOLBY_FW=dolby_fw_datmos
SCRIPT=S83dsd
CC = arm-linux-gnueabihf-gcc


all: $(TAR)

clean:
	rm -f $(TARGET_DIR)/sbin/$(DOLBY_FW)
	rm -f $(TARGET_DIR)/usr/lib/$(TAR)
	rm -f $(TARGET_DIR)/etc/init.d/$(SCRIPT)
install:
	install -m 0755 ./$(DOLBY_FW) $(TARGET_DIR)/sbin/
	install -m 0755 ./$(TAR) $(TARGET_DIR)/usr/lib/
	install -m 0755 ./$(SCRIPT) $(TARGET_DIR)/etc/init.d/
uninstall:
	rm -f $(TARGET_DIR)/sbin/$(DOLBY_FW)
	rm -f $(TARGET_DIR)/usr/lib/$(TAR)
	rm -f $(TARGET_DIR)/etc/init.d/$(SCRIPT)
