FROM golang:1.9

MAINTAINER otiai10 <otiai10@gmail.com>

RUN apt-get -qq update
RUN apt-get install -y libleptonica-dev libtesseract-dev tesseract-ocr

# Load languages
RUN apt-get install -y -qq \
  tesseract-ocr-eng \
  tesseract-ocr-deu \
  tesseract-ocr-fra \
  tesseract-ocr-ita \
  tesseract-ocr-jpn

ADD . $GOPATH/src/github.com/Dan-M/ocrserver
WORKDIR $GOPATH/src/github.com/Dan-M/ocrserver
RUN go get ./...
RUN go get -t github.com/Dan-M/gosseract
RUN go test -v github.com/Dan-M/gosseract

CMD $GOPATH/bin/ocrserver
