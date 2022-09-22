# ---------------------------------
# SECTION:  Aliases
# ---------------------------------
#

# aliases for general movement between directories
alias ..='cd ..'
alias ...='cd ../..'
alias -- -='cd -'

# aliases for moving to specific directories
alias re='cd ~/repos'
alias wi='cd ~/repos/notes/wiki'
alias fl='cd ~/repos/notes/files'
alias no='cd ~/repos/notes'
alias nw='cd ~/repos/notes/wiki'
alias nl='cd ~/repos/notes/local_html'
alias np='cd ~/repos/notes/pcloud_html'
alias dotv='cd ~/repos/dotvim'
alias dotf='cd ~/repos/dotfiles'
alias web='cd ~/repos/mgarort.github.io/'
alias pics='cd ~/Pictures'
alias docs='cd ~/Documents'
alias dls='cd ~/Downloads'

# aliases for commands
alias ls='ls -v --color'
alias lf="ls -d */ | sed 's=/==' | column -c $COLUMNS"
alias ll='ls -valh'
alias lt='ls -talhr'
alias so='source ~/.bashrc'

# aliases for gui applications
alias s='XDG_CURRENT_DESKTOP=GNOME; gnome-control-center'
alias ju='jupyter notebook'
alias x='xdg-open'

# aliases for environments
alias inicon='source ~/repos/dotfiles/initialize_conda.sh'
alias activate_dockgym='source ~/repos/dotfiles/initialize_conda.sh; source activate dockgym'
alias activate_dockstring-working-copy='source ~/repos/dotfiles/initialize_conda.sh; source activate dockstring-working-copy'
alias activate_dockstring-vae='source ~/repos/dotfiles/initialize_conda.sh; source activate dockstring-vae'
alias activate_dockstring-vae2='source ~/repos/dotfiles/initialize_conda.sh; source activate dockstring-vae2; module load cuda/10.0'
alias activate_deepchem='source ~/repos/dotfiles/initialize_conda.sh; source activate deepchem; module load cuda/10.2'
alias activate_molgrid='source ~/repos/dotfiles/initialize_conda.sh; source activate molgrid; module load cuda/10.2'
alias activate_moldqn='source ~/repos/dotfiles/initialize_conda.sh; source activate moldqn; module load cuda/10.1'
alias activate_dockbiotic='source ~/repos/dotfiles/initialize_conda.sh; source activate dockbiotic'
alias activate_dc='source ~/repos/dotfiles/initialize_conda.sh; source activate dc; module load cuda/10.2'

# temporary aliases
alias play='cd ~/playground'
alias house='cd ~/housekeeping/'
alias u='cd ~/repos/utils'
alias gua='cd ~/repos/guatask'
alias gg='cd ~/repos/custom_graph_grammar/'
alias ggt='cd ~/repos/custom_graph_grammar/tasks'
alias ggs='cd ~/repos/custom_graph_grammar/submissions/'
alias ggp='cd ~/repos/custom_graph_grammar/playground/'
alias ds='cd ~/repos/dockgym/'
alias dockstring='cd ~/repos/dockgym/'
alias docks='cd ~/repos/dockgym/'
alias dst='cd ~/repos/dockstring-experiments/tasks/'
alias dss='cd ~/repos/dockstring-experiments/submissions/'
alias dsc='cd ~/repos/dockstring-experiments/scripts/'
alias dsp='cd ~/repos/dockstring-experiments/playground/'
alias dsr='cd ~/repos/dockgym/dockstring/resources/'
alias dsd='cd ~/repos/dockgym/dockstring/'
alias vae='cd ~/repos/vae-opt2020/'
alias ro='cd ~/repos/rough-dockstring-baselines/'
alias ros='cd ~/repos/rough-dockstring-baselines/submissions/'
alias db='cd ~/repos/dockbiotic'
alias dbt='cd ~/repos/dockbiotic/tasks/'
alias dbs='cd ~/repos/dockbiotic/submissions/'
alias dbc='cd ~/repos/dockbiotic/scripts/'
alias dbp='cd ~/repos/dockbiotic/playground/'
alias dbo='cd ~/repos/dockbiotic/plots'
alias dbd='cd ~/repos/dockbiotic/data/'
alias dbe='cd ~/repos/dockbiotic/experiments/'
alias dbr='cd ~/repos/dockbiotic/dockbiotic/'
alias mnp='cd ~/repos/molecular-neural-process'


alias lg='ls --human-readable --size -1 -S --classify'
alias count='find . -type f | wc -l'
alias left='ls -t -1'
