# OCRD image enhancement workflow

Workflow for creating training data for Tesseract-OCR Engine. The workflow is based on the [OCR-D](https://ocr-d.github.io/) framework.
It uses the docker based installation method via [ocrd_all](https://ocr-d.de/en/setup#installation-1).

## USAGE

* update and run `ocrd-scripts/sh/copy-files.sh` with the correct path to the input data.
* start the docker container with `./start-docker.sh`
* update and run `ocrd-scripts/sh/initialize-ocrd-wp.sh` with the correct file extentsion.
* run `ocrd-scripts/sh/start.ocrd.sh` to start the workflow to create the training dataset.

## WORKFLOW

Sart the following workflow:

* image binarization (wolf) `ocrd-scripts/sh/ocrd-binarize.sh`
* image denoising `ocrd-scripts/sh/ocrd-denoise.sh`
* image line segmentation `ocrd-scripts/sh/ocrd-lines.sh`

## DATA STRUCTURE (INPUT)

── PATH-TO-YOUR-IMG-DATA<br>
   └── tif/jpg/png<br>
── PATH-TO-YOUR-PAGE-DATA<br>
   └── xml

## DATA STRUCTURE (OUTPUT)

── IMG<br>
   └── tif/jpg/png<br>
── PAGE<br>
   └── xml<br>
── WOLF<br>
   └── png<br>
   └── xml<br>
── DENOISE<br>
   └── png<br>
   └── xml<br>
── LINES<br>
   └── gt.txt<br>
   └── bin.png<br>
   └── json<br>
   └── xslx<br>
mets.xml<br>
ocrd.log

## REFERENCES

* [OCR-D](https://ocr-d.github.io/)
* [GERMAN KONZILPROTOKOLLE](https://github.com/tesseract-ocr/tesstrain/wiki/German-Konzilsprotokolle)

## LICENSE
[MIT](LICENSE)