# Clone and compile to wordcode missing plugins.
function zcompile-many() {
  local f
  for f; do zcompile -R -- "$f".zwc "$f"; done
}

if [[ ! -e ~/zsh-plugins/zsh-syntax-highlighting ]]; then
  git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git ~/zsh-plugins/zsh-syntax-highlighting
  zcompile-many ~/zsh-plugins/zsh-syntax-highlighting/{zsh-syntax-highlighting.zsh,highlighters/*/*.zsh}
fi
if [[ ! -e ~/zsh-plugins/zsh-autosuggestions ]]; then
  git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions.git ~/zsh-plugins/zsh-autosuggestions
  zcompile-many ~/zsh-plugins/zsh-autosuggestions/{zsh-autosuggestions.zsh,src/**/*.zsh}
fi
if [[ ! -e ~/zsh-plugins/powerlevel10k ]]; then
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/zsh-plugins/powerlevel10k
  make -C ~/zsh-plugins/powerlevel10k pkg
fi

# Activate Powerlevel10k Instant Prompt.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Enable the "new" completion system (compsys).
autoload -Uz compinit && compinit
[[ ~/.zcompdump.zwc -nt ~/.zcompdump ]] || zcompile-many ~/.zcompdump
unfunction zcompile-many

ZSH_AUTOSUGGEST_MANUAL_REBIND=1

# Load plugins.
source ~/zsh-plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/zsh-plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/zsh-plugins/powerlevel10k/powerlevel10k.zsh-theme
source ~/zsh-plugins/.p10k.zsh

# python venv
python_venv() {
  MYVENV=./.venv
  # when you cd into a folder that contains $MYVENV
  [[ -d $MYVENV ]] && source $MYVENV/bin/activate > /dev/null 2>&1
  # when you cd into a folder that doesn't
  [[ ! -d $MYVENV ]] && deactivate > /dev/null 2>&1
}
add-zsh-hook chpwd python_venv

python_venv

# python aliases
alias python=python3
alias pip=pip3
alias createvenv="python3 -m venv .venv"
alias startvenv="source .venv/bin/activate"
alias stopvenv="deactivate"

# Git aliases
alias dtf="git --git-dir=$HOME/.dotfiles --work-tree=$HOME"

# Kitty
alias icat="kitten icat"

# Squeezelite
alias squeezelite='/Applications/Squeezelite.app/Contents/MacOS/squeezelite'
alias sqzlt='/Users/marcdavid/scripts/squeezelite_monitor.sh'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/zsh-plugins/.p10k.zsh

export GPG_TTY=\$(tty)
export HOMEBREW_NO_ANALYTICS=1

source <(kubectl completion zsh)

eval "$(mise activate zsh)"
