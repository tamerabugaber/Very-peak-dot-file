if status is-interactive

     set -g fish_greeting
    # Commands to run in interactive sessions can go here

    zoxide init fish | source

    alias vim 'nvim'
    alias ll 'ls -la'
    alias la 'ls -la'


# --- Exports ---
set -x PATH $HOME/.cargo/bin $BUN_INSTALL/bin $PATH
set -x BUN_INSTALL $HOME/.bun
set -x EDITOR nvim

# --- Aliases ---
alias c 'clear'
alias l 'eza -lh --icons=auto'
alias ls 'eza -1 --icons=auto'
alias ll 'eza -lha --icons=auto --sort=name --group-directories-first'
alias ld 'eza -lhD --icons=auto'
alias lt 'eza --icons=auto --tree'

alias un '$aurhelper -Rns'
alias up '$aurhelper -Syu'
alias pl '$aurhelper -Qs'
alias pa '$aurhelper -Ss'
alias pc '$aurhelper -Sc'
alias po '$aurhelper -Qtdq | $aurhelper -Rns -'

alias vc 'code'
alias vim 'nvim'
alias aa 'startx'
alias rm 'trash -v'
alias hx 'helix'
alias ff 'fastfetch'

alias .. 'cd ..'
alias ... 'cd ../..'
alias .3 'cd ../../..'
alias .4 'cd ../../../..'
alias .5 'cd ../../../../..'

# if you wanna add github token
# set -x GITHUB_TOKEN  

alias mkdir 'mkdir -p'

function yayf
  yay -Slq | fzf --multi --preview 'yay -Sii {1}' --preview-window=down:75% | xargs -ro yay -S
end

function lazyg
    git add .
    git commit -m "$argv"
    git push
end

end
set -gx PATH $HOME/.local/bin $PATH

nitch

set -x QT_QPA_PLATFORMTHEME qt5ct

# tty window manager launchers
alias startxdwm 'startx ~/.xinitrc dwm'
alias startxi3 'startx ~/.xinitrc i3'

# Apply pywal colors in foot automatically
if test -f ~/.cache/wal/sequences
    cat ~/.cache/wal/sequences
end


function play
    if string match -q -r '^https?://' -- $argv[1]
        mpv --volume=35 --no-video $argv
    else
        mpv --volume=35 --no-video "ytdl://ytsearch:$argv"
    end
end



function ins
  sudo pacman -S $argv 
end

function rec
  wf-recorder
end
