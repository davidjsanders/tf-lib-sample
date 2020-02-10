#!/usr/bin/env bash
function logIt() {
    echo
    echo "***"
    echo "*** $1"
    echo "***"
    echo
}

function checkError() {
    if [ "$1" != "0" ]; then logIt "Error: $1"; fi
}

logIt "Move inventory to /etc/ansible/hosts"
cp /home/${admin}/inventory.txt /etc/ansible/hosts
checkError $?

logIt "Clear existing playbook (if exists)"
rm -rf \
    /home/${admin}/playbook
checkError $?

logIt "Clone playbook"
git clone \
    https://github.com/dgsd-consulting/ansible-playbooks.git \
    /home/${admin}/playbook
checkError $?

logIt "Execute playbook"
sudo -u ${admin} ansible-playbook playbook/k8s-playbook/playbook.yml
checkError $?

logIt "Done (for just now)"
# mkdir -p /datadrive
# UUID=$(blkid | grep /dev/sdc1 | awk '{print $2}' | sed -e 's/UUID="\(.*\)\"/\1/')
# echo "UUID=$UUID   /datadrive  ext4   defaults,nofail   1 2" | tee -a /etc/fstab
# mount -a
