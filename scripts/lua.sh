curl -L -R -O https://www.lua.org/ftp/lua-5.1.5.tar.gz

#https://www.lua.org/ftp/lua-5.4.8.tar.gz
tar zxf lua-5.4.8.tar.gz
cd lua-5.4.8
make all test INSTALL_TOP=$HOME/.local
