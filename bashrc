# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

tty -s && echo `ifconfig|grep "inet addr"|grep -v "127.0.0.1"|cut -d'B' -f1`

# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi

# history set begin
shopt -s histappend
export HISTCONTROL=ignoredups
export HISTIGNORE="[   ]*:&:bg:fg:exit"
# history set end

export PS1="\[\033[0;31m\][\w]\[\033[0m\] "

#export DISPLAY=10.32.4.200:0.0

HISTTIMEFORMAT="%y/%m/%d %T "

export EDITOR="emacs"

alias h='history'
alias c='cd'
alias u='cd ..'
alias rm='rm -rf'
alias j=jobs
alias lt='ls -lt|head -n 20'
#alias e='$HOME/local/bin/emacs -nw'
#alias e='/usr/local/bin/emacsclient -t '
alias c+='chmod +x'
alias k="kill -9 "

ls_man() {
    /usr/local/bin/emacsclient -t -e "(woman \"$1\")"
}
alias man=ls_man
#export CPLUS_INCLUDE_PATH
#export LD_LIBRARY_PATH
#export C_INCLUDE_PATH
#export CPLUS_INCLUDE_PATH
#export OBJC_INCLUDE_PATH
#export MANPATH

#===============================alias ==================================================
alias ll='ls -l -h'

alias tags='find . -name "*.[cChHp]*" -print| etags -'

alias cc='rm *~'

alias p='ps -A -o user,pid,ppid,tty,stat,args,wchan'

#============================hadoop================================
export JAVA_HOME=/usr/ali/java/
export HADOOP_HOME=/home/shuai.li/local/hadoop-0.20.2-CDH3B4/
export CLASSPATH=/home/shuai.li/local/hadoop-0.20.2-CDH3B4//hadoop-ant-0.20.2-CDH3B4.jar:/home/shuai.li/local/hadoop-0.20.2-CDH3B4//hadoop-test-0.20.2-CDH3B4.jar:/home/shuai.li/local/hadoop-0.20.2-CDH3B4//hadoop-core-0.20.2-CDH3B4.jar:/home/shuai.li/local/hadoop-0.20.2-CDH3B4//hadoop-tools-0.20.2-CDH3B4.jar:/home/shuai.li/local/hadoop-0.20.2-CDH3B4//hadoop-examples-0.20.2-CDH3B4.jar:/home/shuai.li/local/hadoop-0.20.2-CDH3B4//lib/aspectjrt-1.6.5.jar:/home/shuai.li/local/hadoop-0.20.2-CDH3B4//lib/aspectjtools-1.6.5.jar:/home/shuai.li/local/hadoop-0.20.2-CDH3B4//lib/commons-cli-1.2.jar:/home/shuai.li/local/hadoop-0.20.2-CDH3B4//lib/commons-codec-1.4.jar:/home/shuai.li/local/hadoop-0.20.2-CDH3B4//lib/commons-daemon-1.0.1.jar:/home/shuai.li/local/hadoop-0.20.2-CDH3B4//lib/commons-el-1.0.jar:/home/shuai.li/local/hadoop-0.20.2-CDH3B4//lib/commons-httpclient-3.0.1.jar:/home/shuai.li/local/hadoop-0.20.2-CDH3B4//lib/commons-logging-1.0.4.jar:/home/shuai.li/local/hadoop-0.20.2-CDH3B4//lib/commons-logging-api-1.0.4.jar:/home/shuai.li/local/hadoop-0.20.2-CDH3B4//lib/commons-net-1.4.1.jar:/home/shuai.li/local/hadoop-0.20.2-CDH3B4//lib/core-3.1.1.jar:/home/shuai.li/local/hadoop-0.20.2-CDH3B4//lib/hadoop-fairscheduler-0.20.2-CDH3B4.jar:/home/shuai.li/local/hadoop-0.20.2-CDH3B4//lib/hsqldb-1.8.0.10.jar:/home/shuai.li/local/hadoop-0.20.2-CDH3B4//lib/jackson-core-asl-1.5.2.jar:/home/shuai.li/local/hadoop-0.20.2-CDH3B4//lib/jackson-mapper-asl-1.5.2.jar:/home/shuai.li/local/hadoop-0.20.2-CDH3B4//lib/jasper-compiler-5.5.12.jar:/home/shuai.li/local/hadoop-0.20.2-CDH3B4//lib/jasper-runtime-5.5.12.jar:/home/shuai.li/local/hadoop-0.20.2-CDH3B4//lib/jets3t-0.6.1.jar:/home/shuai.li/local/hadoop-0.20.2-CDH3B4//lib/jetty-6.1.26.jar:/home/shuai.li/local/hadoop-0.20.2-CDH3B4//lib/jetty-servlet-tester-6.1.26.jar:/home/shuai.li/local/hadoop-0.20.2-CDH3B4//lib/jetty-util-6.1.26.jar:/home/shuai.li/local/hadoop-0.20.2-CDH3B4//lib/jsch-0.1.42.jar:/home/shuai.li/local/hadoop-0.20.2-CDH3B4//lib/junit-4.5.jar:/home/shuai.li/local/hadoop-0.20.2-CDH3B4//lib/kfs-0.2.2.jar:/home/shuai.li/local/hadoop-0.20.2-CDH3B4//lib/log4j-1.2.15.jar:/home/shuai.li/local/hadoop-0.20.2-CDH3B4//lib/mockito-all-1.8.2.jar:/home/shuai.li/local/hadoop-0.20.2-CDH3B4//lib/oro-2.0.8.jar:/home/shuai.li/local/hadoop-0.20.2-CDH3B4//lib/servlet-api-2.5-20081211.jar:/home/shuai.li/local/hadoop-0.20.2-CDH3B4//lib/servlet-api-2.5-6.1.14.jar:/home/shuai.li/local/hadoop-0.20.2-CDH3B4//lib/slf4j-api-1.4.3.jar:/home/shuai.li/local/hadoop-0.20.2-CDH3B4//lib/slf4j-log4j12-1.4.3.jar:/home/shuai.li/local/hadoop-0.20.2-CDH3B4//lib/xmlenc-0.52.jar

#=========  disable CTRL+S  ============
stty ixany
stty ixoff -ixon