# Amazon Q blocks
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh"

# Enable Powerlevel10k instant prompt
source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"

# Oh My Zsh configuration
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
source $ZSH/oh-my-zsh.sh

# Load Powerlevel10k configuration
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
source ~/powerlevel10k/powerlevel10k.zsh-theme

# Plugin initialization
eval "$(zoxide init zsh)"
eval $(thefuck --alias)
eval $(thefuck --alias FUCK)
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Customize zsh-syntax-highlighting colors
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=yellow'

# Conda initialization
__conda_setup="$('/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup

# PATH configurations
export PATH="/usr/local/bin:$PATH"
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
export PATH="/Users/frederickjerusha/go/bin:$PATH"
export PATH=$PATH:$(go env GOPATH)/bin

# Aliases
alias ls='lsd'
alias code="'/Applications/Visual Studio Code.app/Contents/Resources/app/bin/code'"
alias ghidra='/opt/homebrew/Caskroom/ghidra/11.2.1-20241105/ghidra_11.2.1_PUBLIC/ghidraRun'

# Custom functions
nosync() {
    # If no folder is specified, "node_modules" and ".git" will be added by default.
    [[ $# -eq 0 ]] && set -- "node_modules" ".git"
    
    for arg in "$@"; do
        mkdir -p "$arg"
        xattr -w 'com.apple.fileprovider.ignore#P' 1 "$arg"
    done
}

# History configuration
HISTFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=999
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify

# Key bindings
# Completion using arrow keys (based on history)
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

# Natural text editing
bindkey "^[[1;9D" beginning-of-line          # Cmd + Left Arrow: Move to beginning of line
bindkey "^[[1;9C" end-of-line                # Cmd + Right Arrow: Move to end of line
bindkey "^[[1;3D" backward-word              # Option + Left Arrow: Move to previous word
bindkey "^[[1;3C" forward-word               # Option + Right Arrow: Move to next word
bindkey "^[[3;10~" backward-kill-word        # Option + Delete: Delete word behind cursor
bindkey "^[[3;3~" kill-word                  # Option + fn + Delete: Delete word after cursor
bindkey "^[[3;9~" kill-whole-line            # Cmd + Backspace: Delete entire line

# Amazon Q post block
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh"
