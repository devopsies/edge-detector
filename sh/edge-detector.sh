#!/bin/sh

read LINE

PREV=""

for CUR in $LINE
do
    if [ -z "$PREV" ] ; then
        printf "0"
    elif [ $(($CUR-$PREV)) -gt "10" ] || [ $(($CUR-$PREV)) -lt "-10" ]; then
        printf " 1"
    else
        printf " 0"
    fi
    PREV=$CUR
done

printf "\n"