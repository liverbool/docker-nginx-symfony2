FROM nginx
COPY default.conf /etc/nginx/conf.d/default.conf

RUN sed -i -e "s/SF_DOMAIN/${SF_DOMAIN}/g" /etc/nginx/conf.d/default.conf
RUN sed -i -e "s/SF_WEB_ROOT/${SF_WEB_ROOT}/g" /etc/nginx/conf.d/default.conf
RUN sed -i -e "s/SF_FAST_CGI/${SF_FAST_CGI}/g" /etc/nginx/conf.d/default.conf
