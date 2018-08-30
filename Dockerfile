FROM golang:1.11.0

RUN go get -u github.com/alecthomas/gometalinter \
  && cd $GOPATH/src/github.com/alecthomas/gometalinter \
  && git checkout v2.0.7 \
  && go install \
  && gometalinter --install
