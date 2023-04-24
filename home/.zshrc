# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export PATH="$PATH:/home/peska/.local/share/bob/nvim-bin"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    zsh-autosuggestions
    autoupdate
    autojump
)

source $ZSH/oh-my-zsh.sh

# User configuration

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

source "$CARGO_HOME/env"
source "/home/peska/.local/share/ghcup/env" # ghcup-env

alias ls='ls --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias printer="systemctl start cups.service"
alias rm="trash"
alias vim="nvim"
alias pwninit='pwninit --template-path ~/.config/pwninit-template.py --template-bin-name e'

alias cyberchef='xdg-open /usr/share/webapps/cyberchef/index.html'

alias python="python3"
alias pluto="julia -e \"import Pluto; Pluto.run()\""

alias morning="wol f0:79:59:8e:46:2f"

alias csync="calcurse-caldav"

### PWN ###
alias disable_slr="setarch $(uname -m) -R $SHELL"
alias pwninit="pwninit --template-path ~/.config/pwninit/template.py"

[[ -s /home/peska/.autojump/etc/profile.d/autojump.sh ]] && source /home/peska/.autojump/etc/profile.d/autojump.sh
autoload -U compinit && compinit -u

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

