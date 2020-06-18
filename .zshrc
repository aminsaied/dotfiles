# If you come from bash you might have to change your $PATH.
export PATH=$HOME/.local/bin:$HOME/bin:/usr/local/bin:$PATH

# put miniconda on the PATH
export PATH=~/miniconda/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/amin/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"
# ZSH_THEME="agnoster"

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
plugins=(
  git
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

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

# Aliases
## navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias see-ssh.pub="less ~/.ssh/id_rsa.pub"
## commonly edited files
edit-zsh () {
	if [ $# -ne 0 ]; then
		$1 ~/.zshrc
	else
		nano ~/.zshrc
	fi
}
## usage: $ edit-zsh code
## this will open the ~/.zshrc file in vs code
edit-ssh () {
	if [ $# -ne 0 ]; then
		$1 ~/.ssh/config
	else
		nano ~/.ssh/config
	fi
}

# helpers for repos
alias lsr="ls ~/repos"
cdr () {
	if [ $# -ne 0 ]; then
		cd ~/repos/$1
	else
		cd ~/repos
	fi
}
## git
alias gs="git status -sb"
alias ga="git add ."
alias gc="git commit -m"
alias gpull="git pull"
alias gpush="git push"
alias gcheck="git checkout"
## from https://github.com/SwapneelM/dotfiles/blob/master/.zshrchttps://github.com/SwapneelM/dotfiles
alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"

# project specific shortcuts and commands
# these should be updated regularly
proj-ls() {
	echo "System"
	echo "    proj-system-asynceglue 6"
	echo "        alias async"
	echo "    proj-system-teams 6"
	echo "        alias teams"

	echo "Projects: proj-eglue"
	echo "    proj-eglue-omr:" "Open EGLUE in Matrix repo and checkout amsaied/eglue"
}

proj-system-asynceglue() {
	cd ~/repos/system
        if [ $# -ne 0 ]; then
                nano docs/projects/2020.06.AsyncEglue/$1.md
        else
                cd docs/projects/2020.06.AsyncEglue
        fi 
}

alias async="proj-system-asynceglue 6"

proj-system-teams() {
        cd ~/repos/system
        if [ $# -ne 0 ]; then
                nano docs/projects/2020.06.Teams/$1.md
        else
                cd docs/projects/2020.06.Teams
        fi
}

alias teams="proj-system-teams 6"
proj-system-live() {
	cd ~/repos/system
	conda activate mkdocs-env
	mkdocs serve -a localhost:8088
}

proj-eglue-omr() {
	echo "Opening EGLUE in Matrix repo"
	cd ~/repos/matrix-compliant/src/ODIN-ML/Partner/ENLRProject/EGLUE/
	echo "Checking out amsaied/eglue"
	git checkout amsaied/eglue
}

live() {
tmux \
    new-session  'teams' \; \
    split-window 'async' \; \
    detach-client
}

source /home/amin/.config/broot/launcher/bash/br

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/amin/miniconda/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/amin/miniconda/etc/profile.d/conda.sh" ]; then
        . "/home/amin/miniconda/etc/profile.d/conda.sh"
    else
        export PATH="/home/amin/miniconda/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

