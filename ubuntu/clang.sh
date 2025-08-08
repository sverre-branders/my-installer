#!/usr/bin/env bash

DRY_RUN=true

install_clang ()
{
    if $DRY_RUN; then
        echo -e "DRY RUN:\tsudo apt update"
    else
        sudo apt update
    fi

    local packages=("clang" "clang-tidy" "clang-format")
    for package in "${packages[@]}"; do
        apt-cache show "$package" > /dev/null 2>&1 || {
            echo "Package '$package' not available!"
            exit 1
        }
    done

    for package in "${packages[@]}"; do
        if $DRY_RUN; then
            echo -e "DRY RUN:\tsudo apt install -y $package"
        else
            sudo apt install -y "$package"
        fi
    done
}

install_clang

