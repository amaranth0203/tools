#!/usr/bin/env bash

#
#  command | c [row] [column] [split]
#  command | c :
#    only add a line number before each line of output of command
#  command | c row
#    print line which number equl row
#  command | c row column
#    print line which number equl row and column equal column( awk without -F )
#  command | c row column split
#    print line which number equl row and column equal column and split with split
#
#  example : 
#    assume command tete output is :
#      aaa_bbb ccc_ddd
#      eee_fff ggg_hhh
#    then
#      tete | c 
#      1 aaa_bbb ccc_ddd
#      2 eee_fff ggg_hhh
#      tete | c 2
#      eee_fff ggg_hhh
#      tete | c 2 2
#      ggg_hhh
#      tete | c 2 2 _
#      fff ggg
#
#    echo aaaa | c 1 | c 1 | c 1 | c 1  also works
#
#                               qiyunhu
#                               2016.12.10
#

row=0
column=0
split=""
main( ) {
    if [ ${#} -eq 0 ]
    then
        print_line_number
    else
        dump_parameter $@
        deal_with_pipe_input 
    fi
}
print_line_number( ) {
    idx=1
    while read "$@" line
    do
        printf '%d %s\n' "$idx" "$line"
        (( idx++ ))
    done
}
dump_parameter( ) {
    if [ ${#} -gt 3 ]
    then
        echo '[-] too much parameters'
        exit 1
    fi
    row=$1
    shift
    if [ ${#} -gt 0 ]
    then
        column=$1
        shift
    fi
    if [ ${#} -gt 0 ]
    then
        split=$1
        shift
    fi
}
deal_with_pipe_input( ) {
    i=1
    while read "$@" line
    do
        if [ $i -eq $row ]
        then
            if [[ "$split" == "" ]]
            then
                echo $line | awk -v var=$column '{print $var}'
            else
                echo $line | awk -F"$split" -v var=$column '{print $var}'
            fi
        fi
        i=$(($i+1))
    done
}
main $@

