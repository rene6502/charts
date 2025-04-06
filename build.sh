#!/bin/bash
set -e

for DIR in *; do
  if [ -d "$DIR" ] && test -f "$DIR/Chart.yaml"; then
    echo "build $DIR"
    rm -rf ./$DIR/charts
    helm dependency update ./$DIR
    rm -rf ./$DIR/Chart.lock
    helm dependency build ./$DIR
    helm lint ./$DIR --quiet
    helm package ./$DIR --destination ./docs
  fi
done

helm repo index ./docs --url https://rene6502.github.io/charts
