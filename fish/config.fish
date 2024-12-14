if status is-interactive
    # Commands to run in interactive sessions can go here
end
function fish_greeting; end
alias config="cd ~/.config/"
alias c=clear
alias g=lazygit
alias v=nvim
alias ic="cd /Users/tom/Library/Mobile Documents/com~apple~CloudDoc"
zoxide init fish | source
alias cd=z
alias cc="clear & cd"
alias fc="vi ~/.config/fish/config.fish"
alias l="eza --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions"
alias la="eza -a --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions"
alias f="yazi"
alias zz="zellij"
alias zl="zellij list-sessions"
alias za="zellij attach"
alias zc="zellij --session"
# Created by `pipx` on 2024-11-25 11:43:56
set PATH $PATH /Users/tom/.local/bin
# Cargo path
set PATH $HOME/.cargo/bin $PATH
