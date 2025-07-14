set -g -x fish_greeting ''
set -U fish_prompt_pwd_dir_length 0
set fish_color_valid_path

alias lz="eza --sort=size -l"
alias ls="eza -la"
alias ll="eza -l"
alias la="eza"
# alias ls="exit"

alias nvd="neovide"
alias tmux="tmux -2"

set -x EDITOR "nvim"
set -x VISUAL "nvim"
set -x XBPS_DISTDIR "$HOME/.void-packages"

export PAGER=nvimpager
export MANPAGER=nvimpager

# fix weird java issues
set -x _JAVA_AWT_WM_NONREPARENTING 1
set -x AWT_TOOLKIT "MToolkit"

# please dark mode
set -Ux GTK_THEME Adwaita:dark

fish_add_path /home/netfri/.cargo/bin
fish_add_path /home/netfri/.local/bin

zoxide init fish | source

set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME ; set -gx PATH $HOME/.cabal/bin $PATH $HOME/.ghcup/bin # ghcup-env
