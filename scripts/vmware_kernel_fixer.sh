#!/bin/bash

set -ex

# FROM: //communities.vmware.com/t5/VMware-Workstation-Pro/VMware-16-2-3-not-working-on-Ubuntu-22-04-LTS/td-p/2905535

# check your vmware player version: vmplayer --version

cd /usr/lib/vmware/modules/source
git clone https://github.com/mkubecek/vmware-host-modules
cd vmware-host-modules
git checkout workstation-16.2.3
make
tar -cf vmnet.tar vmnet-only
tar -cf vmmon.tar vmmon-only
mv vmnet.tar /usr/lib/vmware/modules/source/
mv vmmon.tar /usr/lib/vmware/modules/source/
vmware-modconfig --console --install-all
