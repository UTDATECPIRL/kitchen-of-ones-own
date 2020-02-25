#!/bin/bash

if [ "$#" -eq 1 ]; then
    outputPath="$1/EPIC_KITCHENS_2018"
else
    outputPath="$HOME/Downloads/EPIC_KITCHENS_2018"
fi

if ! [ -x "$(command -v wget)" ]; then
    echo "Error!: wget is not installed! Please install it and try again"
    exit 1
fi

echo -e "\n### ------------------------------------------------------- ###\n"
echo "### Downloading into $outputPath"
echo -e "\n### ------------------------------------------------------- ###\n"

epic_download() {
    local url=$1
    local path=$2
    local niceFilePath=$3
    
    echo -ne "# Downloading "$niceFilePath"\t"
    wget --progress=dot --continue --directory-prefix="$path" "$url" 2>&1 | grep --line-buffered "%" | sed -E "s,\.,,g" | awk '{printf("\b\b\b\b%4s", $2)}'
    echo -ne "\b\b\b\b"
    echo " # done"
}

epic_download "https://data.bris.ac.uk/datasets/3h91syskeag572hl6tvuovwv4d/frames_rgb_flow/rgb/test/P04/P04_24.tar" "$outputPath/frames_rgb_flow/rgb/test/P04" "frames_rgb_flow/rgb/test/P04/P04_24.tar"
epic_download "https://data.bris.ac.uk/datasets/3h91syskeag572hl6tvuovwv4d/frames_rgb_flow/rgb/test/P04/P04_25.tar" "$outputPath/frames_rgb_flow/rgb/test/P04" "frames_rgb_flow/rgb/test/P04/P04_25.tar"
epic_download "https://data.bris.ac.uk/datasets/3h91syskeag572hl6tvuovwv4d/frames_rgb_flow/rgb/test/P04/P04_26.tar" "$outputPath/frames_rgb_flow/rgb/test/P04" "frames_rgb_flow/rgb/test/P04/P04_26.tar"
epic_download "https://data.bris.ac.uk/datasets/3h91syskeag572hl6tvuovwv4d/frames_rgb_flow/rgb/test/P04/P04_27.tar" "$outputPath/frames_rgb_flow/rgb/test/P04" "frames_rgb_flow/rgb/test/P04/P04_27.tar"
epic_download "https://data.bris.ac.uk/datasets/3h91syskeag572hl6tvuovwv4d/frames_rgb_flow/rgb/test/P04/P04_28.tar" "$outputPath/frames_rgb_flow/rgb/test/P04" "frames_rgb_flow/rgb/test/P04/P04_28.tar"
epic_download "https://data.bris.ac.uk/datasets/3h91syskeag572hl6tvuovwv4d/frames_rgb_flow/rgb/test/P04/P04_29.tar" "$outputPath/frames_rgb_flow/rgb/test/P04" "frames_rgb_flow/rgb/test/P04/P04_29.tar"
epic_download "https://data.bris.ac.uk/datasets/3h91syskeag572hl6tvuovwv4d/frames_rgb_flow/rgb/test/P04/P04_30.tar" "$outputPath/frames_rgb_flow/rgb/test/P04" "frames_rgb_flow/rgb/test/P04/P04_30.tar"
epic_download "https://data.bris.ac.uk/datasets/3h91syskeag572hl6tvuovwv4d/frames_rgb_flow/rgb/test/P04/P04_31.tar" "$outputPath/frames_rgb_flow/rgb/test/P04" "frames_rgb_flow/rgb/test/P04/P04_31.tar"
epic_download "https://data.bris.ac.uk/datasets/3h91syskeag572hl6tvuovwv4d/frames_rgb_flow/rgb/test/P04/P04_32.tar" "$outputPath/frames_rgb_flow/rgb/test/P04" "frames_rgb_flow/rgb/test/P04/P04_32.tar"
epic_download "https://data.bris.ac.uk/datasets/3h91syskeag572hl6tvuovwv4d/frames_rgb_flow/rgb/test/P04/P04_33.tar" "$outputPath/frames_rgb_flow/rgb/test/P04" "frames_rgb_flow/rgb/test/P04/P04_33.tar"

echo -e "\n### ------------------------------------------------------- ###\n"
echo "### All done!"
echo -e "\n### ------------------------------------------------------- ###\n"
