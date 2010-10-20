#!/bin/bash
#=============== configure from gentoo =========================
if [[ $- != *i* ]] ; then
   return
fi

shopt -s checkwinsize
shopt -s histappend

use_color=true
safe_term=${TERM//[^[:alnum:]]/?}   # sanitize TERM
match_lhs=""
[[ -f ~/.dir_colors   ]] && match_lhs="${match_lhs}$(<~/.dir_colors)"
[[ -f /etc/DIR_COLORS ]] && match_lhs="${match_lhs}$(</etc/DIR_COLORS)"
[[ -z ${match_lhs}    ]] \
    && type -P dircolors >/dev/null \
    && match_lhs=$(dircolors --print-database)
[[ $'\n'${match_lhs} == *$'\n'"TERM "${safe_term}* ]] && use_color=true

# Enable colors for ls, etc.  Prefer ~/.dir_colors #64489
if type -P dircolors >/dev/null ; then
    if [[ -f ~/.dir_colors ]] ; then
        eval $(dircolors -b ~/.dir_colors)
    elif [[ -f /etc/DIR_COLORS ]] ; then
        eval $(dircolors -b /etc/DIR_COLORS)
    fi
fi

# Try to keep environment pollution down, EPA loves us.
unset use_color safe_term match_lhs

#      =============== configure from user =========================
# =======================================================================
export PATH=$PATH:/opt/java/jre/bin/:~/bin/
export PYTHONDOCS=/usr/share/doc/python/html/
export VISUAL="vim"
export EDITOR="vim"
#export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=lcd'

# fix the io-charset problem with zip
export UNZIP="-O CP936"
export ZIPINFO="-O CP936"

[ -f ~/.functions ] && source ~/.functions

# Alias Commands
# =======================================================================
alias aria2c='aria2c --file-allocation=none --log-level=warn --summary-interval=0'

# new set some common alias
alias ..='cd ..'
alias ...='cd ../../'
alias ls='LANGUAGE=C ls --color=auto --classify -h'
alias ll='ls -al'
alias df='df -h'
alias fm='free -m'
alias dua='du --max-depth=1 -h'
alias grep='grep --colour=auto'

# for ruby gem
alias gem='sudo gem'

# this may help to make some secure on operation
alias rm='rm -I'

# for some apps
alias offscreen='xset dpms force off'
alias mplayer='mplayer -prefer-ipv6 '
alias mp="mplayer"
alias pb="pastebinit"
alias ccal='ccal -u'

# for some extreme brief command
alias l='ls -a'
alias vi='vim'
alias psg='ps aux|grep '
alias ctagsfull='ctags -R --c++-kinds=+p --fields=+iaS --extra=+q'
alias pyshare='python -m SimpleHTTPServer'

alias kon='konqueror'
alias eth0='grep -E "eth0:.*(up|down)" /var/log/everything.log | tail'
alias webcam='mplayer tv:// -tv driver=v4l2:width=640:height=480:device=/dev/video0 -fps 15 -vf screenshot,mirror -msglevel all=5'
alias y='yaourt'
alias scr='screen -D -RR'
alias iomon="iotop -bo | grep -v DISK | awk '\$4 > 100 || \$6 > 100{print}\'"
alias msgstat='msgfmt -cvv --check-accelerators=\& -o /dev/null'

# Colorful Promt 
# =======================================================================
ps_val(){
    val=$?
    test "$val" != "0" && echo "($val)"
}

ps_git(){
    bra=`git branch 2>/dev/null | sed -n '/^* /s/^* //p'`
    if [ "x$bra" != "x" ]; then
        mod=":`git status 2> /dev/null | grep -c 'modified:   '`"
        echo "($bra$mod)"
    fi
}

ps_ps(){
    if [[ ${EUID} == 0 ]] || [[ "$(hostname)" != "laptop" ]] ; then
        PS_ABC='\[\e[36m\]\u\[\e[0m\]@\[\e[01;31m\]\h\[\e[01;34m\]: \W'
    else
        PS_ABC='\[\e[32m\]\t\[\e[35m\] \W'
    fi
    PS_VAL='\[\e[31;1m\]`ps_val`\[\e[0m\]'
    PS_GIT='\[\e[33;1m\]`ps_git`\[\e[0m\]'
    PS_XYZ='\[\e[01;36m\] \$\[\e[00m\] '
    echo "$PS_VAL$PS_ABC$PS_GIT$PS_XYZ"
}

export PS1="`ps_ps`"

# Settings for Arch Linux
# =======================================================================
test -f /etc/issud && grep 'Arch Linux' /etc/issue -q
if [ $? -eq 0 ] ; then
    # for pacman
    alias pacman='sudo pacman'
    if [ "$(type -p pacman-color)" ] ; then
        alias pacman='sudo pacman-color'
    fi
    if [ "$(type -p powerpill)" ] ; then
        alias pacman='powerpill'
    fi
        
    alias pms='pacman -S'
    alias pmss='pacman -Ss'
    alias pmsi='pacman -Si'
    alias pmqs='pacman -Qs'
    alias pmql='pacman -Ql'
    alias pmqi='pacman -Qi'
    alias pmu='pacman -U'
    alias cfg='find /etc -name "*.pacnew" -or -name "*.pacold"'
fi

# Functions
# =======================================================================
# ex - archive extractor
# usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.xz)   tar xJf $1   ;;
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

cscopefull() {
    test $# -gt 1 && dir="$@" || dir=$PWD
    find $dir -name '*.h' -o -name '*.c' -o -name '*.cpp' -o -name '*.java' -o -name '*.cs' > cscope.files
    cscope -b
}

function v() {
    CMD="/usr/bin/vim"
    if [[ ! -z "$1" ]] ; then
        NEW=$(echo "$1" | sed -n 's@^/etc/@@p')
        [ ! -z "$NEW" ] && CMD="sudo $CMD"
    fi
    $CMD $@
}

