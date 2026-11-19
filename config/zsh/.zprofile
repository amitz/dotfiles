# Login shells only. Must be here, not .zshenv: macOS /etc/zprofile (path_helper)
# runs after .zshenv and would push /usr/bin ahead of Homebrew.
eval "$(/opt/homebrew/bin/brew shellenv)"

# /usr/bin/java only finds JDKs in /Library/Java (admin-only), so point at Homebrew's directly.
if [[ -d $HOMEBREW_PREFIX/opt/openjdk@21 ]]; then
  export JAVA_HOME=$HOMEBREW_PREFIX/opt/openjdk@21/libexec/openjdk.jdk/Contents/Home
  path=($JAVA_HOME/bin $path)
fi

path=($HOME/.local/bin(N) $path)
