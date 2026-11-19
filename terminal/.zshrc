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
export PATH="$HOME/.pdtm/go/bin:$HOME/go/bin:/usr/local/go/bin:$HOME/.local/bin:$PATH"
alias pyenv="source $HOME/venvs/pentest/bin/activate"

# Universal lab VPN switcher & generic tinyproxy bridge
vpn() {
  if [ -z "$1" ]; then
    echo "Usage: vpn NAME"
    echo "Available profiles:"
    find "$HOME/vpn" -maxdepth 1 -name '*.ovpn' -printf '%f\n' | sed 's/\.ovpn$//' | sort
    return 1
  fi
  local file="$HOME/vpn/$1.ovpn"
  if [ ! -f "$file" ]; then
    echo "Profile not found: $file"
    return 1
  fi
  sudo openvpn "$file"
}
alias labproxy='tinyproxy -d -c "$HOME/.config/tinyproxy.conf"'
