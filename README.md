# h265ize

A [Docker](http://docker.com) image for [h265ize](https://github.com/FallingSnow/h265ize), to make it easy to convert videos to h.265. 

## Getting Started

```sh
docker run -d --init \
  --name h265ize \
  -u <UID> \
  --restart unless-stopped \
  -v </location/to/video/files/input>:/input \
  -v </location/to/video/files/output>:/output \
  jkread/h265ize
```

Replace `<UID>` with your user's ID, you can get this by running `id -u`, e.g. `-u 1002 `.

This is to make sure the container can read/write your input and output directories.

#### How does it work?

Once your container is up and running move or copy a video to your input directory and h265ize will automatically start converting it to h.265 as per your settings. It **won't** convert any files already in the input folder when the docker container is started, only **new/added** files.

A file will appear straight away in the output directory while it's **still** being converted, please wait for it to finish converting before moving it out, or else you'll have a half converted file.


## Optional Environment Variables

    INPUT - Default (/input)
    OUTPUT - Default (/output)
    QUALITY - Default (19), Quality 0-51 (higher number = lower quality/smaller file)
    PRESET - Default (medium), Preset Options: ultrafast, superfast, veryfast, faster, fast, medium, slow, slower, veryslow, placebo
    OVERIDE - Default (false), Allows conversion of videos that are already encoded by the hevc codec
    DELETE - Default (false), Deletes source after encoding is complete and replaces it with new encode; STRONGLY NOT RECOMMENDED
    SLEEP - 
    ASPRESET -

#### Paths in container

Directory where video files are you want to convert to h.265: `/input`

Directory where converted h.265 videos will be created: `/output`


##### Shell access

```sh
docker exec -it h265ize /bin/sh
```

##### Logs

```sh
docker logs -f h265ize
```
