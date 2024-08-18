# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
	source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Add Zinit plugin manager #
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"
############################

####### PLUGINS #########
#### PowerLevel10K ######
zinit ice depth=1; zinit light romkatv/powerlevel10k
## Syntax Highlighting ##
zinit light zdharma-continuum/fast-syntax-highlighting
## Autocompletitions   ##
zinit light zsh-users/zsh-completions
##  Auto suggestions   ##
zinit light zsh-users/zsh-autosuggestions
##       fzf tab       ##
zinit light Aloxaf/fzf-tab
#########################

##### Add Snippets #####
zinit snippet OMZP::git
zinit snippet OMZP::sudo

# autoload
autoload -U compinit  && compinit
zinit cdreplay -q

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


## bindings
bindkey '^f' autosuggest-accept

# History
HISTSIZE=5000
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

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
## Aliases
alias ls='lsd -l'
alias ll='lsd -la'

# Shell Integrations
eval "$(fzf --zsh)"

# Created by `pipx` on 2024-08-18 13:50:33
export PATH="$PATH:/home/ch1p/.local/bin"
