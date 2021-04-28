# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/mgarort/housekeeping/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/mgarort/housekeeping/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/mgarort/housekeeping/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/mgarort/housekeeping/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# Without this, backspace doesn't work
#export TERMINFO=/usr/share/terminfo
export TERM=xterm
