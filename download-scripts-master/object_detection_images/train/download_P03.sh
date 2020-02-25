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

epic_download "https://data.bris.ac.uk/datasets/3h91syskeag572hl6tvuovwv4d/object_detection_images/train/P03/P03_02.tar" "$outputPath/object_detection_images/train/P03" "object_detection_images/train/P03/P03_02.tar"
epic_download "https://data.bris.ac.uk/datasets/3h91syskeag572hl6tvuovwv4d/object_detection_images/train/P03/P03_03.tar" "$outputPath/object_detection_images/train/P03" "object_detection_images/train/P03/P03_03.tar"
epic_download "https://data.bris.ac.uk/datasets/3h91syskeag572hl6tvuovwv4d/object_detection_images/train/P03/P03_04.tar" "$outputPath/object_detection_images/train/P03" "object_detection_images/train/P03/P03_04.tar"
epic_download "https://data.bris.ac.uk/datasets/3h91syskeag572hl6tvuovwv4d/object_detection_images/train/P03/P03_05.tar" "$outputPath/object_detection_images/train/P03" "object_detection_images/train/P03/P03_05.tar"
epic_download "https://data.bris.ac.uk/datasets/3h91syskeag572hl6tvuovwv4d/object_detection_images/train/P03/P03_06.tar" "$outputPath/object_detection_images/train/P03" "object_detection_images/train/P03/P03_06.tar"
epic_download "https://data.bris.ac.uk/datasets/3h91syskeag572hl6tvuovwv4d/object_detection_images/train/P03/P03_07.tar" "$outputPath/object_detection_images/train/P03" "object_detection_images/train/P03/P03_07.tar"
epic_download "https://data.bris.ac.uk/datasets/3h91syskeag572hl6tvuovwv4d/object_detection_images/train/P03/P03_08.tar" "$outputPath/object_detection_images/train/P03" "object_detection_images/train/P03/P03_08.tar"
epic_download "https://data.bris.ac.uk/datasets/3h91syskeag572hl6tvuovwv4d/object_detection_images/train/P03/P03_09.tar" "$outputPath/object_detection_images/train/P03" "object_detection_images/train/P03/P03_09.tar"
epic_download "https://data.bris.ac.uk/datasets/3h91syskeag572hl6tvuovwv4d/object_detection_images/train/P03/P03_10.tar" "$outputPath/object_detection_images/train/P03" "object_detection_images/train/P03/P03_10.tar"
epic_download "https://data.bris.ac.uk/datasets/3h91syskeag572hl6tvuovwv4d/object_detection_images/train/P03/P03_11.tar" "$outputPath/object_detection_images/train/P03" "object_detection_images/train/P03/P03_11.tar"
epic_download "https://data.bris.ac.uk/datasets/3h91syskeag572hl6tvuovwv4d/object_detection_images/train/P03/P03_12.tar" "$outputPath/object_detection_images/train/P03" "object_detection_images/train/P03/P03_12.tar"
epic_download "https://data.bris.ac.uk/datasets/3h91syskeag572hl6tvuovwv4d/object_detection_images/train/P03/P03_13.tar" "$outputPath/object_detection_images/train/P03" "object_detection_images/train/P03/P03_13.tar"
epic_download "https://data.bris.ac.uk/datasets/3h91syskeag572hl6tvuovwv4d/object_detection_images/train/P03/P03_14.tar" "$outputPath/object_detection_images/train/P03" "object_detection_images/train/P03/P03_14.tar"
epic_download "https://data.bris.ac.uk/datasets/3h91syskeag572hl6tvuovwv4d/object_detection_images/train/P03/P03_15.tar" "$outputPath/object_detection_images/train/P03" "object_detection_images/train/P03/P03_15.tar"
epic_download "https://data.bris.ac.uk/datasets/3h91syskeag572hl6tvuovwv4d/object_detection_images/train/P03/P03_16.tar" "$outputPath/object_detection_images/train/P03" "object_detection_images/train/P03/P03_16.tar"
epic_download "https://data.bris.ac.uk/datasets/3h91syskeag572hl6tvuovwv4d/object_detection_images/train/P03/P03_17.tar" "$outputPath/object_detection_images/train/P03" "object_detection_images/train/P03/P03_17.tar"
epic_download "https://data.bris.ac.uk/datasets/3h91syskeag572hl6tvuovwv4d/object_detection_images/train/P03/P03_18.tar" "$outputPath/object_detection_images/train/P03" "object_detection_images/train/P03/P03_18.tar"
epic_download "https://data.bris.ac.uk/datasets/3h91syskeag572hl6tvuovwv4d/object_detection_images/train/P03/P03_19.tar" "$outputPath/object_detection_images/train/P03" "object_detection_images/train/P03/P03_19.tar"
epic_download "https://data.bris.ac.uk/datasets/3h91syskeag572hl6tvuovwv4d/object_detection_images/train/P03/P03_20.tar" "$outputPath/object_detection_images/train/P03" "object_detection_images/train/P03/P03_20.tar"
epic_download "https://data.bris.ac.uk/datasets/3h91syskeag572hl6tvuovwv4d/object_detection_images/train/P03/P03_27.tar" "$outputPath/object_detection_images/train/P03" "object_detection_images/train/P03/P03_27.tar"
epic_download "https://data.bris.ac.uk/datasets/3h91syskeag572hl6tvuovwv4d/object_detection_images/train/P03/P03_28.tar" "$outputPath/object_detection_images/train/P03" "object_detection_images/train/P03/P03_28.tar"

echo -e "\n### ------------------------------------------------------- ###\n"
echo "### All done!"
echo -e "\n### ------------------------------------------------------- ###\n"
