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

epic_download "https://data.bris.ac.uk/datasets/3h91syskeag572hl6tvuovwv4d/frames_rgb_flow/rgb/train/P26/P26_01.tar" "$outputPath/frames_rgb_flow/rgb/train/P26" "frames_rgb_flow/rgb/train/P26/P26_01.tar"
epic_download "https://data.bris.ac.uk/datasets/3h91syskeag572hl6tvuovwv4d/frames_rgb_flow/rgb/train/P26/P26_02.tar" "$outputPath/frames_rgb_flow/rgb/train/P26" "frames_rgb_flow/rgb/train/P26/P26_02.tar"
epic_download "https://data.bris.ac.uk/datasets/3h91syskeag572hl6tvuovwv4d/frames_rgb_flow/rgb/train/P26/P26_03.tar" "$outputPath/frames_rgb_flow/rgb/train/P26" "frames_rgb_flow/rgb/train/P26/P26_03.tar"
epic_download "https://data.bris.ac.uk/datasets/3h91syskeag572hl6tvuovwv4d/frames_rgb_flow/rgb/train/P26/P26_04.tar" "$outputPath/frames_rgb_flow/rgb/train/P26" "frames_rgb_flow/rgb/train/P26/P26_04.tar"
epic_download "https://data.bris.ac.uk/datasets/3h91syskeag572hl6tvuovwv4d/frames_rgb_flow/rgb/train/P26/P26_05.tar" "$outputPath/frames_rgb_flow/rgb/train/P26" "frames_rgb_flow/rgb/train/P26/P26_05.tar"
epic_download "https://data.bris.ac.uk/datasets/3h91syskeag572hl6tvuovwv4d/frames_rgb_flow/rgb/train/P26/P26_06.tar" "$outputPath/frames_rgb_flow/rgb/train/P26" "frames_rgb_flow/rgb/train/P26/P26_06.tar"
epic_download "https://data.bris.ac.uk/datasets/3h91syskeag572hl6tvuovwv4d/frames_rgb_flow/rgb/train/P26/P26_07.tar" "$outputPath/frames_rgb_flow/rgb/train/P26" "frames_rgb_flow/rgb/train/P26/P26_07.tar"
epic_download "https://data.bris.ac.uk/datasets/3h91syskeag572hl6tvuovwv4d/frames_rgb_flow/rgb/train/P26/P26_08.tar" "$outputPath/frames_rgb_flow/rgb/train/P26" "frames_rgb_flow/rgb/train/P26/P26_08.tar"
epic_download "https://data.bris.ac.uk/datasets/3h91syskeag572hl6tvuovwv4d/frames_rgb_flow/rgb/train/P26/P26_09.tar" "$outputPath/frames_rgb_flow/rgb/train/P26" "frames_rgb_flow/rgb/train/P26/P26_09.tar"
epic_download "https://data.bris.ac.uk/datasets/3h91syskeag572hl6tvuovwv4d/frames_rgb_flow/rgb/train/P26/P26_10.tar" "$outputPath/frames_rgb_flow/rgb/train/P26" "frames_rgb_flow/rgb/train/P26/P26_10.tar"
epic_download "https://data.bris.ac.uk/datasets/3h91syskeag572hl6tvuovwv4d/frames_rgb_flow/rgb/train/P26/P26_11.tar" "$outputPath/frames_rgb_flow/rgb/train/P26" "frames_rgb_flow/rgb/train/P26/P26_11.tar"
epic_download "https://data.bris.ac.uk/datasets/3h91syskeag572hl6tvuovwv4d/frames_rgb_flow/rgb/train/P26/P26_12.tar" "$outputPath/frames_rgb_flow/rgb/train/P26" "frames_rgb_flow/rgb/train/P26/P26_12.tar"
epic_download "https://data.bris.ac.uk/datasets/3h91syskeag572hl6tvuovwv4d/frames_rgb_flow/rgb/train/P26/P26_13.tar" "$outputPath/frames_rgb_flow/rgb/train/P26" "frames_rgb_flow/rgb/train/P26/P26_13.tar"
epic_download "https://data.bris.ac.uk/datasets/3h91syskeag572hl6tvuovwv4d/frames_rgb_flow/rgb/train/P26/P26_14.tar" "$outputPath/frames_rgb_flow/rgb/train/P26" "frames_rgb_flow/rgb/train/P26/P26_14.tar"
epic_download "https://data.bris.ac.uk/datasets/3h91syskeag572hl6tvuovwv4d/frames_rgb_flow/rgb/train/P26/P26_15.tar" "$outputPath/frames_rgb_flow/rgb/train/P26" "frames_rgb_flow/rgb/train/P26/P26_15.tar"
epic_download "https://data.bris.ac.uk/datasets/3h91syskeag572hl6tvuovwv4d/frames_rgb_flow/rgb/train/P26/P26_16.tar" "$outputPath/frames_rgb_flow/rgb/train/P26" "frames_rgb_flow/rgb/train/P26/P26_16.tar"
epic_download "https://data.bris.ac.uk/datasets/3h91syskeag572hl6tvuovwv4d/frames_rgb_flow/rgb/train/P26/P26_17.tar" "$outputPath/frames_rgb_flow/rgb/train/P26" "frames_rgb_flow/rgb/train/P26/P26_17.tar"
epic_download "https://data.bris.ac.uk/datasets/3h91syskeag572hl6tvuovwv4d/frames_rgb_flow/rgb/train/P26/P26_18.tar" "$outputPath/frames_rgb_flow/rgb/train/P26" "frames_rgb_flow/rgb/train/P26/P26_18.tar"
epic_download "https://data.bris.ac.uk/datasets/3h91syskeag572hl6tvuovwv4d/frames_rgb_flow/rgb/train/P26/P26_19.tar" "$outputPath/frames_rgb_flow/rgb/train/P26" "frames_rgb_flow/rgb/train/P26/P26_19.tar"
epic_download "https://data.bris.ac.uk/datasets/3h91syskeag572hl6tvuovwv4d/frames_rgb_flow/rgb/train/P26/P26_20.tar" "$outputPath/frames_rgb_flow/rgb/train/P26" "frames_rgb_flow/rgb/train/P26/P26_20.tar"
epic_download "https://data.bris.ac.uk/datasets/3h91syskeag572hl6tvuovwv4d/frames_rgb_flow/rgb/train/P26/P26_21.tar" "$outputPath/frames_rgb_flow/rgb/train/P26" "frames_rgb_flow/rgb/train/P26/P26_21.tar"
epic_download "https://data.bris.ac.uk/datasets/3h91syskeag572hl6tvuovwv4d/frames_rgb_flow/rgb/train/P26/P26_22.tar" "$outputPath/frames_rgb_flow/rgb/train/P26" "frames_rgb_flow/rgb/train/P26/P26_22.tar"
epic_download "https://data.bris.ac.uk/datasets/3h91syskeag572hl6tvuovwv4d/frames_rgb_flow/rgb/train/P26/P26_23.tar" "$outputPath/frames_rgb_flow/rgb/train/P26" "frames_rgb_flow/rgb/train/P26/P26_23.tar"
epic_download "https://data.bris.ac.uk/datasets/3h91syskeag572hl6tvuovwv4d/frames_rgb_flow/rgb/train/P26/P26_24.tar" "$outputPath/frames_rgb_flow/rgb/train/P26" "frames_rgb_flow/rgb/train/P26/P26_24.tar"
epic_download "https://data.bris.ac.uk/datasets/3h91syskeag572hl6tvuovwv4d/frames_rgb_flow/rgb/train/P26/P26_25.tar" "$outputPath/frames_rgb_flow/rgb/train/P26" "frames_rgb_flow/rgb/train/P26/P26_25.tar"
epic_download "https://data.bris.ac.uk/datasets/3h91syskeag572hl6tvuovwv4d/frames_rgb_flow/rgb/train/P26/P26_26.tar" "$outputPath/frames_rgb_flow/rgb/train/P26" "frames_rgb_flow/rgb/train/P26/P26_26.tar"
epic_download "https://data.bris.ac.uk/datasets/3h91syskeag572hl6tvuovwv4d/frames_rgb_flow/rgb/train/P26/P26_27.tar" "$outputPath/frames_rgb_flow/rgb/train/P26" "frames_rgb_flow/rgb/train/P26/P26_27.tar"
epic_download "https://data.bris.ac.uk/datasets/3h91syskeag572hl6tvuovwv4d/frames_rgb_flow/rgb/train/P26/P26_28.tar" "$outputPath/frames_rgb_flow/rgb/train/P26" "frames_rgb_flow/rgb/train/P26/P26_28.tar"
epic_download "https://data.bris.ac.uk/datasets/3h91syskeag572hl6tvuovwv4d/frames_rgb_flow/rgb/train/P26/P26_29.tar" "$outputPath/frames_rgb_flow/rgb/train/P26" "frames_rgb_flow/rgb/train/P26/P26_29.tar"

echo -e "\n### ------------------------------------------------------- ###\n"
echo "### All done!"
echo -e "\n### ------------------------------------------------------- ###\n"
