#!/bin/bash

FILE_NAME=test
GLIBC_VERSION=2.23
ARCH=amd64

sudo cp /glibc/${GLIBC_VERSION}/${ARCH}/lib/libc-${GLIBC_VERSION}.so .
sudo cp /glibc/${GLIBC_VERSION}/${ARCH}/lib/ld-${GLIBC_VERSION}.so .

sudo chmod 777 ./${FILE_NAME}
sudo chmod 777 ./libc-${GLIBC_VERSION}.so
sudo chmod 777 ./ld-${GLIBC_VERSION}.so

patchelf --replace-needed libc.so.6 ./libc-${GLIBC_VERSION}.so ./${FILE_NAME}
patchelf --set-interpreter ./ld-${GLIBC_VERSION}.so ./${FILE_NAME}
