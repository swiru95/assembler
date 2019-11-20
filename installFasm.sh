#!/bin/bash
echo "Hello!"
echo "The Flat Assebler module will be installed."
echo "Firstly, the package from https://flatassembler.net/ will be downloaded."
echo ""
wget https://flatassembler.net/fasm-1.73.18.tgz
echo "Next the package is moved to the /opt/ and unpacked."
echo ""
mv fasm-1.73.18.tgz /opt/
tar /opt/fasm-1.73.18.tgz
echo "Now the PATH variable is setting with fasm."
echo $PATH
PATH=/opt/fasm:$PATH
echo $PATH
echo
rm /opt/fasm-1.73.18.tgz
echo "Installation has finished. Restart console and type fasm!"
exit
