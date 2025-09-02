# /usr/bin/env bash

install_brave ()
{
    curl -s https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg \
    | sudo gpg --dearmor \
    | sudo tee /usr/share/keyrings/brave-browser-archive-keyring.gpg > /dev/null

    echo deb [arch=amd64 signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] \
    https://brave-browser-apt-release.s3.brave.com/ stable main \
    | sudo tee /etc/apt/sources.list.d/brave-browser-release.list

    sudo apt update
    sudo apt install brave-browser
}

install_brave
