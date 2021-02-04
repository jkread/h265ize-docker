FROM node:7-alpine
MAINTAINER John Read

LABEL h265ize_version="bleading edge" architecture="amd64"

RUN apk add --no-cache --update-cache git ffmpeg && \
    npm install FallingSnow/h265ize --global --no-optional && \
    apk del git && \
    mkdir /input && mkdir /output && \
    rm /var/cache/apk/*
    
COPY run.sh /h265ize/run.sh
    
ENV INPUT="/input" \
    OUTPUT="/ouput" \
    # Quality 0-51 (higher number = lower quality/smaller file)
    QUALITY="19" \
    # Preset Options: ultrafast, superfast, veryfast, faster, fast, medium, slow, slower, veryslow, placebo
    PRESET="medium" \
    # Overide: Allows conversion of videos that are already encoded by the hevc codec
    OVERIDE="false" \
    # Deletes source after encoding is complete and replaces it with new encode; STRONGLY NOT RECOMMENDED
    DELETE="false"

VOLUME ["/input", "/output"]
WORKDIR /h265ize

ENTRYPOINT [ "/h265ize/run.sh" ]
