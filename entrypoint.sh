#!/bin/bash

LAYOUT_PATH="${INPUT_PATH:-layout_src}"
ARTIFACTS_PATH="${INPUT_ARTIFACTS_PATH:-artifacts}"

KEYMAP="${INPUT_KEYMAP:-neo}"
KEYBOARD="${INPUT_KEYBOARD:-moonlander}"

#echo "Setting up ZSA QMK fork ..."
# moved into Dockerfile, TODO make configurable
#qmk setup zsa/qmk_firmware -b firmware20
echo "Adding keymap $KEYMAP [$KEYBOARD] ..."
qmk new-keymap -kb $KEYBOARD -km $KEYMAP

echo "Overwrite keymap layout from $LAYOUT_PATH"
cp $LAYOUT_PATH/* /qmk_firmware/keyboards/$KEYBOARD/keymaps/$KEYMAP
ls /qmk_firmware/keyboards/$KEYBOARD/keymaps/$KEYMAP

echo "Compiling keymap $KEYMAP ..."
qmk compile -kb $KEYBOARD -km $KEYMAP
# outfile: .build/moonlander_neo.bin
echo "Copying out into artifacts folder [$ARTIFACTS_PATH] ..."
pwd # /github/workspace
ls -altr
if [ ! -d "$ARTIFACTS_PATH" ]; then
  mkdir $ARTIFACTS_PATH
fi
cp -R /qmk_firmware/.build/* $ARTIFACTS_PATH/

echo "Artifacts list:"
ls $ARTIFACTS_PATH
echo "Done!"
