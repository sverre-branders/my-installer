#! /bin/bash

# add user to audio group
sudo usermod -a -G audio $USER

sudo apt install git jackd2 qjackctl zlib1g-dev gcc g++ ghc cabal-install

sudo apt install supercollider sc3-{plugins,plugins-language,plugins-server}

SuperDirtVersion=$(git ls-remote https://github.com/musikinformatik/SuperDirt.git | grep tags | tail -n1 | awk -F/ '{print $NF}')

echo "Found SuperDirt version $SuperDirtVersion"

sclang <<EOF
Quarks.checkForUpdates({Quarks.install("SuperDirt", "$SuperDirtVersion"); thisProcess.recompile()})
EOF

