# starship prompt
if which starship 2>&1 >/dev/null; then
    eval "$(starship init zsh)"
else
    PROMPT=$'\n%F{cyan}%B %~%b%f\n%B%# %(?.%F{green}.%F{red})❯%f%b '
    RPROMPT='%(?.%s.%F{red}✖ %B%?%f%b )at %F{yellow}%B%*%f%b'
fi

# source antidote
if which brew 2>&1 >/dev/null; then
    source $(brew --prefix)/opt/antidote/share/antidote/antidote.zsh
elif [ -D "~/.antidote" ]; then
    source ~/.antidote/antidote.zsh
fi

# configure plugins pre-load
export NVM_NO_USE=true

# initialize plugins statically with ${ZDOTDIR:-~}/.zsh_plugins.txt
export ANTIDOTE_HOME="${HOME}/.cache/antidote"
antidote load

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
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# aliases
alias ls='ls --color=auto'
alias ll='ls -lh'
alias vi='nvim'
alias tx='tmux new -As work'

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
