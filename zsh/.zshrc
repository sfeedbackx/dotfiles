# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"


export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
export GTK_THEME="Adapta-Nokto"
#export GTK_THEME="AdwaitaDark"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# Note: Since you're using starship, ZSH_THEME should be empty
ZSH_THEME=""

# Uncomment one of the following lines to change the auto-update behavior
#zstyle ':omz:update' mode auto      # update automatically without asking

# Uncomment the following line to change how often to auto-update (in days).
#zstyle ':omz:update' frequency 7

# Uncomment the following line to enable command auto-correction.
#ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Performance: disable marking untracked files under VCS as dirty for large repos
#DISABLE_UNTRACKED_FILES_DIRTY="true"

# History settings
HIST_STAMPS="yyyy-mm-dd"
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_VERIFY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_SAVE_NO_DUPS

# Which plugins would you like to load?
# Note: Removed zsh-autocomplete as it can conflict with zsh-autosuggestions
# and removed fast-syntax-highlighting as it's redundant with zsh-syntax-highlighting
plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
    fzf
    npm
    node
    fast-syntax-highlighting 
    zsh-autocomplete
)

source $ZSH/oh-my-zsh.sh

# User configuration
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='vim'
else
    export EDITOR='nvim'
fi

# Personal aliases
alias vim="nvim"
alias zshconfig="nvim ~/.zshrc"
alias ohmyzsh="nvim ~/.oh-my-zsh"
alias ll="ls -alF"
alias la="ls -A"
alias l="ls -CF"

# PATH configuration - organized and deduplicated
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="/usr/local/bin:$PATH"



# Starship prompt (should be last)
if command -v starship >/dev/null 2>&1; then
    eval "$(starship init zsh)"
fi

# Custom functions
mcd() {
    mkdir -p "$1" && cd "$1"
}

# Extract function for various archive types
extract() {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xvjf $1    ;;
            *.tar.gz)    tar xvzf $1    ;;
            *.bz2)       bunzip2 $1     ;;
            *.rar)       unrar x $1     ;;
            *.gz)        gunzip $1      ;;
            *.tar)       tar xvf $1     ;;
            *.tbz2)      tar xvjf $1    ;;
            *.tgz)       tar xvzf $1    ;;
            *.zip)       unzip $1       ;;
            *.Z)         uncompress $1  ;;
            *.7z)        7z x $1        ;;
            *)           echo "don't know how to extract '$1'..." ;;
        esac
    else
        echo "'$1' is not a valid file!"
    fi
}
source <(fzf --zsh)
fastfetch

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
