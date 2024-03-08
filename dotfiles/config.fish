if status is-interactive
    # Commands to run in interactive sessions can go here
end

fish_add_path "/opt/homebrew/bin"

fish_add_path "/Applications/WezTerm.app/Contents/MacOS"

# fish_add_path ~/miniconda/bin
fish_add_path ~/miniforge3/bin

fish_add_path ~/gameportingtoolkit

fish_add_path /Applications/Postgres.app/Contents/Versions/15/bin

fish_add_path ~/.local/bin

set -Ux SHELL "/opt/homebrew/bin/fish"

# pnpm
set -gx PNPM_HOME "/Users/mateh/Library/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

alias pn="pnpm"

alias vim="nvim"

alias gp="sgpt"

function qr
    if test (count $argv) -eq 1
        qrencode -o - -t UTF8 $argv[1]
    else
        echo "Usage: qr <url>"
    end
end

# CalcMySky
fish_add_path ~/github/sky-model/build/install/CalcMySky/bin

fish_add_path /opt/homebrew/Cellar/qt/6.5.0/bin

set -gx DYLD_LIBRARY_PATH $DYLD_LIBRARY_PATH ~/github/sky-model/build/install/CalcMySky/lib/

# bass source "/Applications/Houdini/Houdini19.5.569/Frameworks/Houdini.framework/Versions/Current/Resources/houdini_setup"

# tabtab source for packages
# uninstall by removing these lines
[ -f ~/.config/tabtab/fish/__tabtab.fish ]; and . ~/.config/tabtab/fish/__tabtab.fish; or true

set -Ux fish_tmux_autostart false

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /Users/mateh/miniforge3/bin/conda
    eval /Users/mateh/miniforge3/bin/conda "shell.fish" "hook" $argv | source
end
# <<< conda initialize <<<

fish_add_path /opt/homebrew/share/android-commandlinetools/emulator
# set -gx ANDROID_SDK_ROOT /opt/homebrew/share/android-commandlinetools

fish_add_path /opt/homebrew/opt/postgresql@16/bin

alias ds "docker ps -a --format 'table {{.ID}}\t{{.Status}}\t{{.Names}}\t{{.Ports}}'"

alias ssh-crypticorn "~/github/crypticorn-ai/trading-platform/apps/cdk/scripts/connect-main.sh"

alias ssh-crypticorn-sg "ssh -i ~/github/crypticorn-ai/trading-platform/apps/cdk/scripts/crypticorn-admin-sg.pem ubuntu@sg.crypticorn.dev"

mise activate fish | source
