if [ -z "$DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ]; then
  exec startx
fi
#[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
source ~/.aliases
neofetch
export EDITOR=nvim
export VISUAL=nvim
export BROWSER="firefox-developer"
export GTK_THEME=VimixDark
export PATH=$PATH:~/bin/:~/.cabal/bin

export PATH="$HOME/.cargo/bin:$PATH"
