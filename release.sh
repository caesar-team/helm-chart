#!/bin/sh
SEMVER_REGEX='^([0-9]+\.){0,2}(\*|[0-9]+)$'

PROJECT=$1
VERSION=$2

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )/${PROJECT}"
ROOT="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
echo "WORKING PROJECT is ${DIR}"
if [ ! -d "$DIR" ]; then
    echo ERROR: Project directory is NULL. Please recheck the variables 1>&2
    exit 1 # terminate and indicate error
fi

if [[ $VERSION =~ $SEMVER_REGEX ]]; then
 echo "INFO: Version $VERSION"
 helm package $DIR  --version=$VERSION -d $DIR
else
  helm package $DIR -d $DIR
fi

helm repo index $DIR