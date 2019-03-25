FROM golang:1.11.6

ENV DEP_VERSION=v0.5.0
ENV GOLANGCI_LINT_VERSION=v1.11.3
ENV PACKR2_VERSION=v2.0.8

RUN curl -sSL \
    -o /usr/local/bin/dep \
    https://github.com/golang/dep/releases/download/$DEP_VERSION/dep-linux-amd64 \
  && chmod 755 /usr/local/bin/dep \
  && curl -sfL \
    https://install.goreleaser.com/github.com/golangci/golangci-lint.sh | sh \
    -s -- -b $GOPATH/bin $GOLANGCI_LINT_VERSION \
  && go get -u github.com/gobuffalo/packr/v2/packr2 \
  && cd $GOPATH/src/github.com/gobuffalo/packr/v2/packr2 \
  && git checkout $PACKR2_VERSION \
  && go install
