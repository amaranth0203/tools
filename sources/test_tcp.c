#include <sys/socket.h>  
#include <netinet/in.h>  
#include <stdio.h>  
#include <string.h>  
#include <stdlib.h> 
#include <arpa/inet.h> 
#include <unistd.h> 
int main( int argc , char** argv )
{

    int sock_desc = socket(AF_INET, SOCK_STREAM, 0); 
    if (sock_desc == -1)
    {
        printf("cannot create socket!\n");
        return 0;
    }

    struct sockaddr_in client;  
    memset(&client, 0, sizeof(client));  
    client.sin_family = AF_INET;  
    client.sin_addr.s_addr = inet_addr(argv[1]);  
    client.sin_port = htons(2334);  

    if (connect(sock_desc, (struct sockaddr*)&client, sizeof(client)) != 0)
    {
        printf("cannot connect to server!\n");
        close(sock_desc);
    }

    char buf[1000] = "" ;
    char c = '\n';
    char *p_buf;
    int k, len;  

    int i ;
    for( i = 2 ; i < argc ; i++ ) {
        strcat( buf , argv[i] ) ;
        strcat( buf , " " ) ;
    }

    /*
     *p_buf = buf ;
     *while( *p_buf ) {
     *    if( *p_buf == '/' )
     *        *p_buf = '\\' ;
     *    p_buf ++ ;
     *}
     */

    len = strlen(buf);
    p_buf = buf;

    printf( "[!] %s\n" , p_buf ) ;
    while (len > 0)
    {
        k = send(sock_desc, p_buf, len, 0);      
        if (k == -1)
        {
            printf("cannot write to server!\n");
            break;
        }

        p_buf += k;
        len -= k;
    }

    send(sock_desc, &c, 1, 0);      


    close(sock_desc);  

    return 0;  
}