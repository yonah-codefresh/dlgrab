FROM alpine:latest

RUN apk --update add git go curl make
#RUN curl -sSL https://storage.googleapis.com/golang/go1.4.1.linux-amd64.tar.gz | tar -C /usr/local -xz
ENV PATH /usr/local/go/bin:$PATH
ENV GOPATH /go
ENV CGO_ENABLED 0

RUN go get github.com/aidanhs/go-dockerclient github.com/docker/docker/pkg/mflag
COPY . /dlgrab/
RUN cd /dlgrab && make binary

CMD /dlgrab/bin/dlgrab
