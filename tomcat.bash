export CATALINA_HOME=/opt/tomcat
#export CATALINA_BASE=/var/lib/tomcat7
export CATALINA_BASE=$CATALINA_HOME

restart_tomcat()
{
JAVA_HOME=/opt/jdk1.8.0_91/ # tomcat8 on jdk8
JRE_HOME=$JAVA_HOME
CLASSPATH=${JAVA_HOME}/lib/tools.jar:${JAVA_HOME}/lib/dt.jar:$CLASSPATH
PATH=$JAVA_HOME/bin:$PATH
cd $CATALINA_HOME/bin/
echo Stopping tomcat...
catalina.sh stop
echo Starting tomcat...
catalina.sh start
}


stop_tomcat()
{
JAVA_HOME=/opt/jdk1.8.0_91/ # tomcat8 on jdk8
JRE_HOME=$JAVA_HOME
CLASSPATH=${JAVA_HOME}/lib/tools.jar:${JAVA_HOME}/lib/dt.jar:$CLASSPATH
PATH=$JAVA_HOME/bin:$PATH
cd $CATALINA_HOME/bin/
echo Stopping tomcat...
catalina.sh stop
}

start_tomcat()
{
JAVA_HOME=/opt/jdk1.8.0_91/ # tomcat8 on jdk8
JRE_HOME=$JAVA_HOME
CLASSPATH=${JAVA_HOME}/lib/tools.jar:${JAVA_HOME}/lib/dt.jar:$CLASSPATH
PATH=$JAVA_HOME/bin:$PATH
cd $CATALINA_HOME/bin/
echo Starting tomcat...
catalina.sh start
}
