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

epic_download "https://data.bris.ac.uk/datasets/3h91syskeag572hl6tvuovwv4d/object_detection_images/test/P28/P28_15.tar" "$outputPath/object_detection_images/test/P28" "object_detection_images/test/P28/P28_15.tar"
epic_download "https://data.bris.ac.uk/datasets/3h91syskeag572hl6tvuovwv4d/object_detection_images/test/P28/P28_16.tar" "$outputPath/object_detection_images/test/P28" "object_detection_images/test/P28/P28_16.tar"
epic_download "https://data.bris.ac.uk/datasets/3h91syskeag572hl6tvuovwv4d/object_detection_images/test/P28/P28_17.tar" "$outputPath/object_detection_images/test/P28" "object_detection_images/test/P28/P28_17.tar"
epic_download "https://data.bris.ac.uk/datasets/3h91syskeag572hl6tvuovwv4d/object_detection_images/test/P28/P28_18.tar" "$outputPath/object_detection_images/test/P28" "object_detection_images/test/P28/P28_18.tar"
epic_download "https://data.bris.ac.uk/datasets/3h91syskeag572hl6tvuovwv4d/object_detection_images/test/P28/P28_19.tar" "$outputPath/object_detection_images/test/P28" "object_detection_images/test/P28/P28_19.tar"
epic_download "https://data.bris.ac.uk/datasets/3h91syskeag572hl6tvuovwv4d/object_detection_images/test/P28/P28_20.tar" "$outputPath/object_detection_images/test/P28" "object_detection_images/test/P28/P28_20.tar"
epic_download "https://data.bris.ac.uk/datasets/3h91syskeag572hl6tvuovwv4d/object_detection_images/test/P28/P28_21.tar" "$outputPath/object_detection_images/test/P28" "object_detection_images/test/P28/P28_21.tar"
epic_download "https://data.bris.ac.uk/datasets/3h91syskeag572hl6tvuovwv4d/object_detection_images/test/P28/P28_22.tar" "$outputPath/object_detection_images/test/P28" "object_detection_images/test/P28/P28_22.tar"
epic_download "https://data.bris.ac.uk/datasets/3h91syskeag572hl6tvuovwv4d/object_detection_images/test/P28/P28_23.tar" "$outputPath/object_detection_images/test/P28" "object_detection_images/test/P28/P28_23.tar"
epic_download "https://data.bris.ac.uk/datasets/3h91syskeag572hl6tvuovwv4d/object_detection_images/test/P28/P28_24.tar" "$outputPath/object_detection_images/test/P28" "object_detection_images/test/P28/P28_24.tar"
epic_download "https://data.bris.ac.uk/datasets/3h91syskeag572hl6tvuovwv4d/object_detection_images/test/P28/P28_25.tar" "$outputPath/object_detection_images/test/P28" "object_detection_images/test/P28/P28_25.tar"
epic_download "https://data.bris.ac.uk/datasets/3h91syskeag572hl6tvuovwv4d/object_detection_images/test/P28/P28_26.tar" "$outputPath/object_detection_images/test/P28" "object_detection_images/test/P28/P28_26.tar"

echo -e "\n### ------------------------------------------------------- ###\n"
echo "### All done!"
echo -e "\n### ------------------------------------------------------- ###\n"
