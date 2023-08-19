FROM httpd

COPY static-web.tar.gz ./
RUN tar -xzvf static-web.tar.gz -C htdocs
RUN mv -f htdocs/src/* htdocs
RUN rm static-web.tar.gz
