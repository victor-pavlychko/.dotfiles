#!/bin/sh

shopt -s dotglob nullglob

function install_root_module() {
    for f in ${1}/*; do
        case "$(basename "$f")" in
            .|..|.DS_Store|Thumbs.db|*.swp|*.tmp)
            continue
            ;;
        esac

        echo "Symlinking $f"

	if [ -f "$f" ]; then
            ln -sf "$(realpath "$f")" "${HOME}/$(basename "$f")"
        fi
    done
}

function install_config_module() {
    mkdir -p "${HOME}/.config"

    echo "Symlinking $1"
    ln -sf "$(realpath $1)" "${HOME}/.config/$1"
}

install_root_module zsh
install_root_module tmux
install_config_module nvim

