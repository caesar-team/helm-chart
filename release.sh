#!/bin/sh
set -e
WORKING_DIRECTORY="$PWD"

[ -z "$GITHUB_PAGES_BRANCH" ] && GITHUB_PAGES_BRANCH=gh-pages
[ -z "$HELM_CHARTS_SOURCE" ] && HELM_CHARTS_SOURCE="$WORKING_DIRECTORY/stable"
echo "HELM_CHARTS_SOURCE=$HELM_CHARTS_SOURCE"
echo '>> Building charts...'
find "$HELM_CHARTS_SOURCE" -mindepth 1 -maxdepth 1 -type d | while read chart; do
  echo ">>> helm lint $chart"
  helm lint "$chart"
  chart_name="`basename "$chart"`"
  echo ">>> helm package -u -d $chart_name $chart"
  mkdir -p "$chart_name"
  helm package -d "$chart_name" "$chart"
done
echo '>>> helm repo index'
helm repo index .