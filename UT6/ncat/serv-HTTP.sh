#!/bin/bash
(echo -ne "HTTP/1.1 200 OK\r\nContent-Length: $(wc -c <dam1-hello.html)\r\n\r\n" && ncat -l 8080 < dam1-hello.html) 
