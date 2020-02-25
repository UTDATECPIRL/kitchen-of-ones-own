This repository contains bash scripts that use __wget__ to download different parts of the dataset

The repository replicates the folder structure of the dataset

There is one download script for each folder of each level of the directory tree

By running one script, you will download all the content of the folders contained below that node in the directory tree

For example:

- ```download_videos.sh``` will dowload __all__ the videos in one go.
- ```videos/test/download_P01.sh``` will download only __test__ videos from subject __P01__
- ```frames_rgb_flow/flow/download_train.sh``` will download all the __flow__ images contained in the __train__ set

To run one script, simply invoke it in any shell where ```wget``` is available

The scripts take a single optional parameter, to specify a desired output path

If you do not specify any parameter, the scripts will assume the output path is```~/Download```

A folder named __EPIC_KITCHENS_2018__ will be created at the output path as the main dataset folder

The scripts will reconstruct the dataset structure as they are executed, so if you run for example

```sh videos/test/download_P16.sh ~/Desktop```

the script will create the following folder structure

```~/Desktop/EPIC_KITCHENS_2018/videos/test/P16```

and will save P16's test videos to the above path

If you will run the script again later using the same output path, already downloaded files will be skipped

You can interrupt any script at any time and resume the download afterwards

Partially downloaded files will be kept and resumed by wget in order to allow you to download big files in multiple goes

_Note: These scripts will work for Linux and Mac. For Windows users a bash installation should work_
