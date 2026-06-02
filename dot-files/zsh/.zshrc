# ==========================================
# 1. ZSH / OH-MY-ZSH CORE CONFIGURATION
# ==========================================
export ZSH="/Users/sandheepgr/.oh-my-zsh"

# Basic completion & shell behavior
setopt prompt_subst
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
autoload bashcompinit && bashcompinit
autoload -Uz compinit
compinit

# Oh-My-Zsh Plugins
plugins=(git colorize dirhistory history jsontools jump zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# ==========================================
# 2. SYSTEM ENVIRONMENT & PATHS
# ==========================================
export LANG=en_US.UTF-8
export EDITOR=/opt/homebrew/bin/nvim
export HOMEBREW_NO_INSTALLED_DEPENDENTS_CHECK=1

# Consolidated PATH construction
export PATH=/opt/homebrew/bin:$PATH
export PATH=/opt/homebrew/opt/mysql@5.7/bin:$PATH
export PATH=/opt/homebrew/opt/mongodb-community@7.0/bin:$PATH
export PATH=/Users/sandheepgr/Development/programs/apache-maven-3.9.8/bin:$PATH
export PATH=/Users/sandheepgr/Development/scripts:$PATH
export PATH=/opt/homebrew/Cellar/python@3.9/3.9.9/bin:$PATH
export PATH=/opt/homebrew/opt/rabbitmq/sbin:$PATH
export PATH=/Users/sandheepgr/Development/programs/postgres/14/bin:$PATH
export PATH="/Users/sandheepgr/.local/bin:$PATH"
export PATH=/Users/sandheepgr/.opencode/bin:$PATH
# Specific Ecosystem Roots
export VAULT_PATH=/Volumes/vault

# ==========================================
# 3. TOOL INTEGRATIONS & CLOUD CONFIGS
# ==========================================

# Google Cloud SDK
if [ -f '/Users/sandheepgr/Development/programs/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/sandheepgr/Development/programs/google-cloud-sdk/path.zsh.inc'; fi
if [ -f '/Users/sandheepgr/Development/programs/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/sandheepgr/Development/programs/google-cloud-sdk/completion.zsh.inc'; fi

# Kubernetes & AWS
export KUBECONFIG=~/.kube/config
source <(kubectl completion zsh) 2>/dev/null
complete -C '/usr/local/bin/aws_completer' aws
export AWS_SHARED_CREDENTIALS_FILE="/Volumes/vault/personal/aws-cli/credentials"
export AWS_CONFIG_FILE="/Volumes/vault/personal/aws-cli/config"

# Postgres Configuration
export PGDATA='/Users/sandheepgr/Development/programs/postgres/14/data'
export PGHOST=localhost

# Nix Daemon Setup
if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
    . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
fi

# Zsh-Autosuggestions Keybindings
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null
bindkey '^w' autosuggest-execute
bindkey '^e' autosuggest-accept
bindkey '^u' autosuggest-toggle
bindkey '^L' vi-forward-word
bindkey '^k' up-line-or-search
#bindkey '^j' down-line-or-search
#
# Important: The below configuration is required for the suggestions to behave correctly in the split panes. 
# Without this, the suggestions comes to the next line and screws up when typing
# Force Zsh to recalculate prompt length properly on window changes
export ZLE_RPROMPT_INDENT=1
# VI Mode
# bindkey jj vi-cmd-mode

# FZF Configuration
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow'
export FZF_DEFAULT_OPTS="--height=50% --preview='bat --style=numbers --color=always --line-range :500 {}' --layout=reverse --info=inline --border --margin=1 --padding=1 --preview-window=right:60%:wrap:hidden --bind='F2:toggle-preview' --bind up:preview-up,down:preview-down"

# ==========================================
# 4. ALIASES & SHELL FUNCTIONS
# ==========================================

# Navigation & Core Overrides
alias cl='clear'
alias la=tree
alias cat=bat
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."

# Development / DB Controls
alias python='python3'
alias pip='pip3'
alias v="/Users/sandheepgr/.nix-profile/bin/nvim"
alias start-pg='pg_ctl -l $PGDATA/server.log start'
alias stop-pg='pg_ctl stop -m fast'
alias show-pg-status='pg_ctl status'
alias restart-pg='pg_ctl reload'
alias http="xh"

# Eza (Modern ls)
alias l="eza -l --icons --git -a"
alias lt="eza --tree --level=2 --long --icons --git"
alias ltree="eza --tree --level=2 --icons --git"

# Git Aliases
alias gc="git commit -m"
alias gca="git commit -a -m"
alias gp="git push origin HEAD"
alias gpu="git pull origin"
alias gst="git status"
alias glog="git log --graph --topo-order --pretty='%w(100,0,6)%C(yellow)%h%C(bold)%C(black)%d %C(cyan)%ar %C(green)%an%n%C(bold)%C(white)%s %N' --abbrev-commit"
alias gdiff="git diff"
alias gco="git checkout"
alias gb='git branch'
alias gba='git branch -a'
alias gadd='git add'
alias ga='git add -p'
alias gcoall='git checkout -- .'
alias gr='git remote'
alias gre='git reset'
alias gcx="git checkout \$(git branch -a | sed -E 's/remotes\/([a-zA-Z-]*\/)//' | grep -v '\*|HEAD' | sort | uniq | fzf --select-1)"

# Docker Aliases
alias dco="docker compose"
alias dps="docker ps"
alias dpa="docker ps -a"
alias dl="docker ps -l -q"
alias dx="docker exec -it"

# Kubernetes Aliases
alias k="kubectl"
alias ka="kubectl apply -f"
alias kg="kubectl get"
alias kd="kubectl describe"
alias kdel="kubectl delete"
alias kl="kubectl logs"
alias kgpo="kubectl get pod"
alias kgd="kubectl get deployments"
alias kc="kubectx"
alias kns="kubens"
alias kl="kubectl logs -f"
alias ke="kubectl exec -it"
alias kcns='kubectl config set-context --current --namespace'
alias podname=''

# Fuzzy Utilities / Tools
alias jl='jump'
alias gop='cd $(find /Users/sandheepgr/Development/projects -type d -maxdepth 2 | fzf)'
alias mat='osascript -e "tell application \"System Events\" to key code 126 using {command down}" && tmux neww "cmatrix"'

# Security Aliases
alias server='python -m http.server 4445'
alias tunnel='ngrok http 4445'

# Interactive Shell Functions
function ranger {
    local IFS=$'\t\n'
    local tempfile="$(mktemp -t tmp.XXXXXX)"
    local ranger_cmd=( command ranger --cmd="map Q chain shell echo %d > "$tempfile"; quitall" )
    ${ranger_cmd[@]} "$@"
    if [[ -f "$tempfile" ]] && [[ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]]; then
        cd -- "$(cat "$tempfile")" || return
    fi
    command rm -f -- "$tempfile" 2>/dev/null
}
alias rr='ranger'

cx() { cd "$@" && l; }
fcd() { cd "$(find . -type d -not -path '*/.*' | fzf)" && l; }
f() { echo "$(find . -type f -not -path '*/.*' | fzf)" | pbcopy; }
fv() { nvim "$(find . -type f -not -path '*/.*' | fzf)"; }

# ==========================================
# 5. INITIALIZATIONS & PROMPT THEMES
# ==========================================

# 1. Zoxide (Smart cd)
eval "$(zoxide init zsh)"

# 2. Direnv (Environment switcher)
eval "$(direnv hook zsh)"

# 3. Atuin (Shell history) - Load this before Starshipear
eval "$(atuin init zsh)"


# 5. SDKMAN init (Keep at the absolute end of the file)
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# 4. Starship Prompt - MUST be initialized absolute last among prompt/hook tools
export STARSHIP_CONFIG=~/.config/starship.toml

# Force Vim Mode first
bindkey -v

# Safely prevent Starship from creating an infinite keymap loop
# Without this, we will get the following error when trying do vim mode in prompt
# starship_zle-keymap-select-wrapped:1: maximum nested function level reached; increase FUNCNEST?
if [[ "${widgets[zle-keymap-select]#user:}" == "starship_zle-keymap-select" || \
      "${widgets[zle-keymap-select]#user:}" == "starship_zle-keymap-select-wrapped" ]]; then
    zle -N zle-keymap-select ""
fi

# Initialize Starship safely
eval "$(starship init zsh)"

