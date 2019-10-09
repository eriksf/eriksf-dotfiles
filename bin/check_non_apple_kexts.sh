#!/bin/bash

kext=$(kextstat | grep -vi com.apple)
echo "$kext"
echo ""

# unload PulseSecureFirewall kext if present
if [[ $kext =~ "PulseSecureFirewall" ]]
then
    echo -n "Found PulseSecureFirewall kernel extension, unloading..."
    sudo kextunload /Library/Extensions/PulseSecureFirewall.kext
    echo "done."
fi

