# Sample .bashrc for SuSE Linux
# Copyright (c) SuSE GmbH Nuernberg

test -s ~/.alias && . ~/.alias || true


if [[ $- != *i* ]] ; then
   return
fi

[[ -f /etc/DIR_COLORS ]] && eval $(dircolors -b /etc/DIR_COLORS)
[[ -f ~/.dir_colors   ]] && eval $(dircolors -b ~/.dir_colors)
[[ -f ~/.functions    ]] && source ~/.functions
[[ -f ~/.passwd       ]] && source ~/.passwd

# =======================================================================
export PATH=$HOME/local/bin:$HOME/.local/bin/:~/bin/:$PATH:/opt/java/jre/bin/:/sbin/:/usr/sbin
export PYTHONDOCS=/usr/share/doc/python/html/
export VISUAL="vim"
export EDITOR="vim"
export LANG="zh_CN.UTF-8"

# for extra includes and libs
export CPATH=$HOME/local/include:$CPATH
export LD_LIBRARY_PATH=$HOME/local/lib/:$LD_LIBRARY_PATH
#export LDFLAGS=$HOME/local/lib/:$LDFLAGS

#export LC_ALL="zh_CN.UTF-8"
#export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=lcd'

# fix the io-charset problem with zip
#export UNZIP="-O CP936"
#export ZIPINFO="-O CP936"


# Alias Commands
# =======================================================================
alias v='vim'
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
alias vv='vim ~/.vimrc'
alias vb='vim ~/.bashrc'
alias pyc_clear="find . -name '*.pyc' | xargs rm -v"

# for ruby gem
alias gem='sudo gem'

# this may help to make some secure on operation
#alias rm='rm -I'

# for some apps
alias offscreen='xset dpms force off'
alias mplayer='mplayer -prefer-ipv6 '
alias mp="mplayer"
alias pb="pastebinit"
alias ccal='ccal -u'
function code_changed_lines() {
    if [ -z "$1" ]; then
        echo "code_changed_lines BASE_VER [TARGET_VER]"
    else
        echo -n "svn code changed lines ... "
        svn diff -r$1:${2:-HEAD} |grep "^+" |grep -v "^+++"|sed 's/^.//'|sed '/^$/d'|wc -l
    fi
}

function vsdiff() {
    if [ -d .svn ] ; then
        svn diff "$@" | view -
    else
        git diff "$@" | view -
    fi
}

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
alias scr='screen -d -RR'
alias iomon="iotop -bo | grep -v DISK | awk '\$4 > 100 || \$6 > 100{print}\'"
alias msgstat='msgfmt -cvv --check-accelerators=\& -o /dev/null'
alias qzrestart='(QPATH=$HOME/qzhttp/bin; cd $QPATH; sudo $QPATH/admin.sh restart)'
alias rsync_mysite_without_settings='rsync root@172.25.32.73#36000:/home/dantezhu/release/dgwww/mysite/* . -r --progress --exclude "settings.py"'

# Colorful Promt
#================================================
NONE="\[\e[00m\]"
RED="\[\e[31m\]"
GREEN="\[\e[32m\]"
YELLOW="\[\e[33m\]"
PURPLE="\[\e[34m\]"
BLUE="\[\e[36m\]"
bRED="\[\e[01;31m\]"
bYELLOW="\[\e[01;33m\]"
bPURPLE="\[\e[01;34m\]"
bBLUE="\[\e[01;36m\]"

ps_val(){
    val=$?
    test "$val" != "0" && echo "($val)"
}
ps_git(){
    [ -d .svn ] && echo "(svn)" && exit 0
    which git &>/dev/null
    test $? || return
    bra=`git branch 2>/dev/null | sed -n '/^* /s/^* //p'`
    if [ "x$bra" != "x" ]; then
        mod=":`git status 2>/dev/null | grep -c 'modified:   '`"
        echo "($bra$mod)"
    fi
}

#export PS1="${bRED}\`ps_val\`${BLUE}\h${bPURPLE}|${YELLOW}\W${bRED}\`ps_git\`${bBLUE} \$ ${NONE}"
#export PS1="${bRED}\`ps_val\`${BLUE}\u${PURPLE}|${YELLOW}\W${RED}\`ps_git\`${BLUE} \$ ${NONE}"
#export PS1="${bRED}\`ps_val\`${BLUE}\t${PURPLE}|${YELLOW}\W\`ps_git\`\$ ${NONE}"
export PS1="${bRED}\`ps_val\`${BLUE}\u ${YELLOW}\W${RED}\`ps_git\` \$ ${NONE}"

#export PS1='\[\e[36m\]`ps_val`\$ \[\e[0m\]'
export PS1="${BLUE}\t${bPURPLE}|${YELLOW}\W${bBLUE}\$ ${NONE}"
#if [ "${TERM/screen}" != "${TERM}" ] ; then
    #export PS1="\`ps_val)\t|${YELLOW}\W${bRED}\$(ps_git)${bBLUE} \$ ${NONE}"
#fi

#PROMPT_COMMAND='RET=$?; if [[ $RET -eq 0 ]]; then echo -ne "\033[0;32m$RET\033[0m ;)"; else echo -ne "\033[0;31m$RET\033[0m ;("; fi; echo " "'

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
    alias v=_v
    alias banjuan='ssh banjuan.net'
    alias kk='konqueror'
    alias ff='firefox'
fi

# Functions
# =======================================================================
function _v() {
    CMD="/usr/bin/vim"
    if [[ ! -z "$1" ]] ; then
        NEW=$(echo "$1" | sed -n 's@^/etc/@@p')
        [ ! -z "$NEW" ] && CMD="sudo $CMD"
    fi
    $CMD $@
}
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

test -f $HOME/.xprofile && source $HOME/.xprofile || true
### chsdir start ###
if [ -f $HOME/bin/chs_completion ]; then
    #export CHSDIR="{'n':'l'}"
    PATH=$PATH:$HOME/bin
    source $HOME/bin/chs_completion
    complete -o filenames -F _filedir_xspec file
fi
### chsdir finish. ###
export PATH=${PATH/.:/}
