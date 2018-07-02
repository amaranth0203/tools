#!/usr/bin/env bash

#
#  wrapper of 
#    awk -F"xxx" '{print $x}'
#
#  command | c [F split] column
#
#  command | c row
#    print column which number equl column
#  command | c F split row
#    print column which number equl column and split with split
#
#                               qiyunhu
#                               2016.12.13
#


split=""
idxs=()
re='^[0-9]+$'
main( ) {
    check_input $@
    generate_output
}
generate_output( ) {
    if [[ "$split" == "" ]]
    then
        while read "$@" line
        do
            for i in "${idxs[@]}"
            do
                printf "%s" "$line" |
                    awk -v var=$i '{print $var}'
            done
        done 
    else
        while read "$@" line
        do
            for i in "${idxs[@]}"
            do
                printf "%s" "$line" |
                    awk -F"$split" -v var=$i '{print $var}'
            done
        done 
    fi
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
    if [[ "$1" == "F" ]] 
    then
        shift
        split=$1
        shift
    fi
    idxs=( "$@" )
    for idx in "${idxs[@]}"
    do
        if ! [[ $idx =~ $re ]]
        then 
            echo "[-] $idx not a number" >&2 ; exit 1
        fi
    done
}
main $@

