git clone https://gitlab.freedesktop.org/libnice/libnice
cd libnice
./autogen.sh
./configure --prefix=/usr
make && make install