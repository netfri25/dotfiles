set -g -x fish_greeting ''
set -U fish_prompt_pwd_dir_length 0
set fish_color_valid_path

alias lz="eza --sort=size -l"
alias ls="eza -la"
alias ll="eza -l"
alias la="eza"
# alias ls="exit"

# alias mingw-gcc="/usr/bin/x86_64-w64-mingw32-gcc"
# alias mingw-g++="/usr/bin/x86_64-w64-mingw32-g++"

alias nvd="neovide"
alias tmux="tmux -2"

set -x EDITOR "nvim"
set -x VISUAL "nvim"
set -x XBPS_DISTDIR "$HOME/.void-packages"

export MANPAGER="nvim +Man!"

# fix weird java issues
set -x _JAVA_AWT_WM_NONREPARENTING 1
set -x AWT_TOOLKIT "MToolkit"

# please dark mode
set -Ux GTK_THEME Adwaita:dark

set -Ux DOTNET_ROOT /opt/dotnet

fish_add_path /home/netfri/.cargo/bin
fish_add_path /home/netfri/.local/bin
fish_add_path /home/netfri/go/bin
fish_add_path /opt/nvim/bin
fish_add_path /opt/helix/bin
fish_add_path /opt/koka/bin
fish_add_path /opt/dotnet

zoxide init fish | source

set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME ; set -gx PATH $HOME/.cabal/bin $PATH /home/netfri/.ghcup/bin # ghcup-env

# Onyx config
export ONYX_PATH="/home/netfri/.onyx"
export PATH="$ONYX_PATH/bin:$PATH"
