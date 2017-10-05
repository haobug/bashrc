#use sun java
javaver()
{
    java -version
}

export_var()
{
    #sudo ln -vsfT $java_dir /opt/jdk
JAVA_HOME=$java_dir
export JAVA_HOME
JRE_HOME=$JAVA_HOME
export JRE_HOME
CLASS_PATH=${JAVA_HOME}/lib/tools.jar:${JAVA_HOME}/lib/dt.jar:
export CLASS_PATH
export CLASSPATH=$CLASS_PATH:$CLASSPATH
java_path=${JAVA_HOME}/bin
export PATH=$java_path:$PATH
unset java_dir
}

# tricky func
sunjdk8()
{
    java_dir=/opt/jdk1.8.0_91
    export_var
    javaver
}
sunjdk6()
{
    java_dir=/opt/jdk1.6.0_45
    export_var
    javaver
}
openjdk7()
{
    java_dir=/usr/lib/jvm/java-7-openjdk-amd64
    export_var
    javaver
}
openjdk8()
{
    java_dir=/usr/lib/jvm/java-8-openjdk-amd64
    export_var
    javaver
}
alias java6='sunjdk6'
alias java7='openjdk7'
#alias java8='sunjdk8'
alias java8='openjdk8'

alias javaversion='javaver'
#dropbox conflict on frequency saving

JAVA_HOME=/opt/jdk
export_var
