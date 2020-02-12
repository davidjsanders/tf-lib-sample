# NOTE: This requires GNU getopt.  On Mac OS X and FreeBSD, you have to install this
# separately; see below.
ARGUMENTS=`getopt -o a:d:e:u:p: \
              --long auth_file:,domain_name:,email:,nexus_username:,nexus_password: \
              -n 'provisioner' -- "$@"`

if [ $? != 0 ] ; then echo "Terminating..." >&2 ; exit 1 ; fi

# Note the quotes around `$TEMP': they are essential!
eval set -- "$ARGUMENTS"

AUTH_FILE=""
DOMAIN_NAME=""
EMAIL=""
NEXUS_USERNAME=""
NEXUS_PASSWORD=""

while true; do
  case "$1" in
    -a | --auth_file ) AUTH_FILE="$2"; shift 2 ;;
    -d | --domain_name ) DOMAIN_NAME="$2"; shift 2 ;;
    -e | --email ) EMAIL="$2"; shift 2 ;;
    -u | --nexus_username ) NEXUS_USERNAME="$2"; shift 2 ;;
    -p | --nexus_password ) NEXUS_PASSWORD="$2"; shift 2 ;;
    -- ) shift; break ;;
    * ) break ;;
  esac
done
echo ""
echo "AUTH_FILE     : "$AUTH_FILE
echo "DOMAIN_NAME   : "$DOMAIN_NAME
echo "EMAIL         : "$EMAIL
echo "NEXUS_USERNAME: "$NEXUS_USERNAME
echo "NEXUS_PASSWORD: "$NEXUS_PASSWORD
echo