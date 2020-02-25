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

epic_download "https://data.bris.ac.uk/datasets/3h91syskeag572hl6tvuovwv4d/object_detection_images/test/P26/P26_30.tar" "$outputPath/object_detection_images/test/P26" "object_detection_images/test/P26/P26_30.tar"
epic_download "https://data.bris.ac.uk/datasets/3h91syskeag572hl6tvuovwv4d/object_detection_images/test/P26/P26_31.tar" "$outputPath/object_detection_images/test/P26" "object_detection_images/test/P26/P26_31.tar"
epic_download "https://data.bris.ac.uk/datasets/3h91syskeag572hl6tvuovwv4d/object_detection_images/test/P26/P26_32.tar" "$outputPath/object_detection_images/test/P26" "object_detection_images/test/P26/P26_32.tar"
epic_download "https://data.bris.ac.uk/datasets/3h91syskeag572hl6tvuovwv4d/object_detection_images/test/P26/P26_33.tar" "$outputPath/object_detection_images/test/P26" "object_detection_images/test/P26/P26_33.tar"
epic_download "https://data.bris.ac.uk/datasets/3h91syskeag572hl6tvuovwv4d/object_detection_images/test/P26/P26_34.tar" "$outputPath/object_detection_images/test/P26" "object_detection_images/test/P26/P26_34.tar"
epic_download "https://data.bris.ac.uk/datasets/3h91syskeag572hl6tvuovwv4d/object_detection_images/test/P26/P26_35.tar" "$outputPath/object_detection_images/test/P26" "object_detection_images/test/P26/P26_35.tar"
epic_download "https://data.bris.ac.uk/datasets/3h91syskeag572hl6tvuovwv4d/object_detection_images/test/P26/P26_36.tar" "$outputPath/object_detection_images/test/P26" "object_detection_images/test/P26/P26_36.tar"
epic_download "https://data.bris.ac.uk/datasets/3h91syskeag572hl6tvuovwv4d/object_detection_images/test/P26/P26_37.tar" "$outputPath/object_detection_images/test/P26" "object_detection_images/test/P26/P26_37.tar"
epic_download "https://data.bris.ac.uk/datasets/3h91syskeag572hl6tvuovwv4d/object_detection_images/test/P26/P26_38.tar" "$outputPath/object_detection_images/test/P26" "object_detection_images/test/P26/P26_38.tar"
epic_download "https://data.bris.ac.uk/datasets/3h91syskeag572hl6tvuovwv4d/object_detection_images/test/P26/P26_39.tar" "$outputPath/object_detection_images/test/P26" "object_detection_images/test/P26/P26_39.tar"
epic_download "https://data.bris.ac.uk/datasets/3h91syskeag572hl6tvuovwv4d/object_detection_images/test/P26/P26_40.tar" "$outputPath/object_detection_images/test/P26" "object_detection_images/test/P26/P26_40.tar"
epic_download "https://data.bris.ac.uk/datasets/3h91syskeag572hl6tvuovwv4d/object_detection_images/test/P26/P26_41.tar" "$outputPath/object_detection_images/test/P26" "object_detection_images/test/P26/P26_41.tar"

echo -e "\n### ------------------------------------------------------- ###\n"
echo "### All done!"
echo -e "\n### ------------------------------------------------------- ###\n"
