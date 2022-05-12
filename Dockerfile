# Build Stage
FROM --platform=linux/amd64 ubuntu:20.04 as builder

## Install build dependencies.
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y vim less man wget tar git gzip unzip make cmake software-properties-common curl
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y autoconf
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y gettext
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y libtool

ADD . /repo
WORKDIR /repo
ENV LD_LIBRARY_PATH=/repo/.libs/
RUN ldconfig
RUN ./autogen.sh
RUN ./configure
RUN make -j8
