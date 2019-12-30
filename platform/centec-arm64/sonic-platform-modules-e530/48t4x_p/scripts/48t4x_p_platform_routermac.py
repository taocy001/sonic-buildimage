#!/usr/bin/env python

#############################################################################
# Centec
#
# Module contains an implementation of sfp presence scan logic
#
#############################################################################

try:
    import os
    import syslog
    import swsssdk
except ImportError, e:
    raise ImportError(str(e) + " - required module not found")


def DBG_PRINT(str):
    syslog.openlog("centec-init")
    syslog.syslog(syslog.LOG_INFO, str)
    syslog.closelog()


class PlatformInit:

    def initialize_configdb(self):
        try:
            f_mac = os.popen('ip link show eth0 | grep ether | awk \'{print $2}\'')
            mac_addr = f_mac.read(17)
            last_byte = mac_addr[-2:]
            aligned_last_byte = format(int(int(str(last_byte), 16) + 1), '02x')
            mac_addr = mac_addr[:-2] + aligned_last_byte
            DBG_PRINT("start connect swss config-db to set device mac-address")
            swss = swsssdk.SonicV2Connector()
            swss.connect(swss.CONFIG_DB)
            swss.set(swss.CONFIG_DB, "DEVICE_METADATA|localhost", 'mac', mac_addr)
            mac_addr = swss.get(swss.CONFIG_DB, "DEVICE_METADATA|localhost", 'mac')
            DBG_PRINT("set device mac-address: %s" % mac_addr)
        except IOError as e:
            DBG_PRINT(str(e))

    def initialize(self):
        DBG_PRINT("centec platform service initialize config db.")

        self.initialize_configdb()

if __name__ == "__main__":
    init = PlatformInit()
    init.initialize()

