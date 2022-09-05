# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/mgarort/bin/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/mgarort/bin/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/mgarort/bin/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/mgarort/bin/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


# For some reason, the original TERM value of rxvt-unicode-256color may be troublesome
# for the Python shell within conda, and some keys such as backspace may not work in the Python
# shell in conda as a result. If it happens, it seems that changing TERM fixes it somehow
# (from https://stackoverflow.com/questions/47893138/back-space-not-functional-in-python-and-ipython-in-shell )
# Uncomment the following line
# TERM=xterm-256color
