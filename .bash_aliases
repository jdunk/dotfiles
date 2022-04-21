# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    eval "`dircolors -b`"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

alias sudo='sudo '
alias lx='ls -lahp'
alias vi='vim'
alias vim='vim -p'
alias sdr='sudo shutdown -r now'
alias sdh='sudo shutdown -h now'
alias find='find -H'
alias bc='bc -l'
alias kibitz='kibitz -noescape'
alias irssi='TZ="America/Los_Angeles" irssi'
alias screen_size='terminal_size'
alias terminal_size='echo $(tput cols)x$(tput lines)'
alias php-xdebug='php -dxdebug.remote_enable=On -dxdebug.remote_handler=dbgp -dxdebug.remote_host=localhost -dxdebug.remote_port=9000 -dxdebug.remote_autostart=On'
alias phpunit-xdebug="php -d -dxdebug.remote_enable=On -dxdebug.remote_handler=dbgp -dxdebug.remote_host=localhost -dxdebug.remote_port=9000 -dxdebug.remote_autostart=On `which phpunit`"
alias art='php artisan'
alias vu='vagrant up'
alias vh='vagrant halt'
alias vss='vagrant suspend'
alias vr='vagrant resume'
alias vrs='vagrant resume'
alias vrl='vagrant reload'
alias vs='vagrant status'
alias vssh='vagrant ssh'
alias dush='du -sh * .[!.*] 2>/dev/null|sort -hr'
alias nginx-start='sudo service nginx start'
alias nginx-restart='sudo service nginx restart'
alias nginx-status='sudo service nginx status'
alias nginx-stop='sudo service nginx stop'
alias phpfpm-7.3-start='sudo service php7.3-fpm start'
alias phpfpm-7.3-restart='sudo service php7.3-fpm restart'
alias phpfpm-7.3-status='sudo service php7.3-fpm status'

alias ports-services='sudo netstat -tulpn'
alias ports-services-mac='sudo lsof -iTCP -sTCP:LISTEN -n -P'

# git shortcuts
alias gs='git status'
alias gd='git diff'
alias gdc='git diff --cached'
alias ga='git add'
alias gci='GIT_COMMITTER_DATE=$(date -u +"%Y-%m-%dT%H:%M:%SZ") git commit --date=$(date -u +"%Y-%m-%dT%H:%M:%SZ")'
alias gf='git fetch'
alias gco='git checkout'
alias gcb='git checkout -b'
alias gcm='git checkout master'
alias gcom='git checkout master'
alias gcd='git checkout development'
alias gcod='gcd'
alias gmm='git merge master'
alias gmom='git merge origin/master'
alias gbr='git branch'
alias gbn='git rev-parse --abbrev-ref HEAD 2>/dev/null' # Branch Name
alias gps='git push'
alias gpo='git push origin'
alias gpof='git push origin -f'
alias gpod='git push origin --delete'
alias gpob='git push origin `gbn`'
alias gpobn='git push origin `gbn`'
# same, but add tracking
alias gpt='git push -u origin `gbn`'
alias grm='git rebase master'
alias grom='git rebase origin/master'
alias grc='git rebase --continue'
alias gsp='git stash pop'
alias gst='git stash'
alias gsl='git stash list'
alias gss='git stash show -p'
alias gsd='git stash drop'
alias gsd0='git stash drop stash@{0}'
alias gsd1='git stash drop stash@{1}'
alias gsd2='git stash drop stash@{2}'
alias gpl='git pull'
alias gstpp='gst && gpl && gsp'
alias gspp='gstpp'
alias gcmpl='git checkout master && git pull'
alias gr='git rev-parse'
alias grp='git rev-parse'
alias grh='git rev-parse HEAD'
alias gkpl='git co -- package-lock.json' # Kill Package Lock
alias kpl='gkpl'
# gch = git (current|commit) (hash|head)
alias gch='gr HEAD'
# goc = git orphaned commits
alias goc='git fsck --no-reflog | awk '\''/dangling commit/ {print $3}'\'''
# guc = git undo-commit
alias guc='git reset --soft HEAD^'

# git log
alias glg="git log --oneline --graph --decorate --date=short --pretty=format:'%Cblue%cd %C(yellow)%h %C(cyan)[%an]%Creset -%C(auto)%d%Creset %s %Creset'"
# a = all (default is local branch only)
alias glga="git log --oneline --graph --decorate --all --date=short --pretty=format:'%Cblue%cd %C(yellow)%h %C(cyan)[%an]%Creset -%C(auto)%d%Creset %s %Creset'"
# t = time included in date
alias glgt="git log --oneline --graph --decorate --pretty=format:'%Cblue%ci %C(yellow)%h %C(cyan)[%an]%Creset -%C(auto)%d%Creset %s %Creset'"
alias glgat="git log --oneline --graph --decorate --all --pretty=format:'%Cblue%ci %C(yellow)%h %C(cyan)[%an]%Creset -%C(auto)%d%Creset %s %Creset'"
# nd = no date
alias glgnd="git log --oneline --graph --decorate --pretty=format:'%C(yellow)%h %C(cyan)[%an]%Creset -%C(auto)%d%Creset %s %Creset'"
alias glgand="git log --oneline --graph --decorate --all --pretty=format:'%C(yellow)%h %C(cyan)[%an]%Creset -%C(auto)%d%Creset %s %Creset'"

# Way Generators shortcuts
alias g:m='php artisan generate:model'
alias g:mod='g:m'
alias g:c='php artisan generate:controller'
alias g:v='php artisan generate:view'
alias g:s='php artisan generate:seed'
alias g:mig='php artisan generate:migration'
alias g:r='php artisan generate:resource'

# jdunk-specific
alias jdunk-ssh='ssh jared@jdunk.com -p 48006'
alias jdunk-scp-to='jdunk-scp-up'
alias jdunk-scp-from='jdunk-scp-down'

# AWS
alias aws-list-function-names='aws lambda list-functions --query '\''Functions[].FunctionName'\'''
alias aws-list-role-names='aws iam list-roles --query '\''Roles[].RoleName'\'''
