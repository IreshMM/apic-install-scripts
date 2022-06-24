#!/bin/bash

PROJECT_NAME="$1"

SCRIPT_ROOT=`dirname $0`
source $SCRIPT_ROOT/init.sh "$PROJECT_NAME"
source $SCRIPT_ROOT/mgmt.sh
source $SCRIPT_ROOT/analyt.sh
source $SCRIPT_ROOT/port.sh

