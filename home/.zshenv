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

export PYTHONPYCACHEPREFIX=$XDG_CACHE_HOME/python
export ZDOTDIR=$HOME/.config/zsh
export HISTFILE="$XDG_STATE_HOME"/zsh/history 
# Slow startup of zsh
skip_global_compinit=1

export LD_LIBRARY_PATH="/usr/lib:/usr/local/lib"
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/lib/jvm/java-17-openjdk/lib/server"

# Fix R studio
R_HOME_USER="$HOME/.config/R"
R_PROFILE_USER="$HOME/.config/R/profile"
R_HISTFILE="$HOME/.config/R/history"

# Fix Docker
export DOCKER_CONFIG="$XDG_CONFIG_HOME"/docker

# Fix .Xauthority
export XAUTHORITY="$XDG_RUNTIME_DIR"/Xauthority

# Fix .xinitrc
export XINITRC="$XDG_CONFIG_HOME"/X11/xinitrc
