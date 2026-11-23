# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Neovim
alias vim="nvim"

# Clojure repl alias
alias nrepl="clojure -Sdeps '{:deps {nrepl {:mvn/version \"1.3.0\"} cider/cider-nrepl {:mvn/version \"0.25.2\"}}}' -m nrepl.cmdline --middleware '[\"cider.nrepl/cider-middleware\"]'"

# Rbenv
# eval "(rbenv init -)"

# Flutter setup
# change print working directory hook
chpwd() {
  export PATH="$ORIGINAL_PATH"
  
  if [ -d ".fvm/flutter_sdk" ] && [[ "$PWD" != "$HOME" ]]; then
    export PATH="$PWD/.fvm/flutter_sdk/bin:$PATH"
  else
	export PATH="$HOME/development/flutter/bin:$PATH"
  fi
}

# Spill specific jdk
export PATH="$PATH:/Users/rafael.ferreira/Library/Android/sdk/platform-tools"
export JAVA_HOME="/opt/homebrew/opt/openjdk@17/libexec/openjdk.jdk/Contents/Home"
export PATH="$JAVA_HOME/bin:$PATH"

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Starting zsh-autosuggestion installed view homebrew
source $HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=11'

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.


# Starting starship
eval "$(starship init zsh)"

[ -f "/Users/rafael.ferreira/.ghcup/env" ] && . "/Users/rafael.ferreira/.ghcup/env" # ghcup-env

# nvm installation
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

## [Completion]
## Completion scripts setup. Remove the following line to uninstall
[[ -f /Users/rafael.ferreira/.dart-cli-completion/zsh-config.zsh ]] && . /Users/rafael.ferreira/.dart-cli-completion/zsh-config.zsh || true
## [/Completion]



export PATH="$HOME/.local/bin:$PATH"
export PATH="/Users/rafael.ferreira/fvm/versions/3.41.0/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export ORIGINAL_PATH="$PATH"
