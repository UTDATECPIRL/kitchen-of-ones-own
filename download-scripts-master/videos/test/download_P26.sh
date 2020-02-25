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

epic_download "https://data.bris.ac.uk/datasets/3h91syskeag572hl6tvuovwv4d/videos/test/P26/P26_30.MP4" "$outputPath/videos/test/P26" "videos/test/P26/P26_30.MP4"
epic_download "https://data.bris.ac.uk/datasets/3h91syskeag572hl6tvuovwv4d/videos/test/P26/P26_31.MP4" "$outputPath/videos/test/P26" "videos/test/P26/P26_31.MP4"
epic_download "https://data.bris.ac.uk/datasets/3h91syskeag572hl6tvuovwv4d/videos/test/P26/P26_32.MP4" "$outputPath/videos/test/P26" "videos/test/P26/P26_32.MP4"
epic_download "https://data.bris.ac.uk/datasets/3h91syskeag572hl6tvuovwv4d/videos/test/P26/P26_33.MP4" "$outputPath/videos/test/P26" "videos/test/P26/P26_33.MP4"
epic_download "https://data.bris.ac.uk/datasets/3h91syskeag572hl6tvuovwv4d/videos/test/P26/P26_34.MP4" "$outputPath/videos/test/P26" "videos/test/P26/P26_34.MP4"
epic_download "https://data.bris.ac.uk/datasets/3h91syskeag572hl6tvuovwv4d/videos/test/P26/P26_35.MP4" "$outputPath/videos/test/P26" "videos/test/P26/P26_35.MP4"
epic_download "https://data.bris.ac.uk/datasets/3h91syskeag572hl6tvuovwv4d/videos/test/P26/P26_36.MP4" "$outputPath/videos/test/P26" "videos/test/P26/P26_36.MP4"
epic_download "https://data.bris.ac.uk/datasets/3h91syskeag572hl6tvuovwv4d/videos/test/P26/P26_37.MP4" "$outputPath/videos/test/P26" "videos/test/P26/P26_37.MP4"
epic_download "https://data.bris.ac.uk/datasets/3h91syskeag572hl6tvuovwv4d/videos/test/P26/P26_38.MP4" "$outputPath/videos/test/P26" "videos/test/P26/P26_38.MP4"
epic_download "https://data.bris.ac.uk/datasets/3h91syskeag572hl6tvuovwv4d/videos/test/P26/P26_39.MP4" "$outputPath/videos/test/P26" "videos/test/P26/P26_39.MP4"
epic_download "https://data.bris.ac.uk/datasets/3h91syskeag572hl6tvuovwv4d/videos/test/P26/P26_40.MP4" "$outputPath/videos/test/P26" "videos/test/P26/P26_40.MP4"
epic_download "https://data.bris.ac.uk/datasets/3h91syskeag572hl6tvuovwv4d/videos/test/P26/P26_41.MP4" "$outputPath/videos/test/P26" "videos/test/P26/P26_41.MP4"

echo -e "\n### ------------------------------------------------------- ###\n"
echo "### All done!"
echo -e "\n### ------------------------------------------------------- ###\n"
