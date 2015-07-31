#!/bin/sh

DIR=`dirname $0`

if [ -z "$1" ]; then
    echo USAGE: $0 path/to/php/files
    exit 1
fi

$DIR/bin/phpcs -p --ignore=css,js --report-width=100 --standard=$DIR/code_standard.xml "$@"
exit $?
