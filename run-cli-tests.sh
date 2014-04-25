#!/bin/bash

MAINJS="./main.js"
MYMODULE="./node_modules/my-module/"
WATCHBUNDLE="watchBundle.css"
JSBUNDLE="jsBundle.js"
CSSBUNDLE="cssBundle.css"
#TMPLBUNDLE="tmplBundle.tmpl"
DEBUG=""

while getopts "hdc" arg
do
    case $arg in
	\?|h)
	    echo "$0 -hdc"
	    echo "  -h: this help menu."
	    echo "  -c: clean up old bundle files and exit."
	    echo "  -d: run the tests with debugging."
	    echo "    : without arguments runs the suite without debugging."
	    exit 0
	    ;;
	c)
	    rm $WATCHBUNDLE $JSBUNDLE $CSSBUNDLE $TMPLBUNDLE
	    exit 0
	    ;;
	d)
	    DEBUG="-d"
	    ;;
    esac
done

cli-tests/cli-tests.sh $DEBUG \
    -m $MAINJS \
    -n $MYMODULE \
    -w $WATCHBUNDLE \
    -j $JSBUNDLE \
    -c $CSSBUNDLE \
 #   -t $TMPLBUNDLE

exit 0
