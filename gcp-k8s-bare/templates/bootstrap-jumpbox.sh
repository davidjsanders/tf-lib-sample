#!/usr/bin/env bash
echo
echo "Set Timezone to America/Toronto"
timedatectl set-timezone America/Toronto
ret_stat=$?
if [[ "$ret_stat" != "0" ]]
then
    exit $ret_stat
fi

echo
echo "Clone playbook(s)"
rm -rf ansible-playbooks
git clone https://github.com/dgsd-consulting/ansible-playbooks.git
ret_stat=$?
if [[ "$ret_stat" != "0" ]]
then 
    exit $ret_stat
fi

exit 0