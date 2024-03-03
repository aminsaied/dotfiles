# If you come from bash you might have to change your $PATH.
export PATH=$HOME/.local/bin:$HOME/bin:/usr/local/bin:$PATH

# put miniconda on the PATH
export PATH=~/miniconda/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="fishy"
ZSH_THEME="robbyrussell"
# ZSH_THEME="agnoster"
# ZSH_THEME=powerlevel10k/powerlevel10k  #git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k


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

export EDITOR='code'
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

#############
#### SSH ####
#############
# https://dev.to/levivm/how-to-use-ssh-and-ssh-agent-forwarding-more-secure-ssh-2c32
# 1. initialize ssh-agent
eval `ssh-agent` >/dev/null
# 2. add ssh key
ssh-add >/dev/null 2>&1

# Aliases
## navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

## commonly edited files
edit-zsh () {
	if [ $# -ne 0 ]; then
		$1 ~/.zshrc
	else
		vim ~/.zshrc
	fi
}
## usage: $ edit-zsh code
## this will open the ~/.zshrc file in vs code
edit-ssh () {
	if [ $# -ne 0 ]; then
		$1 ~/.ssh/config
	else
		vim ~/.ssh/config
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
	echo "- async: open async project"
	echo "- amlds: open async project"
    echo "- exp: open exp project"
    echo "- meeting: create new meeting and open in vim"
    echo "  - meeting foo bar: create new meeting called bar in foo directory"


	echo "Projects: proj-eglue"
	echo "- proj-eglue-omr:" "Open EGLUE in Matrix repo and checkout amsaied/eglue"
}

async() {
	cd ~/repos/system
    vim docs/projects/async/async-active.md
}

exp() {
        cd ~/repos/system
        vim docs/projects/exp/exp-active.md
}

amlds() {
        cd ~/repos/system
        vim docs/projects/amlds/amlds-active.md
}

meeting() {
    cd ~/repos/system
    if [ $# -ne 0 ]; then
        file=$(python scripts/meetings.py --dir $1 --name $2)
    else 
        file=$(python scripts/meetings.py)
    fi
    vim $file
}

# start mkdocs servers
serve-dsref() {
        cd ~/repos/dsref
        conda activate mkdocs-env
        mkdocs serve -a localhost:8888
}
alias dsref-serve=serve-dsref

serve-system() {
	cd ~/repos/system
	conda activate mkdocs-env
	mkdocs serve -a localhost:8088
}
alias system-serve=serve-system

edit-system() {
    cd ~/repos/system
    code .
}
alias system-edit

source $HOME/.config/broot/launcher/bash/br

# function that sets workspaces for AML given workspace name as input
set-ws() {
    if [ $# -ne 0 ]; then
        if [ $1 = "alex" ]; then
            export WS="Alexander256V100"
            export RG="Alexander256"
            export SUB_ID="79f57c16-00fe-48da-87d4-5192e86cd047"
        elif [ $1 = "babel-a100-reference" ]; then
            export WS="BabelA100WUS3Reference"
            export RG="BabelA100Reference"
            export SUB_ID="79f57c16-00fe-48da-87d4-5192e86cd047"
        elif [ $1 = "babel-a100-wus3" ]; then
            export WS="BabelA100WUS3"
            export RG="BabelA100"
            export SUB_ID="79f57c16-00fe-48da-87d4-5192e86cd047"
        elif [ $1 = "babel-a100-reference-cus" ]; then
            export WS="BabelA100CUSReference"
            export RG="BabelA100Reference"
            export SUB_ID="79f57c16-00fe-48da-87d4-5192e86cd047"
        elif [ $1 = "dl-benchmark-eus" ]; then
            export WS="dl-benchmark-eus"
            export RG="dl-benchmark-rg"
            export SUB_ID="48bbc269-ce89-4f6f-9a12-c6f91fcb772d"
        elif [ $1 = "benchmark" ]; then
            export WS="babel-benchmark"
            export RG="babel-benchmark-rg"
            export SUB_ID="a1920ebd-59b7-4f19-af9f-5e80599e88e4"
        else
            echo "Invalid workspace name"
        fi
    else
        echo "No workspace name provided. Valid names are:"
        echo "- alex"
        echo "- babel-a100-reference"
        echo "- babel-a100-wus3"
        echo "- babel-a100-reference-cus"
        echo "- dl-benchmark-eus"
        echo "- benchmark"
    fi
}


project-elr2() {
    cd ~/repos/elr2
    conda activate elr2
    cd sources/dev/SubstrateInferences/ELR2
    export PYTHONPATH=$PWD
    cd ..
    code .
}
alias edit-elr2=project-elr2

# jupyter notebook
alias jn="~/.local/bin/jupyter notebook --no-browser"

serve-jn () {
    is_running=$(tmux ls | grep jn-session | wc -l)
    if [ $is_running -gt 0 ]; then
        echo "Existing jn-session is running. Please end that first."
        echo "Run tmux kill-session -t jn-session"
    else
        tmux new -s jn-session -d
        tmux send-keys -t jn-session "mkdir -p /tmp/jn-server && jn 2> /tmp/jn-server/stderr.txt " ENTER
        addr=$(cat /tmp/jn-server/stderr.txt | grep http | tail -n1 | sed -E 's/^.*http/http/')
        wslview $addr
    fi
}
alias jn-serve=serve-jn
kill-jn () {
    is_running=$(tmux ls | grep jn-session | wc -l)
    if [ $is_running -gt 0 ]; then
        tmux kill-session -t jn-session
        echo "Killed jn-session"
    else
        echo "No jn-session is running"
    fi
}
alias jn-kill=kill-jn
view-jn () {
    is_running=$(tmux ls | grep jn-session | wc -l)
    if [ $is_running -gt 0 ]; then
        tmux attach -t jn-session
    else
        echo "No jn-session is running"
    fi
}
alias jn-view=view-jn

jn-explore () {
    cdr
    mkdir -p jupyter-notebooks
    cd jupyter-notebooks
    jn-serve
}

# executables: add dotfiles/scripts to path
export PATH=$HOME/dotfiles/scripts/:$PATH

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$("${HOME}"'/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "$HOME/miniconda3/etc/profile.d/conda.sh" ]; then
        . "$HOME/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="$HOME/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# >>> go init >>>
#function powerline_precmd() {
#    PS1="$($GOPATH/bin/powerline-go -error $? -shell zsh)"
#}
#
#function install_powerline_precmd() {
#  for s in "${precmd_functions[@]}"; do
#    if [ "$s" = "powerline_precmd" ]; then
#      return
#    fi
#  done
#  precmd_functions+=(powerline_precmd)
#}
#
#if [ "$TERM" != "linux" ]; then
#    install_powerline_precmd
#fi
#
# <<< go init <<<

source $HOME/.config/broot/launcher/bash/br