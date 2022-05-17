FROM --platform=linux/amd64 ubuntu:20.04

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y autoconf gettext libtool make

ADD . /repo
WORKDIR /repo
ENV LD_LIBRARY_PATH=/repo/.libs/
RUN ldconfig
RUN ./autogen.sh
RUN ./configure
RUN make -j8
