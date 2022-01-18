#!/bin/bash

#echo "Setting up ZSA QMK fork ..."
# moved into Dockerfile, TODO make configurable
#qmk setup zsa/qmk_firmware -b firmware20
echo "Adding keymap ..."
qmk new-keymap -kb moonlander -km neo
LAYOUT_PATH="${INPUT_PATH:-layout_src}"
ARTIFACTS_PATH="${INPUT_ARTIFACTS_PATH:-artifacts}"
echo "Overwrite keymap layout from $LAYOUT_PATH"
cp $LAYOUT_PATH/* /qmk_firmware/keyboards/moonlander/keymaps/neo
ls /qmk_firmware/keyboards/moonlander/keymaps
echo "Compiling neo  ..."
qmk compile -kb moonlander -km neo
# outfile: .build/moonlander_neo.bin
echo "Copying out into artifacts folder [$ARTIFACTS_PATH] ..."
cp /qmk_firmware/.build/* $ARTIFACTS_PATH
# pwd is /github/workspace
if [ ! -d "$ARTIFACTS_PATH" ]; then
  mkdir $ARTIFACTS_PATH
fi
cp /qmk_firmware/.build/* $ARTIFACTS_PATH
ls -altr
ls -altr $ARTIFACTS_PATH
echo "Done!"
