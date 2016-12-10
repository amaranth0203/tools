#!/usr/bin/env bash

# before using repo sync to roll back
# use qyh_repo_rollback init to avoid rebase falied
# after using repo sync to roll back
# use qyh_repo_rollback reset to discard new commit
#     by reset --hard to commit-id in manifest.xml
#
#               qiyunhu
#               2016.10.18

declare -a work_dir=(
    "$w/kernel"
    "$w1"
    "$w1sdk"
    "$w2"
    "$w1/../prebuilt_HY11/"
)

usage( ) {
    echo "$(basename $0) [init|reset]"
    echo "$(basename $0) init - reset to init commit"
    echo "$(basename $0) reset - reset to commit in manifest.xml"
}

main( ) {
    check_pwd_and_input "$@"
    reset_to_first_commit "$@"
    reset_to_commit_in_manifest "$@"
}

check_pwd_and_input( ) {

	# 1. check input arguments
	if [ "$1" != "init" ] && [ "$1" != "reset" ] ; then
	    usage "$@"
	    exit -1
	fi
	
	# 2. check ssh identity and $w
	if [ $w != $(pwd) ]
	then
	    echo '[-] cd $w first'
	    exit -1
	fi
}

reset_to_first_commit( ) {
    if [ "$1" != "init" ] ; then
       return
    fi
    for d in "${work_dir[@]}" ; do
        echo $d
		cd $d
		init_commit_id=$(git log | grep -r "^commit " | tail -n1 | awk '{print $NF}')
		git reset --hard $init_commit_id
    done
}

reset_to_commit_in_manifest( ) {
    if [ "$1" != "reset" ] ; then
        return
    fi
    for(( i = 0 ; i < ${#work_dir[@]} ; i ++ ))
    do
        echo ${work_dir[$i]}
        cd ${work_dir[$i]}
        project_name=$( git config --local remote.origin.url | awk -F "29418/" '{print $2}' )
        manifest_commit_id=$( python $( dirname $0 )/_parse_xml.py $w/.repo/manifest.xml $project_name )
        git reset --hard $manifest_commit_id
    done
}

main "$@"
echo '[+] end'
