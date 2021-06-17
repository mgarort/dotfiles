# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('~/housekeeping/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "~/housekeeping/miniconda3/etc/profile.d/conda.sh" ]; then
        . "~/housekeeping/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="~/housekeeping/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# For some reason, the original TERM value of rxvt-unicode-256color is troublesome
# for the Python shell within conda, and some keys such as backspace do not work in the Python
# shell in conda as a result. Changing TERM fixes it somehow
# (from https://stackoverflow.com/questions/47893138/back-space-not-functional-in-python-and-ipython-in-shell )
TERM=xterm-256color
