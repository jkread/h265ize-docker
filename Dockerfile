FROM node:7-alpine
MAINTAINER John Read

LABEL h265ize_version="bleading edge" architecture="amd64"

RUN apk add --no-cache --update-cache git ffmpeg && \
    apk add --no-cache --update-cache sudo && \
    npm install jkread/h265ize --global --no-optional && \
    apk add --no-cache bash && apk del git && \
    mkdir /input && mkdir /output && mkdir /temp && mkdir /h265ize && \
    rm /var/cache/apk/* && \
    adduser -D -g '' -s /bin/sh h265 && \
    echo '%wheel ALL=(ALL) NOPASSWD:ALL' > /etc/sudoers.d/wheel && \
    adduser h265 wheel

COPY run.sh /h265ize/run.sh
    
ENV INPUT="/input" \
    OUTPUT="/output" \
    TEMP="/temp" \
    # Quality (choose either QP or CRF) 0-51 (higher number = lower quality/smaller file)
    QP="" \
    CRF="" \
    # Preset Options: ultrafast, superfast, veryfast, faster, fast, medium, slow, slower, veryslow, placebo
    PRESET="" \
    # Overide: Allows conversion of videos that are already encoded by the hevc codec
    OVERIDE="false" \
    # Deletes source after encoding is complete and replaces it with new encode; STRONGLY NOT RECOMMENDED
    DELETE="false" \
    # Amount of time to wait after finishing the queue
    SLEEP=900 \
    # Preset Options: anime-high, anime-medium, ssim
    ASPRESET="" \
    TUNE="" \
    SCALE="" \
    REF="" \
    BITDEPTH="" \
    WEIGHTB="false" \
    BFRAMES="" \
    EXTRA="" \
    DEBUG=false \
    STATSFREQUENCY=15 \
    PREVIEW="false" \
    REPLACE="false" \
    DIFFLIMIT=""

VOLUME ["/input"]
WORKDIR /h265ize
RUN sudo chown -R h265:h265 /h265ize /input /output /temp && \
    sudo chmod 777 /h265ize /input /output /temp
USER h265

ENTRYPOINT [ "/h265ize/run.sh" ]
