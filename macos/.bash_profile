if [ -s ~/.bashrc ]; then
    source ~/.bashrc
fi

#export JAVA_HOME=$HOME/apps/oracle/jdk/jdk-1.8.0_171
#export JAVA_OPTS="-Djava.net.preferIPv4Stack=true -Dnet.sf.ehcache.skipUpdateCheck=false"

export M2_HOME=$HOME/apps/apache/maven/current
export MVN_OPTS="-Xmx2G -Djava.net.preferIPv4Stack=true -Dnet.sf.ehcache.skipUpdateCheck=false"

export PATH=$HOME/bin:$HOME/apps/vertx/current/bin:/usr/local/bin:/usr/local/sbin:$PATH

export JBAKE_HOME=$HOME/apps/github/jbake/current

# This was necessary to get history workng in High Sierra, have not had to do this prior. This was only necessary after wipe and re-install of High Sierra.
SHELL_SESSION_HISTORY=0

export HISTSIZE='32768'
export HISTFILESIZE="${HISTSIZE}"

export GPG_TTY=$(tty)

