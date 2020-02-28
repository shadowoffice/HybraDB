#!/bin/bash

# This is a bash script that will validate all of the XML in the
# repository against Hybrasyl schema. You can run it on any platform
# supporting bash (GNU/Linux, OSX, or wsl
# (https://docs.microsoft.com/en-us/windows/wsl/install-win10).

# You will need xmllint installed (e.g. `sudo apt install
# libxml2-utils` on Ubuntu).

RET=0

for x in $(find . -name '*.xml'); do
    xmllint --noout $x
    RET=$?
done

if [ ${RET} -eq 0 ]; then
    echo "All files validated successfully."
fi
