if status is-interactive
    # Commands to run in interactive sessions can go here
end

# pnpm
set -gx PNPM_HOME "/home/mrrevillod/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
    set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

alias ls="lsd"
alias la="lsd -a"

alias ll="lsd -l"
alias lla="lsd -la"

alias UCT="cd ~/Documents/UCT/"
alias uct="cd ~/Documents/UCT/"
alias vi="nvim"
alias vim="nvim"
alias out="sudo systemctl restart gdm"
alias pixels="pixels-cli"

# starship init fish | source
set -g fish_greeting

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH


# Created by `pipx` on 2024-04-12 23:25:14
set PATH $PATH /home/mrrevillod/.local/bin
