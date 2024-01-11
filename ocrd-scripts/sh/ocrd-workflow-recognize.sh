# bin/bash

INPUT=./IMG/*.tif
INPUT2=./PAGE/*.xml

# This script is used to start a workflow in the workflow engine.
ocrd workspace init .
ocrd workspace bulk-add -r '(?P<src>.*?)/(?P<fileid>.*)\.(?P<ext>[^.]*)' \
    -G '{{ src }}' \
    -i '{{ src }}_{{ fileid }}' \
    -m 'image/tiff' \
    -g '{{ fileid }}' \
    -S '{{ src }}/{{ fileid }}.{{ ext }}' \
    $INPUT
ocrd workspace bulk-add -r '(?P<src>.*?)/(?P<fileid>.*)\.(?P<ext>[^.]*)' \
    -G '{{ src }}' \
    -i '{{ src }}_{{ fileid }}' \
    -m 'application/vnd.prima.page+xml' \
    -g '{{ fileid }}' \
    -S '{{ src }}/{{ fileid }}.{{ ext }}' \
    $INPUT2
ocrd process \
    "cis-ocropy-binarize -I PAGE -O OCR-D-BIN -P dpi 300 -P threshold 0.0 -P level-of-operation page" \
    "cis-ocropy-denoise -I OCR-D-BIN -O OCR-D-BIN-DEN -P level-of-operation page -P dpi 300 -P noise_maxsize 4" \
    "anybaseocr-crop -I OCR-D-BIN-DEN -O OCR-D-BIN-DEN-CROP" \
    "tesserocr-recognize -I OCR-D-BIN-DEN-CROP -O OCR-D-OCR -P dpi 300 -P textequiv_level word -P overwrite_segments true -P model deu_apa_179 -P oem LSTM_ONLY"
