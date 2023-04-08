#!/bin/bash

set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

${DIR}/stop.sh
rm -rf ${DIR}/vpn
rm -f ${DIR}/start.sh ${DIR}/stop.sh ${DIR}/uninstall.sh
