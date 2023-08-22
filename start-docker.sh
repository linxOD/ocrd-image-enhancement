# bin/bash

docker run --user $(id -u) --workdir /data --volume $PWD:/data --rm -it ocrd/all:maximum bash