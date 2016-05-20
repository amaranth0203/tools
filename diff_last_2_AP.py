#!/usr/bin/env python
#-*- coding=utf-8 -*-

def check_pwd( ) :
    import os
    if not os.getcwd( ).strip( '/' ) == os.getenv( 'w' ).strip( '/' ) :
        print( '[-] cd $w first' ) ;
        exit( 1 )

def get_last_two_record( ) :
    try :
        log_file_name = "AP.log"
        with open( log_file_name , "r" ) as f :
            lines = [ line for line in f.readlines( ) if line[0:4] == "repo" ]
        if len( lines ) < 2 :
            exit( 1 )
        return lines[-2:]
    except :
        print( '[-] get_project_AP.py first' )
        exit( 1 )

if __name__ == "__main__" :
    check_pwd( ) ;
    last , current = get_last_two_record( )[0] , get_last_two_record( )[1]
    if last.strip() == current.strip() :
        print '[+] pass'
    else :
        print '[*] >>>>>>>>>>>>>>>>>>>>>>>> AP address updated <<<<<<<<<<<<<<<<<<<<<<<<<<<<'