#! /bin/bash

tmp_dir="$HOME/.tmp/"
PREFIX="$HOME/.local"

if ! [[ ":$PATH:" == *":$PREFIX/bin:"* ]]; then
    echo "Make sure $PREFIX/bin/ exists and is in PATH"
    exit 1
fi

download_java_lsp ()
{
    tmp_dir=$1/jdtls.dl

    mkdir -p "$tmp_dir"
    cd "$tmp_dir" || { echo "Error: Failed to make directory $tmp_dir"; return 1; }

    if ! curl -L https://download.eclipse.org/jdtls/milestones/1.40.0/jdt-language-server-1.40.0-202409261450.tar.gz -O; then
        echo "Error: Failed to download the file"
        rm -r "$tmp_dir"
        return 1
    fi

    mkdir -p "$PREFIX/share/java/jdtls"
    cd "$PREFIX/share/java/jdtls" || { echo "Error: Failed to make directory $tmp_dir"; return 1; }

    if ! tar -xzf "$tmp_dir/jdt-language-server-1.40.0-202409261450.tar.gz"; then
        echo "Error: Failed to extract the tar.gz file"
        return 1
    fi

    ln -s "$PREFIX/share/java/jdtls/bin/jdtls" "$PREFIX/bin/jdtls"

    rm -r $tmp_dir
}

download_java_lsp "$tmp_dir"

