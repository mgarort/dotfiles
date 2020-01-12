# My .bashrc file. To be located on ~/.bashrc

# .bashrc if in Hyperion

if [[ $HOSTNAME == hyperion ]]; then
    
    echo "loaded successfully in hyperion"
    # ~/.bashrc: executed by bash(1) for non-login shells.
    # see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
    # for examples

    # If not running interactively, don't do anything
    case $- in
        *i*) ;;
          *) return;;
    esac

    # don't put duplicate lines or lines starting with space in the history.
    # See bash(1) for more options
    HISTCONTROL=ignoreboth

    # append to the history file, don't overwrite it
    shopt -s histappend

    # for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
    HISTSIZE=1000
    HISTFILESIZE=2000

    # check the window size after each command and, if necessary,
    # update the values of LINES and COLUMNS.
    shopt -s checkwinsize

    # If set, the pattern "**" used in a pathname expansion context will
    # match all files and zero or more directories and subdirectories.
    #shopt -s globstar

    # make less more friendly for non-text input files, see lesspipe(1)
    [ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

    # set variable identifying the chroot you work in (used in the prompt below)
    if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
        debian_chroot=$(cat /etc/debian_chroot)
    fi

    ## set a fancy prompt (non-color, unless we know we "want" color)
    case "$TERM" in
        xterm-color|*-256color) color_prompt=yes;;
    esac

    # uncomment for a colored prompt, if the terminal has the capability; turned
    # off by default to not distract the user: the focus in a terminal window
    # should be on the output of commands, not on the prompt
    force_color_prompt=yes

    if [ -n "$force_color_prompt" ]; then
        if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    #	# We have color support; assume it's compliant with Ecma-48
    #	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
    #	# a case would tend to support setf rather than setaf.)
            color_prompt=yes
        else
            color_prompt=
        fi
    fi

    if [ "$color_prompt" = yes ]; then
        PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
    else
        PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
    fi
    unset color_prompt force_color_prompt

    # If this is an xterm set the title to user@host:dir
    case "$TERM" in
    xterm*|rxvt*)
        PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
        ;;
    *)
        ;;
    esac

    # enable color support of ls and also add handy aliases
    if [ -x /usr/bin/dircolors ]; then
        test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
        #alias ls='ls --color=auto'
        #alias dir='dir --color=auto'
        #alias vdir='vdir --color=auto'

        alias grep='grep --color=auto'
        alias fgrep='fgrep --color=auto'
        alias egrep='egrep --color=auto'
    fi

    # colored GCC warnings and errors
    #export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

    # some more ls aliases
    alias ll='ls -alF'
    alias la='ls -A'
    alias l='ls -CF'

    # Add an "alert" alias for long running commands.  Use like so:
    #   sleep 10; alert
    alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

    # Alias definitions.
    # You may want to put all your additions into a separate file like
    # ~/.bash_aliases, instead of adding them here directly.
    # See /usr/share/doc/bash-doc/examples in the bash-doc package.

    if [ -f ~/.bash_aliases ]; then
        . ~/.bash_aliases
    fi

    # enable programmable completion features (you don't need to enable
    # this, if it's already enabled in /etc/bash.bashrc and /etc/profile
    # sources /etc/bash.bashrc).
    if ! shopt -oq posix; then
      if [ -f /usr/share/bash-completion/bash_completion ]; then
        . /usr/share/bash-completion/bash_completion
      elif [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
      fi
    fi

    # CUSTOMIZED BASH DISPLAY COLORS

    # ADDITIONAL COMMANDS BY ME
    #export PS1='$(pwd) $'
    #export PS1="\e[01;32m $PS1 \e[m"
    hpc_cpu='mg770@login-cpu.hpc.cam.ac.uk'
    alias ls='ls --color'
    alias ml='source ~/housekeeping/virtualenv/ml/bin/activate'
    alias ml2='source ~/housekeeping/virtualenv/ml2/bin/activate'
    alias youtube='source ~/housekeeping/virtualenv/youtube/bin/activate'
    alias zotero='/opt/Zotero_linux-x86_64/zotero'
    alias mhg='source /home/mgarort/housekeeping/virtualenv/mhg/bin/activate'
    alias python=python3
    alias topos='source /home/mgarort/housekeeping/virtualenv/topos/bin/activate'
    export LD_LIBRARY_PATH="/home/mgarort/housekeeping/boost_1_71_0:$RDBASE/lib"
    export RDBASE='/home/mgarort/housekeeping/rdkit-Release_2019_03_4'
    export BOOST_ROOT='/home/mgarort/housekeeping/boost_1_71_0'
    export PYTHONPATH="$RDBASE/build:$RDBASE:$PYTHONPATH:$RDBASE/lib"


    carl='/home/mgarort/7_MGM/roation_with_Rasmussen_Roman/'
    shopt -s direxpand


    stty -ixon  # So as not to be disturbed by freezing from Ctrl+s, and having to unfreeze with Ctrl+q
    alias r='/home/mgarort/.local/bin/ranger'

    # ENVIRONMENT VARIABLES FOR CODE RUN ON LAPTOP / CLUSTER

    ROATION_WITH_RASMUSSEN_ROMAN='/home/mgarort/7_MGM/roation_with_Rasmussen_Roman/'
    export ROATION_WITH_RASMUSSEN_ROMAN
    alias s='XDG_CURRENT_DESKTOP=GNOME; gnome-control-center'

    # To make the prompt really cool, show username, host, Git branch, and starts line below
    #PS1='\[\033[0;32m\]\[\033[0m\033[0;32m\]\u\[\033[0;36m\] @ \[\033[0;36m\]\h \w\[\033[0;32m\]$(__git_ps1)$(git_status)\n\[\033[0;32m\]└─\[\033[0m\033[0;32m\] \$\[\033[0m\033[0;32m\] ▶\[\033[0m\] '
    PS1='\[\033[0;32m\]\[\033[0m\033[0;32m\]\u\[\033[0;32m\]@\[\033[0;32m\]\h \[\033[0;36m\]\w\[\033[0;32m\]$(__git_ps1) \[\033[0;37m\]$(git_sha) \[\033[0;31m\]$(git_status)\n\[\033[0;32m\] \$\[\033[0m\]  '


    git_status() {
        # Outputs a series of indicators based on the status of the
        # working directory:
        # + changes are staged and ready to commit
        # ! unstaged changes are present
        # ? untracked files are present
        # S changes have been stashed
        # P local commits need to be pushed to the remote
        local branch=$(__git_ps1)
        if [[ -n $branch ]]; then
            local status="$(git status --porcelain 2>/dev/null)"
            local output=''
            [[ -n $(egrep '^[MADRC]' <<<"$status") ]] && output="$output+"
            [[ -n $(egrep '^.[MD]' <<<"$status") ]] && output="$output!"
            [[ -n $(egrep '^\?\?' <<<"$status") ]] && output="$output?"
            [[ -n $(git stash list) ]] && output="${output}S"
            [[ -n $(git log --branches --not --remotes) ]] && output="${output}P"
            [[ -n $output ]] && output="  ($output)  "  # separate from branch name
            echo $output
        fi
    }

    git_sha() {
        # Outputs the git commit sha id
        local branch=$(__git_ps1)
        if [[ -n $branch  ]]; then
            local sha="$(git rev-parse --short HEAD)"
            output="[$sha]"
            echo $output
        fi
    }


    # Commands to be executed before the prompt is displayed
    # Save current working dir
    PROMPT_COMMAND='pwd > "${HOME}/.cwd"'

    # Change to saved working dir
    [[ -f "${HOME}/.cwd" ]] && cd "$(< ${HOME}/.cwd)"
fi

# .bashrc if in the cluster
if [[ $HOSTNAME =~ login-e-[0-9]+ ]]; then

    echo "loaded successfully in cluster"
    # .bashrc

    # Environment from Roman/Carl rotation
    #module load cuda/9.0 intel/mkl/2017.4
    #module load python-3.6.1-gcc-5.4.0-64u3a4w py-numpy-1.12.1-gcc-5.4.0-cjrgw2k py-matplotlib-2.2.2-gcc-5.4.0-6oe6fph
    #module load py-virtualenv-15.1.0-gcc-5.4.0-gu4wi6c
    #module load matlab/r2019a
    #source /home/mg770/ml3/bin/activate

    # ENVIRONMENT VARIABLES FOR EXECUTING ON LAPTOP/CLUSTER

    #ROATION_WITH_RASMUSSEN_ROMAN='/home/mg770/mres/roation_with_Rasmussen_Roman/'
    #export ROATION_WITH_RASMUSSEN_ROMAN
    #cd $ROATION_WITH_RASMUSSEN_ROMAN

    # Source global definitions
    if [ -f /etc/bashrc ]; then
            . /etc/bashrc
    fi

    # User specific aliases and functions
    shopt -s direxpand
    alias load_conda='module load miniconda3-4.5.4-gcc-5.4.0-hivczbz'
    alias sq='squeue -u mg770'
    #export PS1='$(pwd)$'

    module load vim-8.0.0503-gcc-5.4.0-4qx4yxm
    module load tmux-2.6-gcc-5.4.0-3iichdy
    module load miniconda3-4.5.4-gcc-5.4.0-hivczbz
    #source activate ml
    export TERM=xterm-256color # So that we can spawn new terminals over ssh, for instance to open Vim or htop (before, I received the obscure error message "Error opening terminal: rxvt-unicode-256color"


    source ~/.bash_git

    # To make the prompt really cool, show username, host, Git branch, and starts line below
    #PS1='\[\033[0;32m\]\[\033[0m\033[0;32m\]\u\[\033[0;36m\] @ \[\033[0;36m\]\h \w\[\033[0;32m\]$(__git_ps1)$(git_status)\n\[\033[0;32m\]└─\[\033[0m\033[0;32m\] \$\[\033[0m\033[0;32m\] ▶\[\033[0m\] '
    PS1='\[\033[0;32m\]\[\033[0m\033[0;32m\]\u\[\033[0;32m\]@\[\033[0;32m\]\h \[\033[0;36m\]\w\[\033[0;32m\]$(__git_ps1) \[\033[0;37m\]$(git_sha) \[\033[0;31m\]$(git_status)\n\[\033[0;32m\] \$\[\033[0m\]  '


    git_status() {
        # Outputs a series of indicators based on the status of the
        # working directory:
        # + changes are staged and ready to commit
        # ! unstaged changes are present
        # ? untracked files are present
        # S changes have been stashed
        # P local commits need to be pushed to the remote
        local branch=$(__git_ps1)
        if [[ -n $branch ]]; then
            local status="$(git status --porcelain 2>/dev/null)"
            local output=''
            [[ -n $(egrep '^[MADRC]' <<<"$status") ]] && output="$output+"
            [[ -n $(egrep '^.[MD]' <<<"$status") ]] && output="$output!"
            [[ -n $(egrep '^\?\?' <<<"$status") ]] && output="$output?"
            [[ -n $(git stash list) ]] && output="${output}S"
            [[ -n $(git log --branches --not --remotes) ]] && output="${output}P"
            [[ -n $output ]] && output="  ($output)  "  # separate from branch name
            echo $output
        fi
    }

    git_sha() {
        # Outputs the git commit sha id
        local branch=$(__git_ps1)
        if [[ -n $branch  ]]; then
            local sha="$(git rev-parse --short HEAD)"
            output="[$sha]"
            echo $output
        fi
    }

fi 
