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

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
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
    alias ls='ls --color=auto'
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


############################################## PATHS ########################################
export HOME=/home/caner
export WORK=$HOME/work
# export GOPATH=$HOME/go

################################# RACKET & PYCKET STUFF######################################

export PYPYBINHOME=$HOME/pypy2.7-v7.3.16-linux64
export PYCKETHOME=$HOME/pycket
export PYPYHOME=$PYCKETHOME/pypy

export RACKETHOME=$HOME/racket
export PLTHOME=$RACKETHOME
export RACKETBUILDBIN=$PLTHOME/racket/src/build/bin

export PYTHONPATH=$PYTHONPATH:$PYPYHOME
export PYTHONPATH=$PYTHONPATH:$PYPYHOME/lib-python/2.7/site-packages

alias r='racket'
alias p='pycket-c-linklets'
alias pycket='pycket-c-linklets'


############################################## PATH ########################################

# export PATH=$PATH:$GOPATH/bin
# export PATH=$PATH:/snap/bin
# export PATH=$PATH:$WORK/cderici/juju/_build/linux_amd64/bin
export PATH=$PATH:$HOME/.local/bin
# export PATH=$PATH:$HOME/programs/

export PATH=$PATH:$PYPYBINHOME/bin
export PATH=$PATH:$PLTHOME/bin
export PATH=$PATH:$PYCKETHOME
export PATH=$PATH:$PYPYHOME/pypy/goal
export PATH=$PATH:$PLTHOME/racket/bin
export PATH=$PATH:$RACKETBUILDBIN

################################# CANONICAL STUFF ########################################


export PYTHON=/usr/bin/python3

# export SCHEMA_PATH=~/work/python-libjuju/juju/client/schemas-juju-latest-new.json

# CLOUD CREDENTIALS -- this is prob not the right place to put these
# juju autoload-credentials
# 
# aws cderici

# JENKINS STUFF
# export WORKON_HOME=~/.virtualenvs
# source /usr/share/virtualenvwrapper/virtualenvwrapper.sh

# ORACLE OCI STUFF
# export OCID_USER="ocid1.user.oc1..aaaaaaaaa5awrjocq7irqha62ykh2gksvev2apil6htds7ings2hjuapwhuq"
# export OCID_TENANCY="ocid1.tenancy.oc1..aaaaaaaao7f7cccogqrg5emjxkxmctzbnhl6zdkkx36yq2jgxnm4p5vmysbq"
# export OCID_COMPARTMENT="ocid1.compartment.oc1..aaaaaaaanvu2racnlczevenu73dlcf3nokgsjpdkbdgp4xbrz3lb2y4giyjq"

# MICROSTACK / OPENSTACK
# alias mo='microstack.openstack'

# export JJB_CONF_PATH=~/work/cderici/cloud-city/jenkins-jjb
# export JENKINS_USER=cderici
# export JENKINS_ACCESS_TOKEN=110951e7557effc1543c49cf7cba9b27fd

# export JENKINS_USER=guest
# export JENKINS_ACCESS_TOKEN=11aa49eeae7e02f251f72843417f834220

# export JENKINS_USER=cderici
# export JENKINS_ACCESS_TOKEN=11a53f2ecde339542a1750963ece42422d

export PATH=/home/caner/work/bin:$PATH


############################################## ALIASES #######################################

alias n='nvim'
alias t='tmux'
alias ta='tmux attach'

alias tc='tmux attach-session -t code'
alias tt='tmux attach-session -t terminal'

# find proxmox logs older than 90 days
# find /var/log/proxmox-backup/tasks -type f  -name 'UPID*' -mtime +90 -delete

### juju
# alias snapjuju='/snap/bin/juju'
# alias devjuju='~/work/cderici/juju/_build/linux_amd64/bin/juju'
# alias j='juju'
# alias jdebug='juju debug-log'
# alias egrep='egrep --color=auto'
# alias wjw='watch -c "juju status --color|egrep \"blocked|waiting|maint|error|hook|lost|failed|executing|skipped|pending|suspend\""'

# alias jdb='/home/caner/work/useful-scripts/db-connect.sh'

# alias k=kubectl

# kpods () { k -n "$1" get pods ;}

# alias jclouds='juju clouds --all'
# alias jcontrollers='juju controllers --refresh'
# alias jwatch='watch -n1 --color juju status --color'
# alias jstatus='watch -n1 --color juju status --color -m $1'
# alias jmodels='watch -n1 --color juju models'
# alias jdestroy='juju destroy-model --force --no-wait $1'
# alias jkill='juju kill-controller $1 --no-prompt'
# alias jremove='juju remove-application --force --no-wait $1'
# # alias cdj='cd $GOPATH/src/github.com/juju/juju'
# alias cdj='cd $HOME/work/juju'

# function juju-switch { command sudo snap refresh juju --channel="$1/$2"; }

# # JUJU BOOTSTRAP

# # microk8s
# alias jbootmicrok8s='juju bootstrap microk8s $1'
# # lxd
# alias jbootlxd='juju bootstrap lxd $1'
# alias fix_lxd='sudo iptables -I DOCKER-USER -j ACCEPT'
# # aws
# alias jbootaws='juju bootstrap aws $1'
# # oci
# alias jbootoci='juju bootstrap --config compartment-id=$OCID_COMPARTMENT oci-canonical $1'
# # openstack / microstack
# alias jbootstack='juju bootstrap --bootstrap-series=focal   --metadata-source=~/simplestreams   --model-default network=test   --model-default external-network=external   --model-default use-floating-ip=true --credential=admin  microstack $1'
# # maas finfolk
# alias prepmaas='sshuttle -r jenkins@finfolk 10.0.30.0/24'

# eval "$(ssh-agent -s)"
# ssh-agent /bin/sh
# ssh-add -q $HOME/work/cderici/cloud-city/id_rsa

# TERRAFORM

# alias cdt='cd $GOPATH/src/github.com/terraform-provider-juju'
# alias terraform-binary-copy='cp terraform-provider-juju /home/caner/.terraform.d/plugins/registry.terraform.io/juju/juju/0.4.1/linux_amd64/terraform-provider-juju_v0.4.1'
# alias tf-test-single='TF_ACC=1 TEST_CLOUD=lxd  go test ./... -v -test.run $1'

# export CONTROLLER=$(juju_29 whoami | yq .Controller)
# export JUJU_CONTROLLER_ADDRESSES="$(juju_29 show-controller | yq '.[$CONTROLLER]'.details.\"api-endpoints\" | tr -d "[]' "|tr -d '"'|tr -d '\n')"
# export JUJU_USERNAME="$(cat ~/.local/share/juju/accounts.yaml | yq .controllers.$CONTROLLER.user|tr -d '"')"
# export JUJU_PASSWORD="$(cat ~/.local/share/juju/accounts.yaml | yq .controllers.$CONTROLLER.password|tr -d '"')"
# export JUJU_CA_CERT="$(juju_29 show-controller $(echo $CONTROLLER|tr -d '"') | yq '.[$CONTROLLER]'.details.\"ca-cert\"|tr -d '"'|sed 's/\\n/\n/g')"


### git
alias g=git
alias s='git status'
alias d='git diff $1'
alias git-graph='git log --all --decorate --oneline --graph'
alias gg=git-graph

export VISUAL=nvim
export EDITOR=$VISUAL
export GIT_EDITOR=$VISUAL

alias co='git checkout $1'
alias pull='git pull'
alias switch='git switch $1'
alias gocheck='go test -gocheck $1'
alias rebase-on-master='git pull upstream master --rebase'
alias landed-branches='git branch --merged master | grep -v "^\* master"'
alias cleanup-branch-local='git branch -d $1'
alias cleanup-branch-remote='git push --delete origin $1'
alias cbr=cleanup-branch-remote
alias cbl=cleanup-branch-local

function cleanup-typechange { command git status --porcelain | awk '{if ($1=="T") print $2}' | xargs git checkout; }

function get-pr { command git fetch upstream pull/$1/head:qa_pr_$1 && git checkout qa_pr_$1; }

### python
alias python=python3
alias py=python3
alias lint='tox -e lint'
alias gop='cd $PYCKETPATH'
export LIBJUJU_PATH=$WORK/python-libjuju
alias cdp='cd $PYCKETHOME'

alias a='cd /mnt/nfs_share/pycket-performance/analysis/plots'

alias gr='grep -rn $1'
pgr () { grep -rn "$1" --exclude-dir=.tox --include \*.py ;}
ggr () { grep -rn "$1" --include \*.go ;}

# alias juju_python='python -i $LIBJUJU_PATH/juju_console.py -m asyncio'
# alias jpython=juju_python

### go
# alias gtv='go test -gocheck.v ./...'
# alias gtvch='go test -v ./charmhub/... -check.v -tags="integration" -gocheck.f ClientSuite'
# alias gtvsingle='go test -gocheck.v -gocheck.f'
# alias gtvr='go test -gocheck.v -race ./...'
# alias gtvv='go test -gocheck.vv ./...'
# alias gtvvf='go test -gocheck.vv -gocheck.f'
# alias gtvwf='go test -gocheck.v -check.work -gocheck.f'
# alias gcheck='make simplify && STATIC_ANALYSIS=1 make pre-check'


# alias gtv='go test -gocheck.v ./...'
# alias gtvf='go test -gocheck.v -gocheck.f'
# alias gtvr='go test -gocheck.v -race ./...'
# alias gtvv='go test -gocheck.vv ./...'
# alias gtvvf='go test -gocheck.vv -gocheck.f'
# alias gtvwf='go test -gocheck.v -check.work -gocheck.f'
# check.work prevents from temporary stuff to be removed after test

### SNAP SERVICES
# alias senable='sudo snap enable $1'
# alias sdisable='sudo snap disable $1'


EDITOR='nvim'
# export KUBE_EDITOR='emacs'
# alias distro='distro-info -f --all'

alias sign='touch /tmp/test.txt && gpg --sign --default-key caner@dericilab.live /tmp/test.txt'

############################################## HACKS AND SHIT #######################################

export GPG_TTY=$(tty)


############################################## KUBERNETES STUFF #######################################

export DOCKER_BUILDKIT=1
export NFS_DIR=/mnt/research_storage/
export CROOM=$NFS_DIR/pycket-performance/control-room
export BROOM=$NFS_DIR/benchmarks
