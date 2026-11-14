#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

cd $SCRIPT_DIR

shopt -s dotglob nullglob

# Symlinks a single file to a destination directory in the home folder.
function link_directory_as_whole() {
    source=$1
    destination=$2

    mkdir -p "${HOME}/${destination}"

    source_file="$(realpath "${source}")"
    destination_file="${HOME}/${destination}/$(basename "${source}")"

    echo "Symlinking ${destination_file} -> ${source_file}"
    ln -sfn "${source_file}" "${destination_file}"
}

# Symlinks all items in a directory, to a destination directory in the home folder.
function link_directory_contents() {
    source=$1
    destination=$2

    mkdir -p "${HOME}/${destination}"

    for f in "${source}"/*; do
        case "$(basename "$f")" in
            .|..|.DS_Store|Thumbs.db|*.swp|*.tmp)
            continue
            ;;
        esac

        source_file="$(realpath "${f}")"
        destination_file="${HOME}/${destination}/$(basename "${f}")"

        echo "Symlinking ${destination_file} -> ${source_file}"
        ln -sfn "${source_file}" "${destination_file}"
    done
}

# Deletes all symlinks in a destination directory pointing to dotfiles
function unlink_directory_contents() {
    destination=$1

    for f in "${HOME}/${destination}"/*; do
        if [[ -L "$f" && "$(readlink "$f")" == "$(realpath .)"* ]]; then
            echo "Removing symlink $f"
            rm "$f"
        fi
    done
}

# need to install software: zsh, tmux, nvim, git

link_directory_contents zsh .
link_directory_contents tmux .
link_directory_as_whole nvim .config

unlink_directory_contents .claude

if [[ "$(uname -s)" == "Darwin" ]]; then
    link_directory_contents vscode "Library/Application Support/Code/User"
fi
