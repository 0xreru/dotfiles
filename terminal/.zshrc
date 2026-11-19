HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt SHARE_HISTORY HIST_IGNORE_DUPS

source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
eval "$(starship init zsh)"

# Quick CTF challenge workspace generator
nctf() {
  if [ -z "$1" ] || [ -z "$2" ]; then
    echo "Usage: nctf event-name challenge-name"
    return 1
  fi
  local dir="/mnt/d/reru/Pentest-Notes/labs/ctfs/$1/$2"
  mkdir -p "$dir/assets"
  if [ ! -f "$dir/writeup.md" ]; then
    cp /mnt/d/reru/Pentest-Notes/templates/ctf-writeup.md "$dir/writeup.md"
    sed -i "s|# Challenge / Lab Name|# $2|" "$dir/writeup.md"
  fi
  cd "$dir"
  echo "Ready: $dir"
}
