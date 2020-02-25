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

epic_download "https://data.bris.ac.uk/datasets/3h91syskeag572hl6tvuovwv4d/videos/train/P03/P03_02.MP4" "$outputPath/videos/train/P03" "videos/train/P03/P03_02.MP4"
epic_download "https://data.bris.ac.uk/datasets/3h91syskeag572hl6tvuovwv4d/videos/train/P03/P03_03.MP4" "$outputPath/videos/train/P03" "videos/train/P03/P03_03.MP4"
epic_download "https://data.bris.ac.uk/datasets/3h91syskeag572hl6tvuovwv4d/videos/train/P03/P03_04.MP4" "$outputPath/videos/train/P03" "videos/train/P03/P03_04.MP4"
epic_download "https://data.bris.ac.uk/datasets/3h91syskeag572hl6tvuovwv4d/videos/train/P03/P03_05.MP4" "$outputPath/videos/train/P03" "videos/train/P03/P03_05.MP4"
epic_download "https://data.bris.ac.uk/datasets/3h91syskeag572hl6tvuovwv4d/videos/train/P03/P03_06.MP4" "$outputPath/videos/train/P03" "videos/train/P03/P03_06.MP4"
epic_download "https://data.bris.ac.uk/datasets/3h91syskeag572hl6tvuovwv4d/videos/train/P03/P03_07.MP4" "$outputPath/videos/train/P03" "videos/train/P03/P03_07.MP4"
epic_download "https://data.bris.ac.uk/datasets/3h91syskeag572hl6tvuovwv4d/videos/train/P03/P03_08.MP4" "$outputPath/videos/train/P03" "videos/train/P03/P03_08.MP4"
epic_download "https://data.bris.ac.uk/datasets/3h91syskeag572hl6tvuovwv4d/videos/train/P03/P03_09.MP4" "$outputPath/videos/train/P03" "videos/train/P03/P03_09.MP4"
epic_download "https://data.bris.ac.uk/datasets/3h91syskeag572hl6tvuovwv4d/videos/train/P03/P03_10.MP4" "$outputPath/videos/train/P03" "videos/train/P03/P03_10.MP4"
epic_download "https://data.bris.ac.uk/datasets/3h91syskeag572hl6tvuovwv4d/videos/train/P03/P03_11.MP4" "$outputPath/videos/train/P03" "videos/train/P03/P03_11.MP4"
epic_download "https://data.bris.ac.uk/datasets/3h91syskeag572hl6tvuovwv4d/videos/train/P03/P03_12.MP4" "$outputPath/videos/train/P03" "videos/train/P03/P03_12.MP4"
epic_download "https://data.bris.ac.uk/datasets/3h91syskeag572hl6tvuovwv4d/videos/train/P03/P03_13.MP4" "$outputPath/videos/train/P03" "videos/train/P03/P03_13.MP4"
epic_download "https://data.bris.ac.uk/datasets/3h91syskeag572hl6tvuovwv4d/videos/train/P03/P03_14.MP4" "$outputPath/videos/train/P03" "videos/train/P03/P03_14.MP4"
epic_download "https://data.bris.ac.uk/datasets/3h91syskeag572hl6tvuovwv4d/videos/train/P03/P03_15.MP4" "$outputPath/videos/train/P03" "videos/train/P03/P03_15.MP4"
epic_download "https://data.bris.ac.uk/datasets/3h91syskeag572hl6tvuovwv4d/videos/train/P03/P03_16.MP4" "$outputPath/videos/train/P03" "videos/train/P03/P03_16.MP4"
epic_download "https://data.bris.ac.uk/datasets/3h91syskeag572hl6tvuovwv4d/videos/train/P03/P03_17.MP4" "$outputPath/videos/train/P03" "videos/train/P03/P03_17.MP4"
epic_download "https://data.bris.ac.uk/datasets/3h91syskeag572hl6tvuovwv4d/videos/train/P03/P03_18.MP4" "$outputPath/videos/train/P03" "videos/train/P03/P03_18.MP4"
epic_download "https://data.bris.ac.uk/datasets/3h91syskeag572hl6tvuovwv4d/videos/train/P03/P03_19.MP4" "$outputPath/videos/train/P03" "videos/train/P03/P03_19.MP4"
epic_download "https://data.bris.ac.uk/datasets/3h91syskeag572hl6tvuovwv4d/videos/train/P03/P03_20.MP4" "$outputPath/videos/train/P03" "videos/train/P03/P03_20.MP4"
epic_download "https://data.bris.ac.uk/datasets/3h91syskeag572hl6tvuovwv4d/videos/train/P03/P03_27.MP4" "$outputPath/videos/train/P03" "videos/train/P03/P03_27.MP4"
epic_download "https://data.bris.ac.uk/datasets/3h91syskeag572hl6tvuovwv4d/videos/train/P03/P03_28.MP4" "$outputPath/videos/train/P03" "videos/train/P03/P03_28.MP4"

echo -e "\n### ------------------------------------------------------- ###\n"
echo "### All done!"
echo -e "\n### ------------------------------------------------------- ###\n"
