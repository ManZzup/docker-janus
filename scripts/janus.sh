#!/usr/bin/env bash

# create a self signed cert for the server
# mkdir -p $DEPS_HOME/certs/
# openssl req \
#   -new \
#   -newkey rsa:4096 \
#   -days 365 \
#   -nodes \
#   -x509 \
#   -subj "/C=AU/ST=NSW/L=Sydney/O=JanusDemo/CN=janus.test.com" \
#   -keyout $DEPS_HOME/certs/janus.key \
#   -out $DEPS_HOME/certs/janus.pem

# wget https://github.com/meetecho/janus-gateway/archive/$JANUS_RELEASE.tar.gz -O  $DEPS_HOME/dl/janus.tar.gz
# cd $DEPS_HOME/dl
# tar xf janus.tar.gz

# libnice
# apt-get -y remove libnice 
# git clone https://gitlab.freedesktop.org/libnice/libnice
# cd libnice
# ./autogen.sh >> /dev/null
# ./configure --prefix=/usr 
# make && make install >> /dev/null

# # libsrtp >= 1.5
# wget https://github.com/cisco/libsrtp/archive/v1.5.4.tar.gz
# tar xfv v1.5.4.tar.gz
# cd libsrtp-1.5.4
# ./configure --prefix=/usr --enable-openssl
# make shared_library && make install >> /dev/null

# # usrsctp
# git clone https://github.com/sctplab/usrsctp
# cd usrsctp
# ./bootstrap >> /dev/null
# ./configure --prefix=/usr && make && make install >> /dev/null

# git clone https://github.com/warmcat/libwebsockets.git
# cd libwebsockets
# mkdir build
# cd build
# # See https://github.com/meetecho/janus-gateway/issues/732 re: LWS_MAX_SMP
# cmake -DLWS_MAX_SMP=1 -DCMAKE_INSTALL_PREFIX:PATH=/usr -DCMAKE_C_FLAGS="-fpic" ..
# make && make install >> /dev/null

# cd $DEPS_HOME/dl
git clone https://github.com/meetecho/janus-gateway
cd janus-gateway
git checkout "${JANUS_RELEASE}"

./autogen.sh

./configure --prefix=$DEPS_HOME --disable-rabbitmq --disable-docs
make
make install
make configs

