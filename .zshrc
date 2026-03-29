# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Set the directory where zinit will be installed/cloned to.
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download zinit if it isn't already present
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"

# Source/load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add in powerlevel10k
zinit ice depth=1; zinit light romkatv/powerlevel10k

# Plugins
# Add syntax highlighting
zinit light zsh-users/zsh-syntax-highlighting

# Add completions
zinit light zsh-users/zsh-completions
# Add fzf-tab
zinit light Aloxaf/fzf-tab

# Add auto-suggestions
zinit light zsh-users/zsh-autosuggestions

# Add snippets
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::command-not-found
zinit snippet OMZL::functions.zsh
zinit snippet OMZP::web-search

# Load completions
autoload -U compinit && compinit

zinit cdreplay -q

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Setup bindkeys
bindkey -v
bindkey -r '^L'
bindkey '^L' autosuggest-accept
bindkey -s ^f "tmux-sessionizer\n"
bindkey '^w' backward-kill-word
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward



# the better cd
eval "$(zoxide init --cmd cd zsh)"
export PATH="$HOME/.spin/bin:$PATH"

# HISTORY
HISTSIZE=10000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion style
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'

# Aliases
alias ls='ls --color'
# Shortcut for opening files in nvim with fzf and bat preview
alias inv='nvim $(find . | fzf --preview="bat --color=always {}")'
alias lsa="ls -alh"
alias lsf="lsa | fzf"
alias nv=nvim
alias lg=lazygit

# Shell integrations
eval "$(fzf --zsh)"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
