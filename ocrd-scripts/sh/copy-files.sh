# bin/bash

INPUT_DIR=/home/daniel/Documents/tesseract-ocr/1277174a/1704
IMG_EXT=jpg

mkdir IMG
mkdir PAGE
for i in `find $INPUT_DIR -name "*.$IMG_EXT"`; do base=`basename $i .$IMG_EXT`; echo $base; cp $i IMG/${base}.$IMG_EXT; cp /$INPUT_DIR/page/${base}.xml PAGE/${base}.xml; done

cd PAGE/
for i in `find .`; do echo $i; sed -i 's/imageFilename="/imageFilename="IMG\//' $i; done