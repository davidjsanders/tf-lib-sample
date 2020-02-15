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

logIt "Process arguments"
ARGUMENTS=`getopt -o a:d:e:u:p: \
              --long auth_file: \
              --long domain_name:\
              --long email:\
              --long nexus_username:\
              --long nexus_password: \
              --long postgres_db: \
              --long postgres_endpoint: \
              --long postgres_password: \
              --long postgres_username: \
              -n 'provisioner' -- "$@"`

if [ $? != 0 ] ; then echo "Terminating..." >&2 ; exit 1 ; fi

# Note the quotes around `$TEMP': they are essential!
eval set -- "$ARGUMENTS"

AUTH_FILE=""
DOMAIN_NAME=""
EMAIL=""
NEXUS_USERNAME=""
NEXUS_PASSWORD=""
POSTGRES_DB=""
POSTGRES_ENDPOINT=""
POSTGRES_PASSWORD=""
POSTGRES_USERNAME=""

while true; do
  case "$1" in
    -a | --auth_file ) AUTH_FILE="$2"; shift 2 ;;
    -d | --domain_name ) DOMAIN_NAME="$2"; shift 2 ;;
    -e | --email ) EMAIL="$2"; shift 2 ;;
    -u | --nexus_username ) NEXUS_USERNAME="$2"; shift 2 ;;
    -p | --nexus_password ) NEXUS_PASSWORD="$2"; shift 2 ;;
    --postgres_db ) POSTGRES_DB="$2"; shift 2 ;;
    --postgres_endpoint ) POSTGRES_ENDPOINT="$2"; shift 2 ;;
    --postgres_password ) POSTGRES_PASSWORD="$2"; shift 2 ;;
    --postgres_username ) POSTGRES_USERNAME="$2"; shift 2 ;;
    -- ) shift; break ;;
    * ) break ;;
  esac
done

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
EXTRA_VARS='{'
EXTRA_VARS+='"auth_file": "'$AUTH_FILE'",'
EXTRA_VARS+='"domain": "'$DOMAIN_NAME'",'
EXTRA_VARS+='"email": "'$EMAIL'",'
EXTRA_VARS+='"nexus_username": "'$NEXUS_USERNAME'",'
EXTRA_VARS+='"nexus_password": "'$NEXUS_PASSWORD'"'
EXTRA_VARS+='}'

sudo -u ${admin} \
    ansible-playbook playbook/k8s-playbook/playbook.yml --extra-vars "$${EXTRA_VARS}"
checkError $?

logIt "Done (for just now)"
