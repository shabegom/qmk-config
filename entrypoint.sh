#!/bin/bash

#echo "Setting up ZSA QMK fork ..."
# moved into Dockerfile, TODO make configurable
#qmk setup zsa/qmk_firmware -b firmware20
echo "Adding keymap ..."
qmk new-keymap -kb moonlander -km neo
echo "Overwrite keymap layout"
LAYOUT_PATH="${INPUT_PATH:-layout_src}"
ls $LAYOUT_PATH
echo "Path $LAYOUT_PATH"
cp $LAYOUT_PATH/* /qmk_firmware/keyboards/moonlander/keymaps/neo
ls /qmk_firmware/keyboards/moonlander/keymaps
echo "Compiling neo  ..."
qmk compile -kb moonlander -km neo
echo "Done!"
# outfile: .build/moonlander_neo.bin