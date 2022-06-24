#!/bin/bash -x

PROJECT_NAME="$1"
apicup init $PROJECT_NAME
cd $PROJECT_NAME
apicup licenses accept L-RJON-C7BJ42
