source /Users/ji1/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle heroku
antigen bundle pip
antigen bundle lein
antigen bundle command-not-found

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
antigen theme dieter

# Tell Antigen that you're done.
antigen apply

export LSCOLORS=DxFxCxDxBxegedabagaced

alias cat='bat --paging=never'

