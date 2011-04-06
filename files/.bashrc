system_name=`uname -s`

. ~/.aliases/colours
. ~/.ps1_color

#git_piece='$(__git_ps1 " \[$color_red\]%s\[$color_none\]")'
date_piece="\[${color_gray}\]\$(date '+%a %H:%M:%S')\[${color_none}\]"
export PS1="${date_piece} \u\[${color_ps1}\]@\[${color_none}\]\h \[${color_gray}\]\w\[${git_piece}\]\n\[${color_ps1}\]\$\[${color_none}\] "
umask 022

if [ $system_name == 'Linux' ]; then
  [ -f /etc/bash_completion ] && . /etc/bash_completion

  export EDITOR='vim'
else
  [ -f /opt/local/etc/bash_completion ] && . /opt/local/etc/bash_completion

  export EDITOR='mate -w'
fi

export ARCHFLAGS='-arch i386'
export MAKEFLAGS='-j4'
#export RUBYLIB="lib:test:$RUBYLIB"
#export GEMS="`gem env gemdir`/gems"
export HISTSIZE=1000000

bind "set show-all-if-ambiguous On"

#shopt -s globstar

# coloured ls
if [ "$TERM" != "dumb" ]; then
  if [ $system_name == 'Linux' ]; then
    color_option='--color=auto'

    alias du='du -k --max-depth=1'
  else
    color_option='-G'

    alias du='du -k -d1'
    alias top='top -o cpu'

    alias vi='mate'
  fi

#alias ls="ls --color=auto" not necessary in Arch Linux
alias p="pacman" #timesaving!!
alias p="yaourt" #even more timesaving :))
alias ll="ls -lh"
alias la="ls -a"
alias exit="clear; exit"
alias x="startx"
alias pacsearch="pacman -Sl | cut -d' ' -f2 | grep " #lets you search through all available packages simply using 'pacsearch packagename'
alias pacup="sudo pacman -Syu" # sudo pacman -Syu by typing pacup (sudo must be installed and configured first ;) )
alias pac="sudo pacman -S" # sudo pacman -S by typing pac (sudo must be installed and configured first ;) )
# colorized pacman output with pacs alias:
alias pacs="pacsearch"

pacsearch () {
       echo -e "$(pacman -Ss $@ | sed \
       -e 's#core/.*#\\033[1;31m&\\033[0;37m#g' \
       -e 's#extra/.*#\\033[0;32m&\\033[0;37m#g' \
       -e 's#community/.*#\\033[1;35m&\\033[0;37m#g' \
       -e 's#^.*/.* [0-9].*#\\033[0;36m&\\033[0;37m#g' )"
}

PS1='\[\e[0;33m\]\t \[\e[0;31m\]\u@\h \[\e[1;34m\]\w \[\e[0;0m\]\$ '

export XMODIFIERS="@im=fcitx"
export QT_IM_MODULE=xim
export GTK_IM_MODULE=xim

  . ~/.scripts/j.sh

else
  # TODO use path_helper to do this properly
  export PATH=/opt/local/bin:$PATH
fi

alias df='df -h'
alias less='less -R'

. ~/.aliases/git
. ~/.aliases/svn
. ~/.aliases/commands
