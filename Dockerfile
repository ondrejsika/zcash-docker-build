FROM debian:8

MAINTAINER Ondrej Sika <ondrej@ondrejsika.com>

RUN apt-get update --fix-missing

RUN apt-get install -y \
      build-essential pkg-config libc6-dev m4 g++-multilib \
      autoconf libtool ncurses-dev unzip git python \
      zlib1g-dev wget bsdmainutils automake

