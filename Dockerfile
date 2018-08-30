FROM golang:1.11.0

RUN go get -u github.com/alecthomas/gometalinter \
  && cd $GOPATH/src/github.com/alecthomas/gometalinter \
  && git checkout bfcc1d6942136fd86eb6f1a6fb328de8398fbd80 \
  && go install \
  && gometalinter --install
