# Alias
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias ls='ls -al'
alias c='clear'
alias sun='cd ~/projects/sun'
alias prodlib='cd ~/projects/product-library'
alias inv='cd ~/projects/inventory-service'
alias proj='cd ~/projects'

# ifconfig
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en0"
alias ips="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"

# Maven
alias mvn-vulnerability='mvn -Pdep-vuln-check verify -DskipTests'

# Docker alias
alias aws-login='$(aws --profile docker-pull ecr get-login)'
alias intellij_docker='socat TCP-LISTEN:8888,reuseaddr,fork,bind=localhost UNIX-CONNECT:/var/run/docker.sock'

# Application alias
alias wildfly='~/wildfly/current/bin/standalone.sh'
alias wildfly-local='DB_IZETTLE_IP=192.168.99.100 DB_IZETTLE_PORT=5432 wildfly'

# iZettle Servers
alias psql-prod='psql -h 10.48.13.71 -U risk_reader -p 5432 sun'
alias psql-dev='psql -h localhost -p 4420 -U izettle -d sun'
alias psql-test='psql -h localhost -p 5610 -U izettle -d sun'

# Git completion
source ~/.git-completion.bash
source ~/.git-prompt.sh

# SSH Completion
complete -o default -o nospace -W "$(/usr/bin/env ruby -ne 'puts $_.split(/[,\s]+/)[1..-1].reject{|host| host.match(/\*|\?/)} if $_.match(/^\s*Host\s+/);' < $HOME/.ssh/config)" scp sftp ssh

# JAVA 8 Path
export JAVA_HOME=$(/usr/libexec/java_home -v '1.8*')

# Deploy in docker container
alias jboss-cli-docker="jboss-cli.sh --connect controller=local.docker --user=izettle --password=adminadmin -c"
alias deploy-admin-docker="jboss-cli-docker 'deploy ~/projects/sun/izettle-admin/target/izettle-admin-2.0.0-SNAPSHOT.war --force'"
alias deploy-timer-docker="jboss-cli-docker 'deploy ~/projects/sun/izettle-timers/target/izettle-timers-2.0.0-SNAPSHOT.war --force'"
alias deploy-web-docker="jboss-cli-docker 'deploy ~/projects/sun/izettle-web/target/izettle-web-2.0.0-SNAPSHOT.war --force'"
alias deploy-api-docker="jboss-cli-docker 'deploy ~/projects/sun/izettle-api/target/izettle-api-2.0.0-SNAPSHOT.war --force'"

# Docker 
# eval "$(docker-machine env default)"
# aws --profile docker-pull ecr get-login
alias dm-eval='eval $(docker-machine env default)'
alias dm='docker-machine'
alias dm-aws='aws ecr get-login'
alias dc='docker-compose'
alias docker-folder='cd ~/projects/docker/services/deployments/all'
alias docker-setup='sh ~/projects/docker/setup-docker'

#Display
MAGENTA="\[\033[0;35m\]"
YELLOW="\[\033[0;33m\]"
BLUE="\[\033[34m\]"
LIGHT_GRAY="\[\033[0;37m\]"
CYAN="\[\033[0;36m\]"
GREEN="\[\033[0;32m\]"
GIT_PS1_SHOWDIRTYSTATE=true
export LS_OPTIONS='--color=auto'
export CLICOLOR='Yes'
#export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD
export ExFxBxDxCxegedabagacad
export PS1=$LIGHT_GRAY"\h"'$(
    if [[ $(__git_ps1) =~ \*\)$ ]]
    # a file has been modified but not added
    then echo "'$YELLOW'"$(__git_ps1 " (%s)")
    elif [[ $(__git_ps1) =~ \+\)$ ]]
    # a file has been added, but not commited
    then echo "'$MAGENTA'"$(__git_ps1 " (%s)")
    # the state is clean, changes are commited
    else echo "'$CYAN'"$(__git_ps1 " (%s)")
    fi)'$BLUE" \w"$GREEN": "

#if [[ ! $TERM =~ screen ]]; then
    # tmux
#fi;
