#!/usr/bin/env bash

#
#  command | r [row] 
#  command | r :
#    only add a line number before each line of output of command
#  command | r row
#    print line which number equl row
#
#                               qiyunhu
#                               2016.12.13
#

idxs=()
re='^[0-9]+$'
main( ) {
    check_input $@
    generate_output
}
generate_output( ) {
    idx=1
    while read "$@" line
    do
        array_contains idxs $idx && echo $line
        (( idx++ ))
    done 
}
array_contains( ) {
    local array="$1[@]"
    local seeking=$2
    local in=1
    for element in "${!array}"
    do
        if [[ $element == $seeking ]]
        then
            in=0
            break
        fi
    done
    return $in
}
check_input( ) {
    if [ "$#" -eq 0 ] ; then # no input , print indexes
        idx=1
        while read $@ line
        do
            printf '%d %s\n' "$idx" "$line"
            (( idx++ ))
        done
        exit
    else
        idxs=( "$@" )
    fi
    for idx in "${idxs[@]}"
    do
        if ! [[ $idx =~ $re ]]
        then 
            echo "[-] $idx not a number" >&2 ; exit 1
        fi
    done
}
main $@

