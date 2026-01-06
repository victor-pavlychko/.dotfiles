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

install_root_module zsh
install_root_module tmux

