wget https://go.dev/dl/go1.25.4.linux-amd64.tar.gz
tar -xzf go1.25.4.linux-amd64.tar.gz

git clone https://go.googlesource.com/go goroot
cd goroot

git checkout go1.25
export GOROOT_BOOTSTRAP=/p/home/mayhl/temp_build/go

./make.bash

cp ../bin/* $HOME/.local/bin
