#include "commonSocket.h"
#include "commonConstants.h"
#include <sys/socket.h>
#include <netinet/in.h>
#include <unistd.h>
#include <netdb.h> 
#include <stdio.h>
#include <string.h>
#include <stdlib.h>


int close_socket(int socketfd) {
    return close(socketfd);
}

void socket_error(const char *msg)
{
    perror(msg);
    //exit(0);
}

int open_socket(char* hostname, int portno) {

    // Structure to contain the address of the server
    struct sockaddr_in serv_addr;
    // Structure defining the host computer
    struct hostent *server;
    int socketfd;

    // Create a socket  
    if(DEBUG > 0) printf("[ open_socket ]: Opening new socket\n"); 
    socketfd = socket(AF_INET, SOCK_STREAM, 0);
    if (socketfd < 0) {
        socket_error("[ open_socket ]: [ ERROR ] Socket could not be opened\n");
        close_socket(socketfd);
        return socketfd;
    }
    if(DEBUG > 1) printf("[ open_socket ]: New socket (%i) has been opened\n", socketfd); 

    // Get the host information
    if(DEBUG>1) printf("[ open_socket ]: Getting the host information\n");
    server = gethostbyname(hostname);
    if (server == NULL) {
      char msgstr[256];
      sprintf(msgstr,"[ open_socket ]: [ ERROR ]: Host \"%s\" was not found.",hostname);
      socket_error(msgstr);
      close_socket(socketfd);
      return -1;
    }
    if(DEBUG > 1) printf("[ open_socket ]: Host with name %s found at address %s \n", 
                                        server->h_name, server->h_addr);
    bzero((char *) &serv_addr, sizeof(serv_addr));
    serv_addr.sin_family = AF_INET;
    bcopy((char *)server->h_addr, 
            (char *)&serv_addr.sin_addr.s_addr,
            server->h_length);
    serv_addr.sin_port = htons(portno);

    // Connect to the host
    if(DEBUG>1) printf("[ open_socket ]: Connecting to host %s ...\n", server->h_name);
    if (connect(socketfd,(struct sockaddr *) &serv_addr,sizeof(serv_addr)) < 0) {
      char tmp[256];
      if(DEBUG>0) sprintf(tmp,"[ open_socket ]: [ WARNING ] Couldn't connect to host %s %d\n", hostname, portno);
      else strcpy(tmp,"");
      socket_error(tmp);
      close_socket(socketfd); 
      return -1;
    }
    if(DEBUG>1) printf("[ open_socket ] : return socket %d\n",socketfd);
    
    return socketfd;
}

