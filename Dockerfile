FROM nginx

#RUN nginx -s stop
CMD ["nginx", "-s", "stop;"]

ENV SF_DOMAIN sf_dev
ENV SF_WEB_ROOT /var/www/web/
ENV SF_FAST_CGI_IP 127.0.0.0

COPY default.conf /etc/nginx/conf.d/default.conf

RUN sed -e "s,SF_DOMAIN,${SF_DOMAIN}," -i /etc/nginx/conf.d/default.conf
RUN sed -e "s,SF_WEB_ROOT,${SF_WEB_ROOT}," -i /etc/nginx/conf.d/default.conf
RUN sed -e "s,SF_FAST_CGI_IP,${SF_FAST_CGI_IP}," -i /etc/nginx/conf.d/default.conf
RUN cat /etc/nginx/conf.d/default.conf

RUN mkdir /var/www
RUN chown -R www-data:www-data /var/www

VOLUME ["/var/www"]

CMD ["nginx", "-g", "daemon off;"]
