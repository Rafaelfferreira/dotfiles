eval "$(/opt/homebrew/bin/brew shellenv)"

# rbenv (guarded so a fresh machine without rbenv doesn't error on login)
if command -v rbenv >/dev/null 2>&1; then
  eval "$(rbenv init - --no-rehash zsh)"
fi
