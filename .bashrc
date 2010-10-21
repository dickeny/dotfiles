
if [[ $- != *i* ]] ; then
   return
fi

[[ -f /etc/DIR_COLORS ]] && eval $(dircolors -b /etc/DIR_COLORS)
[[ -f ~/.dir_colors   ]] && eval $(dircolors -b ~/.dir_colors)
[[ -f ~/.functions    ]] && source ~/.functions

# =======================================================================
export PATH=~/local/bin/:~/bin/:$PATH:/opt/java/jre/bin/
export PYTHONDOCS=/usr/share/doc/python/html/
export VISUAL="vim"
export EDITOR="vim"
export LANG="zh_CN.UTF-8"
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
alias qzrestart='(QPATH=$HOME/qzhttp/bin; cd $QPATH; sudo $QPATH/admin.sh restart)'
alias rsync_mysite_without_settings='rsync root@172.25.32.73#36000:/home/dantezhu/release/dgwww/mysite/* . -r --progress --exclude "settings.py"'

# Colorful Promt
#================================================
NONE='\[\e[00m\]'
RED='\[\e[31m\]'
GREEN='\[\e[32m\]'
YELLOW='\[\e[33m\]'
PURPLE='\[\e[34m\]'
BLUE='\[\e[36m\]'
bRED='\[\e[01;31m\]'
bYELLOW='\[\e[01;33m\]'
bPURPLE='\[\e[01;34m\]'
bBLUE='\[\e[01;36m\]'

ps_val(){
    val=$?
    test "$val" != "0" && echo "($val)"
}
ps_git(){
    which git
    test $? && return
    bra=`git branch 2>/dev/null | sed -n '/^* /s/^* //p'`
    if [ "x$bra" != "x" ]; then
        mod=":`git status 2> /dev/null | grep -c 'modified:   '`"
        echo "($bra$mod)"
    fi
}

export PS1="${bRED}\`ps_val\`${BLUE}\u${bPURPLE}|${YELLOW}\W ${bYELLOW}\`ps_git\`${bBLUE}\$ ${NONE}"


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

    function v() {
        CMD="/usr/bin/vim"
        if [[ ! -z "$1" ]] ; then
            NEW=$(echo "$1" | sed -n 's@^/etc/@@p')
            [ ! -z "$NEW" ] && CMD="sudo $CMD"
        fi
        $CMD $@
    }

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

