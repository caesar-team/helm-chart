#!/bin/sh
PROJECT=$1
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )/${PROJECT}"
ROOT="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
echo "WORKING PROJECT is ${DIR}"
if [ ! -d "$DIR" ]; then
    echo ERROR: Project directory is NULL. Please recheck the variables 1>&2
    exit 1 # terminate and indicate error
fi
helm package $DIR -d $DIR
helm repo index $DIR