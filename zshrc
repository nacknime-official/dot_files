#neofetch
# export LIBVA_DRIVER_NAME="i965"
export LANG=en_US.UTF-8
export TERM=xterm-256color
export _JAVA_AWT_WM_NONREPARENTING=1
export XCURSOR_THEME="Breeze_Snow"

# wayland
export XDG_SESSION_TYPE=wayland
export XDG_CURRENT_DESKTOP=hyprland
# export QT_WAYLAND_FORCE_DPI=120
export QT_QPA_PLATFORM="wayland;xcb"
export SDL_VIDEODRIVER=wayland
export BEMENU_BACKEND=wayland
export CLUTTER_BACKEND=wayland
#export MESA_LOADER_DRIVER_OVERRIDE=i965
#export GDK_BACKEND=wayland

# firefox
export MOZ_ENABLE_WAYLAND=1
# export MOZ_ACCELERATED=1
# export MOZ_WEBRENDER=1
# export MOZ_DBUS_REMOTE=1
export QT_QPA_PLATFORMTHEME="qt5ct"
export GTK_THEME="Gruvbox-Material-Dark"

# telegram
export TDESKTOP_DISABLE_TRAY_COUNTER=1
#export TDESKTOP_DISABLE_GTK_INTEGRATION=1
# If you come from bash you might have to change your $PATH.
export PATH=$HOME/.dotnet:$HOME/bin:$HOME/.yarn/bin:$HOME/.local/bin:$HOME/.cargo/bin:$HOME/.local/share/solana/install/active_release/bin:/opt/google-cloud-cli/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

export KEEPASS_PATH=$HOME/Keepass/passwd.kdbx

# golang
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH=$GOBIN:$PATH

# flutter
# export ANDROID_SDK_ROOT='/opt/android-sdk'
export JAVA_HOME=/usr/lib/jvm/java-17-openjdk
export PATH=$JAVA_HOME/bin:$PATH
# export PATH=$PATH:$ANDROID_SDK_ROOT/cmdline-tools/latest/bin/ # <-- Before all
# export PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools/
# export PATH=$PATH:$ANDROID_SDK_ROOT/tools/bin/
# export PATH=$PATH:$ANDROID_ROOT/emulator
# export PATH=$PATH:$ANDROID_SDK_ROOT/tools/
export CHROME_EXECUTABLE=$HOME/bin/google-chrome-unsafe
export PATH=$HOME/.pub-cache/bin:$PATH

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git python zsh-autosuggestions zsh-history-substring-search zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   if [ -n "$NVIM_LISTEN_ADDRESS" ]; then
     export VISUAL="nvr -cc q --remote-wait"
   else
     export EDITOR='nvim'
   fi

 fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# zsh-autosuggestions
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_USE_ASYNC='1'
bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down

HISTORY_SUBSTRING_SEARCH_FUZZY='1'

alias ls='exa --icons'
alias l='ls -lg'
alias la='ls -a'
alias lla='ls -lga'
alias lt='ls --tree'

alias r='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'

alias sudo='doas'

alias nv='nvim'

alias dc='docker-compose'

alias mpv1080='mpv --ytdl-format="bestvideo[height=1080]+bestaudio"'
alias mpv720='mpv --ytdl-format="bestvideo[height=720]+bestaudio"'

alias lg='lazygit'

alias dragon='dragon-drag-and-drop'

source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
eval "$(zoxide init zsh)"

[[ -s "/home/nacknime/.gvm/scripts/gvm" ]] && source "/home/nacknime/.gvm/scripts/gvm"
