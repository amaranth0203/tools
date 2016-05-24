#!/usr/bin


if [ $# -ne 2 ]
then
    echo "[+] usage : bash $0 script_file_name output_file_name"
    echo '    need a script name and a output file name'
    echo '    both WILL BE OVERIDED'
    exit
fi


echo "echo ' ' > $2 " > $1
cms machines 2>&1 | grep connected | awk -v output_name="$2" '{
    for( i = 1 ; i < NF ; i++ ) {
        printf "cms -i %s shell '\''ifconfig'\'' | grep inet | grep -v inet6 | grep -v \"127.0.0.1\" >> %s\n" , $i , output_name
        printf "cms -i %s shell '\''cat /etc/passwd'\'' | grep opt >> %s\n" , $i , output_name
    }
}' | tee -a $1