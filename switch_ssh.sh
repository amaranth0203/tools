#!/usr/bin/env bash

if [ -f ~/.ssh/self/id_rsa ] ; then
    echo 'switch to self'
    mv ~/.ssh/id_rsa* ~/.ssh/yansizhi
    mv ~/.ssh/self/* ~/.ssh/
elif [ -f ~/.ssh/yansizhi/id_rsa ] ; then
    echo 'switch to yansizhi'
    mv ~/.ssh/id_rsa* ~/.ssh/self
    mv ~/.ssh/yansizhi/* ~/.ssh/
fi
