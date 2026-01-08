# prompt
if which starship 2>&1 >/dev/null; then
    eval "$(starship init zsh)"
else
    function _prompt_python_venv() {
        if [[ -n "${VIRTUAL_ENV}" ]]; then
            echo " with %F{yellow} $(basename "${VIRTUAL_ENV}")%f"
        fi
    }

    setopt prompt_subst
    PROMPT=$'\n%F{cyan}%B %~%b%f$(_prompt_python_venv)\n%B%# %(?.%F{green}.%F{red})❯%f%b '
    RPROMPT=$'%(?.%s.%F{red}✖ %B%?%f%b )at %F{yellow}%B%*%f%b'
fi

# source antidote
if which brew 2>&1 >/dev/null; then
    source $(brew --prefix)/opt/antidote/share/antidote/antidote.zsh
elif [ -d "${HOME}/.antidote" ]; then
    source "${HOME}/.antidote/antidote.zsh"
fi

# configure plugins pre-load
export NVM_NO_USE=true
export VIRTUAL_ENV_DISABLE_PROMPT=1

# initialize plugins statically with ${ZDOTDIR:-~}/.zsh_plugins.txt
export ANTIDOTE_HOME="${HOME}/.cache/antidote"
antidote load

# History
HISTFILE=$HOME/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

setopt APPEND_HISTORY          # don't overwrite history file
setopt INC_APPEND_HISTORY      # write history as you run commands
setopt SHARE_HISTORY           # share history across terminals/sessions
setopt HIST_IGNORE_DUPS        # ignore duplicate entries
setopt HIST_REDUCE_BLANKS      # remove superfluous blanks
setopt EXTENDED_HISTORY        # add timestamps to history entries (useful)

# interactive completions
zstyle ':completion:*' menu select interactive

# delete by words
WORDCHARS='_-.'

# highlight styles
zle_highlight=(region:standout special:standout suffix:bold isearch:underline paste:none)

# interactive history search
HISTORY_SUBSTRING_SEARCH_ENSURE_UNIQUE=1
HISTORY_SUBSTRING_SEARCH_FUZZY=1
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND=(underline bold)

case $(uname -s) in
    Linux)
        bindkey "${terminfo[kcuu1]}" history-substring-search-up
        bindkey "${terminfo[kcud1]}" history-substring-search-down
        ;;
    Darwin)
        bindkey "^[[A" history-substring-search-up
        bindkey "^[[B" history-substring-search-down
        ;;
esac

# add ~/.dotfiles/bin
export PATH="${HOME}/.dotfiles/bin:$PATH"

# aliases
alias ls='ls --color=auto'
alias ll='ls -lh'
alias vi='nvim'
alias tx='tmux new -As work'
