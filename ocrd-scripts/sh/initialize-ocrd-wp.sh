# bin/bash

IMG_EXT=jpg

ocrd workspace init .
for i in `find IMG -name "*.$IMG_EXT"`; do base=`basename $i .$IMG_EXT`; ocrd workspace add $i -G IMG -i IMG_${base} -g $base -m 'image/tiff'; done
for i in `find PAGE -name "*.xml"`; do base=`basename $i .xml`; ocrd workspace add $i -G PAGE -i PAGE_${base} -g $base -m 'application/vnd.prima.page+xml'; done