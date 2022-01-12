#!/bin/bash -l

echo "Setting up ZSA QMK fork ..."
qmk setup zsa/qmk_firmware -b firmware20
echo "Adding keymap ..."
qmk new-keymap -kb moonlander -km neo
qmk compile -kb moonlander -km neo
echo "Overwrite keymap layout"
ls $INPUT_PATH
cp $INPUT_PATH/* /qmk_firmware/keyboards/moonlander/keymaps/neo
echo "Compiling ..."
qmk compile -kb moonlander -km neo
echo "Done!"
# outfile: .build/moonlander_neo.bin