#! /bin/bash

DRY_RUN=1

install_java_version ()
{
    JAVA_VERSION=$1
    PACKAGE_NAME="openjdk-$JAVA_VERSION-jre-zero"

    if [ "$DRY_RUN" -eq 1 ]; then
        echo -e "DRY RUN:\tsudo apt update"
    else
        sudo apt update
    fi

    AVAILABLE_JRE=$(apt-cache search openjdk | grep "$PACKAGE_NAME")

    if [ -n "$AVAILABLE_JRE" ]; then
        echo "Installing $PACKAGE_NAME"
        # uninstall current
        if [ "$DRY_RUN" -eq 1 ]; then
            echo -e "DRY RUN:\tsudo apt remove --purge -y openjdk-*"
        else
            sudo apt remove --purge -y openjdk-*
        fi

        if [ "$DRY_RUN" -eq 1 ]; then
            echo -e "DRY RUN:\tsudo apt install -y $PACKAGE_NAME"
        else
            sudo apt install -y "$PACKAGE_NAME"
        fi


    else
        echo "$PACKAGE_NAME could not be found in the apt repository"
        return 1
    fi
}

install_java_version 17

