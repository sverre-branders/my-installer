#! /bin/bash

# add user to audio group
sudo usermod -a -G audio $USER
echo "Please log out for user to be added to audio group"

sudo apt install git jackd2 qjackctl zlib1g-dev gcc g++ ghc cabal-install

sudo apt install supercollider sc3-{plugins,plugins-language,plugins-server}

SuperDirtVersion=$(git ls-remote https://github.com/musikinformatik/SuperDirt.git | grep tags | tail -n1 | awk -F/ '{print $NF}')

echo "Found SuperDirt version $SuperDirtVersion"

cabal update; cabal install tidal --lib

echo "To install SuperDirt in SupperCollider run the following command in 'sclang':\nQuarks.checkForUpdates({Quarks.install(\"SuperDirt\", \"$SuperDirtVersion\"); thisProcess.recompile()})"
