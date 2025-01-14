# git
alias g='git'
alias ga='git add'
alias gd='git diff'
alias gdc='git diff --cached'
alias gs='git status'
alias gp='git push'
alias gb='git branch'
alias gst='git status'
alias gco='git checkout'
alias gf='git fetch'
alias gci='git commit'
alias gcia='git commit --amend'
alias gl='git log'
alias ggr="git log --all --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative"
alias gsr='gst && echo && ggr'
alias gres='git reset'

# shell
alias lh='ls -lah'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# dstat
alias dstata='dstat -tlcmgdr --socket --tcp -n'

# tail
alias tlf='tail -F'

# watch
alias watch='watch '

# alp
alias al='sudo alp ltsv -c ~/alp.yml'
alias al_bak='sudo alp ltsv -c ~/alp.yml --file /var/log/nginx/access_bak.log'
# alias als='alp ltsv -c ~/alp.yml | slackcat -t -c cancer_acropolis -n alp.txt'
alias als='sudo alp ltsv -c ~/alp.yml > alp-result.txt && ~/upload_file_slack.sh alp-result.txt isucon && cat alp-result.txt && rm -f alp-result.txt'
alias als_bak='sudo alp ltsv -c ~/alp.yml --file /var/log/nginx/access_bak.log > alp-result.txt && ~/upload_file_slack.sh alp-result.txt isucon && cat alp-result.txt && rm -f alp-result.txt'

# pt-query-digest
alias pt='sudo pt-query-digest --limit 10 --report-format profile,query_report /var/log/mysql/slow.log | less'
alias pt_bak='sudo pt-query-digest --limit 10 --report-format profile,query_report /var/log/mysql/slow_bak.log | less'
# alias pts='sudo pt-query-digest --limit 10 --report-format profile,query_report /var/log/mysql/slow.log | slackcat -c cancer_acropolis -n slowlog.txt'
# alias pts='sudo pt-query-digest --limit 10 --report-format profile,query_report /var/log/mysql/slow.log ~/alp.yml > pt-result.txt && ~/upload_file_slack.sh pt-result.txt isucon && cat pt-result.txt && rm -f pt-result.txt'
alias pts_bak='sudo pt-query-digest --limit 10 --report-format profile,query_report /var/log/mysql/slow_bak.log ~/alp.yml > pt-result.txt && ~/upload_file_slack.sh pt-result.txt isucon && cat pt-result.txt && rm -f pt-result.txt'

alias pts="jq -s 'group_by(.statement) | map({statement: .[0].statement, total_query_time: (map(.query_time) | add)}) | sort_by(.total_query_time) | reverse | map([(.total_query_time|tostring), .statement]) | .[] | @tsv' tmp/sqlite3.log | column -t -s $'\t' > pt-result.txt && ~/upload_file_slack.sh pt-result.txt isucon && cat pt-result.txt && rm -f pt-result.txt"

# pprof
alias pp='go tool pprof -http=":1234" ~/pprof/pprof.pb.gz'
alias pp_bak='go tool pprof -http=":1234" ~/pprof/pprof_bak.pb.gz'
# alias pps='go tool pprof -png -output ~/pprof/pprof.png http://localhost:6060/debug/pprof/profile && slackcat -c cancer_acropolis -n pprof.png ~/pprof/pprof.png'
alias pps='go tool pprof -png -output pprof.png ~/pprof/pprof.pb.gz && ~/upload_file_slack.sh pprof.png isucon && rm -f pprof.png'
alias pps_bak='go tool pprof -png -output pprof.png ~/pprof/pprof_bak.pb.gz && ~/upload_file_slack.sh pprof.png isucon && rm -f pprof.png'
alias ppb='go tool pprof -http=":1234" http://localhost:6060/debug/pprof/profile'

alias fgp='go tool pprof -http=":1235" ~/pprof/fgprof.pb.gz'
alias fgp_bak='go tool pprof -http=":1235" ~/pprof/fgprof_bak.pb.gz'

# app
alias deploy='~/deploy.sh'
alias applog='sudo journalctl -u $APP_SERVICE_NAME'

# systemctl
alias sc='sudo systemctl'
alias scl='sudo systemctl list-unit-files --type=service'
alias scla='sudo systemctl list-units --type=service --state=running'
alias scs='sudo systemctl status'
alias scr='sudo systemctl restart'
alias scsn='sudo systemctl status nginx'
alias scrn='sudo systemctl restart nginx'
alias scsm='sudo systemctl status mysql'
alias scrm='sudo systemctl restart mysql'
alias scss='sudo systemctl status $APP_SERVICE_NAME'
alias scrs='sudo systemctl restart $APP_SERVICE_NAME'


# basic
alias la='ls -la'
alias ll='ls -l'
alias lh='ls -lah'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
# sudo の後のコマンドでエイリアスを有効にする
alias sudo='sudo '


# dotfiles
alias dotfiles="cd $DOTPATH"
alias srcrc="if [ -e ~/.${SHELL##*/}rc ]; then . ~/.${SHELL##*/}rc; fi"

# ruby, rails
alias be='bundle exec'

# git
## status
alias gst="git status"
## log
alias gl="git log"
## log graph
alias ggr="git gr"
## status and log graph
alias gsr="gst && echo && ggr"
## clear unused branches
alias gbrcl="git branch --merged | grep -v '*' | xargs git branch -d"
## reset modes of the files
alias gprst="git diff --numstat | awk '{if ((\$1 == \"0\" && \$2 == \"0\") || (\$1 == \"-\" && \$2 == \"-\")) print \$3}' | xargs git checkout HEAD"
## word-by-word diff
alias gdf="git diff"
alias gdfca="git dfca"
alias gdfw="git dfw"
alias gdfwca="git dfwca"
alias gsh="git show"
alias gshw="git shw"
## push
alias gpo="git push -u origin"
## copy current branch
alias cpgbr="git rev-parse --abbrev-ref HEAD | tr -d '\n' | pbcopy"
## ghq list
alias glp='cd $(ghq root)/$(ghq list | peco)'

# grep
alias grep='grep --color=auto'

# docker
alias dcm='docker compose'
alias dcmr='docker compose run --rm'

# dstat
alias dstata='dstat -tlcmgdr --socket --tcp -n'

# linux
alias osstats='cat /etc/redhat-release /proc/version /proc/cpuinfo /proc/meminfo && echo "\n=====\n" && lscpu && echo "\n=====\n" && df -h'

# network
alias localips="ip addr | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*'"
alias globalip="curl inet-ip.info"

# tail
alias tlf='tail -F'

# python
alias jnb='jupyter notebook'
alias pyex='PYTHONPATH=. python'
alias pri='poetry run invoke'
alias prp='poetry run poe'

# terraform
alias tf="terraform"
alias tfi="terraform init"
alias tfp="terraform plan"
alias tfv="terraform validate"
alias tff="terraform fmt -recursive"
alias tg="terragrunt"
alias tgi="terragrunt init"
alias tgp="terragrunt plan"

# kubernetes
alias kgponame="kgpo -o go-template --template '{{(index .items 0).metadata.name}}'"
alias kgponamel="kgpo -o go-template --template '{{(index .items 0).metadata.name}}' -l"

# completion
alias watch='watch '

# aws
alias awsme='aws sts get-caller-identity'
