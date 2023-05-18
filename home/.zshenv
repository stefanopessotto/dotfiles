export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export GDBHISTFILE="$XDG_DATA_HOME/gdb/history"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority"
export STACK_ROOT="$XDG_DATA_HOME/stack"
export DOT_SAGE="$XDG_CONFIG_HOME/sage"
export CUDA_CACHE_PATH="$XDG_CACHE_HOME/nv"
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc"
export GHCUP_USE_XDG_DIRS=true
export GNUPGHOME="$XDG_DATA_HOME/gnupg"

export GOPATH="$XDG_DATA_HOME/go"
export JULIA_DEPOT_PATH="$XDG_DATA_HOME/julia"

export MZN_SOLVER_PATH="$XDG_DATA_HOME/minizinc"
export HELIX_RUNTIME="$XDG_CONFIG_HOME/helix/runtime"
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/.cabal/bin"
export PATH="$PATH:$HOME/.local/share/gem/ruby/3.0.0/bin"
#slow startup of zsh
skip_global_compinit=1

#ghidra gray screen
export _JAVA_AWT_WM_NONREPARENTING=1

export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/lib:/usr/local/lib"
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/lib/jvm/java-17-openjdk/lib/server"

