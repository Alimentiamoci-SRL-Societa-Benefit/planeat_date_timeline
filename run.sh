#!/bin/bash

SCRIPTS_VERSION="0.0.2"
SCRIPTS_LOCATION="./.scripts/${SCRIPTS_VERSION}"
SCRIPTS_URL="git@github.com:Alimentiamoci-SRL-Societa-Benefit/planeat-app-scripts.git"

set -e

cd "$(dirname "$0")"

if [ ! -d $SCRIPTS_LOCATION ]; then
  echo "Getting remote scripts repository..."

  mkdir -p $SCRIPTS_LOCATION
  git clone --depth 1 --branch $SCRIPTS_VERSION $SCRIPTS_URL $SCRIPTS_LOCATION &> /dev/null
fi

echo "Setup..."
source $SCRIPTS_LOCATION/scripts/setup.sh

COMMAND="$1"

case $COMMAND in
  publish)
    source $SCRIPTS_LOCATION/scripts/publish.sh
    ;;
  *)
    echo "${COMMAND} is an invalid command, available commands are [publish]"
    exit 2
    ;;
esac
