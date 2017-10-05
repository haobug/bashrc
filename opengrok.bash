. ~/.bashrc.d/tomcat.bash
export OPENGROK_TOMCAT_BASE=$CATALINA_BASE
export OPENGROK_TOMCAT_BASE=$CATALINA_HOME

export OPENGROK_FLUSH_RAM_BUFFER_SIZE="-m 256"
export OPENGROK_VERBOSE=true
export OPENGROK_INSTANCE_BASE=${HOME}/opengrok
export PATH=/opt/opengrok/bin:$PATH
