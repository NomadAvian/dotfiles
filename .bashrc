# ~/.bashrc: executed by bash(1) for non-login shells.

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth
shopt -s histappend
HISTSIZE=10000
HISTFILESIZE=20000

# check window size after each command
shopt -s checkwinsize

# useful extras
shopt -s autocd      # type a dir name to cd into it
shopt -s globstar    # ** recursive glob
shopt -s cdspell     # autocorrect minor cd typos

[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# color prompt
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

PROMPT_COMMAND='PS1_GIT_BRANCH=$(git branch --show-current 2>/dev/null)'

if [ "$color_prompt" = yes ]; then
    PS1='\[\e[38;5;111m\](${PWD##*/})\[\e[0m\]$( [ -n "$PS1_GIT_BRANCH" ] && printf " :: \[\e[90m\]git\[\e[0m\] (\[\e[97m\]%s\[\e[0m\])" "$PS1_GIT_BRANCH" )\n    > '
else
    PS1='(${PWD##*/})$( [ -n "$PS1_GIT_BRANCH" ] && printf " :: git (%s)" "$PS1_GIT_BRANCH" )\n    > '
fi
unset color_prompt

# ls/grep color + aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

[ -f ~/.bash_aliases ] && . ~/.bash_aliases

# programmable completion (Fedora path)
if ! shopt -oq posix; then
    [ -f /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion
fi

# fall back to running ./cmd if not found on PATH
command_not_found_handle() {
    local cmd="$1"
    shift
    if [[ -x "./$cmd" ]]; then
        "./$cmd" "$@"
        return $?
    else
        echo "bash: $cmd: command not found" >&2
        return 127
    fi
}

export PATH="$PATH:/opt/nvim/bin/"
export EDITOR='nvim'
export VISUAL='nvim'

command -v zoxide &>/dev/null && eval "$(zoxide init bash)"

# --- fzf ---
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border --preview "bat --style=numbers --color=always {} 2>/dev/null || cat {}" --preview-window=right:60%'

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# fuzzy-find a file, open in nvim
f() {
    local file
    file=$(fzf --preview 'bat {}' --preview-window=right:60%) && nvim "$file"
}

# fuzzy cd into any subdirectory
cdf() {
    local dir
    dir=$(fd --type d --hidden --exclude .git . "${1:-.}" | fzf --preview 'tree -C {} | head -50') && cd "$dir"
}
# --- /fzf ---

# aliases
alias ls='eza --icons -1'
alias ll='eza -la --icons'


cat << 'EOF'

 \    / _  _  _| _  _ _  _
  \/\/ (_|| |(_|(/_| (/_| 
                                              
EOF
