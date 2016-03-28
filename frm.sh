#!/bin/bash
mkdir -p ./rsync_blank
rsync --delete-before -a -H -v --progress --stats ./rsync_blank/ $1
rm -rf $1 rsync_blank
