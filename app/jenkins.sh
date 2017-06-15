#!/bin/bash

# function is here
usage()
{
    echo "Usage:"
    echo "jenkins start/stop/restart"
    echo
}

# environment variables
export JENKINS_HOME=~/.jenkins
# enable tls protocol
JAVA_ARGS="-Dmail.smtp.starttls.enable=true -Dmail.debug=true"

if [ $# -eq 0 ] || [ $# -gt 1 ]
then
    usage
    exit
fi

case $1 in
    start)
        (nohup java $JAVA_ARGS -jar jenkins.war --httpPort=8081 --controlPort=8001 > ./jenkins.log 2>&1) &

        sleep 3

        ps aux | grep jenkins | grep 8081 > /dev/null
        if [ $? -ne 0 ]
        then
            echo "jenkins server start failed, please check jenkins.log!"
        else
            echo "jenkins started!"
        fi
        ;;
    stop)
        ps aux | grep 8001 | grep jenkins > /dev/null
        if [ $? -ne 0 ]
        then
            echo "jenkins server not running, please start first!"
        else
            java -cp $JENKINS_HOME/war/winstone.jar winstone.tools.WinstoneControl shutdown --host=localhost --port=8001
        fi
        ;;
    restart)
        ps aux | grep 8001 | grep jenkins > /dev/null
        if [ $? -ne 0 ]
        then
            echo "jenkins server not running, please start first!"
        else
            java -cp $JENKINS_HOME/war/winstone.jar winstone.tools.WinstoneControl reload: --host=localhost --port=8001
        fi
        ;;
    *)
        echo "action not supported!"
        exit 1
        ;;
esac

exit 0

