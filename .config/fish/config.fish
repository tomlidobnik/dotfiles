if status is-interactive
    clear
end

function fish_greeting; end

function f
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
	yazi $argv --cwd-file="$tmp"
	if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
		builtin cd -- "$cwd"
	end
	rm -f -- "$tmp"
end

function lt;
    eza --tree --color=always --icons=always --level=$argv
end

function a
    set max_depth 5
    set current_depth 0
    set dir (pwd)

    while test $current_depth -lt $max_depth
        if test -d "$dir/venv"
            source "$dir/venv/bin/activate.fish"
            return 0
        end
        set dir (dirname $dir)
        set current_depth (math $current_depth + 1)
    end

    echo "venv folder not found within $max_depth levels."
    return 1
end

function gitzip
    git ls-files | zip archive.zip -@
end

alias c=clear
alias g=fg
alias v=nvim
alias vv="nvim ."
alias ic="cd ~/Library/Mobile Documents/com~apple~CloudDocs"
alias cc="clear & cd"
alias l="eza --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions --group-directories-first"
alias ll="eza --color=always --long --git --icons=always --no-user --group-directories-first"
alias la="eza -a --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions --group-directories-first"
alias ff="fastfetch"
alias p=pgcli
alias t="tmux attach"
alias d="deactivate"
alias venv="python3 -m venv venv"
alias cd="z"
alias gi="git init && aig"
alias gs="git status"
alias aig="cp ~/.config/.gitignore-template ./.gitignore"
alias u="uv run"


function ga
    git add -A
    git commit -m "auto"
end

# Created by `pipx` on 2024-11-25 11:43:56
set PATH $PATH /Users/tom/.local/bin
# Cargo path
set PATH $HOME/.cargo/bin $PATH

eval "$(/opt/homebrew/bin/brew shellenv)"
zoxide init fish | source
atuin init fish --disable-up-arrow | source
export EDITOR="nvim"

# uv
fish_add_path "/Users/tomiko/.local/bin"

starship init fish | source
