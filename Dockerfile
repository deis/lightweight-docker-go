FROM golang:1.11.0

ENV DEP_VERSION=v0.4.1

RUN curl -sSL \
  -o /usr/local/bin/dep \
  https://github.com/golang/dep/releases/download/$DEP_VERSION/dep-linux-amd64 \
  && chmod 755 /usr/local/bin/dep \
  && go get -u github.com/alecthomas/gometalinter \
  && cd $GOPATH/src/github.com/alecthomas/gometalinter \
  && git checkout bfcc1d6942136fd86eb6f1a6fb328de8398fbd80 \
  && go install \
  && gometalinter --install
