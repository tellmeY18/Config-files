neofetch

HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=1000
setopt autocd extendedglob
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/me/.zshrc'

autoload -Uz compinit
compinit


alias paadmonu="ytfzf -ml"
alias gimme="sudo pacman -S"
alias ls='lsd'
alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'
alias ip='ip -c'
alias x='ranger'
alias b='btop'
alias ootub='ytfzf -t -f'
autoload -Uz compinit && compinit
alias odra='chmod +x'
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

fcd() {
        cd "$(find -type d |fzf)"
}

open() {
        xdg-open "$(find -type f | fzf)"
}

alias pathpara="find -type f | fzf) | sed 's/^..//'| tr -d '\n'| xclip -selection c "

eval $(thefuck --alias)

# Luke's config for the Zoomer Shell

#Enabling blur
if [[ $(ps --no-header -p $PPID -o comm) =~ '^yakuake|konsole$' ]]; then
        for wid in $(xdotool search --pid $PPID); do
            xprop -f _KDE_NET_WM_BLUR_BEHIND_REGION 32c -set _KDE_NET_WM_BLUR_BEHIND_REGION 0 -id $wid; done
fi

# Enable colors and change prompt:
autoload -U colors && colors
PS1="%B%{$fg[green]%}%Th%b %B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

# History in cache directory:

# Flush history after every command. This will save any command regardless of which terminal is closed last
#export PROMPT_COMMAND='history -a'

# Git autocomplete
zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
fpath=(~/.zsh $fpath)


# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist

# Enable typing + [Up-Arrow] or [Down-Arror] = fuzzy find history forward or backward
if [[ "${terminfo[kcuu1]}" != "" ]]; then
    autoload -U up-line-or-beginning-search
    zle -N up-line-or-beginning-search
    bindkey "${terminfo[kcuu1]}" up-line-or-beginning-search
fi
if [[ "${terminfo[kcud1]}" != "" ]]; then
    autoload -U down-line-or-beginning-search
    zle -N down-line-or-beginning-search
    bindkey "${terminfo[kcud1]}" down-line-or-beginning-search
fi

#Enables autosuggestions
source ~/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

#Loading alias file
ALIASFILE=~/.zsh/alias/.alias
source $ALIASFILE
#ssh hosts file
HOSTFILE=~/.zsh/ssh/.hosts
source $HOSTFILE
function add_alias() {
    if [[ -z $1 || -z $2 || $# -gt 2 ]]; then
        echo usage:
        echo "\t\$$0 ll 'ls -l'"
    else
        echo "alias $1='$2'" >> $ALIASFILE
        echo "alias ADDED to $ALIASFILE"
    fi
}


# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# Load zsh-syntax-highlighting; should be after all other plugins but before the terminal calculator.
source ~/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
ZSH_HIGHLIGHT_PATTERNS=('rm -rf *' 'fg=white,bold,bg=red') # To have commands starting with `rm -rf` in red:

# BEGIN SNIPPET: Magento Cloud CLI configuration
HOME=${HOME:-'/home/victor'}
export PATH="$HOME/"'.magento-cloud/bin':"$PATH"
if [ -f "$HOME/"'.magento-cloud/shell-config.rc' ]; then . "$HOME/"'.magento-cloud/shell-config.rc'; fi # END SNIPPET
eval `dircolors /home/victor/.dir_colors/dircolors`


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export PATH=$PATH:/snap/bin
export PATH=$PATH:/sbin
#export PATH="$HOME/.rbenv/bin:$PATH"
#eval "$(rbenv init -)"
#export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"



autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down

bindkey "^[[3~" delete-char
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey '^[[3;5~' kill-word
bindkey '^?' backward-kill-word


export ALPHAVANTAGE_API_KEY=VWP0F94E48E66VW2

unsetopt beep
