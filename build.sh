#!/bin/bash
set -e

IMAGETAG=zcash-build
REVISION=${1:-master}

docker build -t $IMAGETAG .
docker run -t -v $(pwd)/output:/output $IMAGETAG /bin/sh -c "\
    git clone https://github.com/zcash/zcash.git && \
    cd zcash/ && \
    git checkout $REVISION && \
    ./zcutil/build.sh -j$(nproc) && \
    cp ./src/zcashd /output && \
    cp ./src/zcash-cli /output
"

