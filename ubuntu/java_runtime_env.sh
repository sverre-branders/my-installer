#! /bin/bash

DRY_RUN=1

install_java_version ()
{
    JAVA_VERSION=$1

    if [ "$DRY_RUN" -eq 1 ]; then
        echo -e "DRY RUN:\tsudo apt update"
    else
        sudo apt update
    fi

    AVAILABLE_JRE=$(apt-cache search openjdk | grep "openjdk-$JAVA_VERSION-jre")

    if [ -n "$AVAILABLE_JRE" ]; then
        echo "Installing openjdk-$JAVA_VERSION-jre"
        # uninstall current
        if [ "$DRY_RUN" -eq 1 ]; then
            echo -e "DRY RUN:\tsudo apt remove --purge -y openjdk-*"
        else
            sudo apt remove --purge -y openjdk-*
        fi

        if [ "$DRY_RUN" -eq 1 ]; then
            echo -e "DRY RUN:\tsudo apt install -y openjdk-$JAVA_VERSION-jre"
        else
            sudo apt install -y openjdk-$JAVA_VERSION-jre
        fi


    else
        echo "Java version $JAVA_VERSION is not available in the apt repository."
    fi
}

install_java_version 17

