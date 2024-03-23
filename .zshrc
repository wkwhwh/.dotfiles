function zcompile-many() {
  local f
  for f; do zcompile -R -- "$f".zwc "$f"; done
}

# Clone and compile to wordcode missing plugins.
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

# Node Version Manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# nvmrc
autoload -U add-zsh-hook
load-nvmrc() {
    local node_version="$(nvm version)"
        local nvmrc_path="$(nvm_find_nvmrc)"

        if [ -n "$nvmrc_path" ]; then
            local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

                if [ "$nvmrc_node_version" = "N/A" ]; then
                    nvm install
                        elif [ "$nvmrc_node_version" != "$node_version" ]; then
                        nvm use --silent
                        fi
                        elif [ "$node_version" != "$(nvm version default)" ]; then
                        nvm use --silent default
                        fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc


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

# sesh aliases
alias T='sesh connect $(fd -d 2 -t d -E .Trash . ~/Code | fzf)'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/zsh-plugins/.p10k.zsh

export GPG_TTY=\$(tty)
export HOMEBREW_NO_ANALYTICS=1


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/marcdavid/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/marcdavid/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/marcdavid/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/marcdavid/google-cloud-sdk/completion.zsh.inc'; fi

