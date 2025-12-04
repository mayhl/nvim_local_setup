wget https://luarocks.org/releases/luarocks-3.12.2.tar.gz
tar zxpf luarocks-3.12.2.tar.gz
cd luarocks-3.12.2
./configure --with-lua=$HOME/.local -prefix=$HOME/.local}

make && make install
sudo luarocks install luasocket
lua
