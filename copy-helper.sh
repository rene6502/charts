#!/bin/bash
for DIR in *; do
  if [ -d "$DIR" ] && test -f "$DIR/Chart.yaml"; then
    echo "copy $DIR/templates/_helpers.tpl"
    cp ./common/_helpers.tpl "$DIR/templates/"
  fi
done
