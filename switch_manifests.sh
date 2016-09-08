#!/usr/bin/env bash

# detect xml files in .repo/manifests/
# 
# then switch project manifest.xml
# to the xml detected
# by using command repo init xxx -m target.xml
# 
#             qiyunhu
#             2016-08-21


update_command="repo init -u ssh://$USER@smartgit:29418/VivoCode/manifest"
proj=$(pwd | awk -F '/' '{print $NF}')
target=""

# 1. check ssh identity and $w
cat ~/.ssh/id_rsa.pub | grep $USER > /dev/null
if [ $? -ne 0 ]
then
    echo '[-] switch ssh to self first'
    exit
fi
if [ $w != $(pwd) ]
then
    echo '[-] cd $w first'
    exit
fi
# 1. check ssh identity and $w ends

# 2. update repo 
while true
do
    read -p "[+] update repo ? ( default : n ) [y/n] " yn
    case $yn in
        [Yy]* ) 
            echo $update_command
            eval $update_command 
            break
            ;;
        * ) 
            break
            ;;
    esac
done
# 2. update repo ends

# 3. check for proj folder in .repo/manifests/
while true
do

    if [ -d "$(pwd)/.repo/manifests/$proj" ]
    then
        target="$(pwd)/.repo/manifests/$proj"
        echo "[+] $target found"
        break
    fi
    echo "[-] directory $(pwd)/.repo/manifests/$proj not exists"

    proj=$(echo $proj | sed -e 's/A//g')
    if [ -d "$(pwd)/.repo/manifests/$proj" ]
    then
        target="$(pwd)/.repo/manifests/$proj"
        echo "[+] $target found"
        break
    fi
    echo "[-] directory $(pwd)/.repo/manifests/$proj not exists"

    read -p "[+] proj name in manifests ? " proj
done
# 3. check for proj folder in .repo/manifests/ ends

# 4. DailyTest or SystemTest ? [d/s]"
while true
do
    read -p "[+] DailyTest or SystemTest ? [d/s] " ds
    case $ds in
        [Dd]* ) 
            target="$target/DailyTest"
            break
            ;;
        [Ss]* ) 
            target="$target/SystemTest"
            break
            ;;
        * ) 
            echo "[-] d* or s*"
            ;;
    esac
done
# 4. DailyTest or SystemTest ? [d/s]" ends

# 5. which version ?
while true
do
    read -p "[+] version ? " version
    ls $target | grep $version | grep -v "vivo" | grep -v "modem"
    if [ $? -ne 0 ]
    then
        echo "[+] version $version not found"
        continue
    fi
    amount=$(ls $target | grep $version | grep -v "vivo" | grep -v "modem" | wc -l )
    if [ $amount -eq 1 ]
    then
        target="$target/$(ls $target | grep $version | grep -v 'vivo' | grep -v 'modem')"
        break
    fi
done
# 5. which version ? ends

target=$(echo $target | awk -F '/' '{printf "%s/%s/%s",$(NF-2),$(NF-1),$NF}')
echo '[+] target command :'
echo $update_command -m $target
eval "$update_command -m $target"

echo '[+] end'
