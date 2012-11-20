#!/bin/bash
ADDRESS="127.0.0.1"
PROJECTNAME="cityapp"
PROJECTLOC="/Users/gaopeng/Projects/$PROJECTNAME"
LOGFILE="$PROJECTLOC/logs/guni.log"
DEFAULT_ARGS="--workers=3 --daemon --log-level=debug --log-file=$LOGFILE --bind=$ADDRESS:"
BASE_CMD="gunicorn $PROJECTNAME.wsgi:application $DEFAULT_ARGS"
SERVER1_PORT='8888'
SERVER1_PID="$PROJECTLOC/$SERVER1_PORT.pid"
SERVER2_PORT='8889'
SERVER2_PID="$PROJECTLOC/$SERVER2_PORT.pid"

start_server () {
  if [ -f $1 ]; then
    #pid exists, check if running
    if [ "$(ps -p `cat $1` | wc -l)" -gt 1 ]; then
       echo "Server already running on ${ADDRESS}:${2}"
       return
    fi
  fi
  cd $PROJECTLOC
  echo "starting ${ADDRESS}:${2}"
  $BASE_CMD$2 --pid=$1
}

stop_server (){
  if [ -f $1 ] && [ "$(ps -p `cat $1` | wc -l)" -gt 1 ]; then
    echo "stopping server ${ADDRESS}:${2}"
    kill -9 `cat $1`
    rm $1
  else 
    if [ -f $1 ]; then
      echo "server ${ADDRESS}:${2} not running"
    else
      echo "No pid file found for server ${ADDRESS}:${2}"
    fi
  fi
}

case "$1" in
'start')
  start_server $SERVER1_PID $SERVER1_PORT 
  start_server $SERVER2_PID $SERVER2_PORT
  ;;
'stop')
  stop_server $SERVER1_PID $SERVER1_PORT
  stop_server $SERVER2_PID $SERVER2_PORT
  ;;
'restart')
  stop_server $SERVER1_PID $SERVER1_PORT
  sleep 2
  start_server $SERVER1_PID $SERVER1_PORT
  sleep 2
  stop_server $SERVER2_PID $SERVER2_PORT
  sleep 2
  start_server $SERVER2_PID $SERVER2_PORT
  ;;
*)
  echo "Usage: $0 { start | stop | restart }"
  ;;
esac

exit 0

