FROM golang:1.8-alpine3.6

MAINTAINER Ernese Norelus <ernesen@icloud.com>

ARG VCS_REF
ARG BUILD_DATE

# Metadata
LABEL org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.vcs-url="https://github.com/ernesen/croc-hunter" \
      org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.docker.dockerfile="/Dockerfile"

COPY . /go/src/github.com/ernesen/croc-hunter
COPY static/ static/

ENV GIT_SHA $VCS_REF
ENV GOPATH /go
RUN cd $GOPATH/src/github.com/ernesen/croc-hunter && go install -v .

CMD ["croc-hunter"]

EXPOSE 8080
	
