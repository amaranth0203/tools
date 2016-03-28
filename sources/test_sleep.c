#include <stdio.h>
#include <sys/types.h>

int main( ) 
{
    int i = 0 ;
    for( i = 0 ; i < 5 ; i ++ )
    {
        printf( "[+] i : %d\n" , i ) ;
        sleep( 1 ) ;
    }
    return 0 ;
}
