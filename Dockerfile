FROM nginx

#RUN nginx -s stop
CMD ["nginx", "-s", "stop;"]

ENV SF_DOMAIN sf_dev
ENV SF_WEB_ROOT /var/www/web
ENV SF_FAST_CGI 127.0.0.0:9000

COPY default.conf /etc/nginx/conf.d/default.conf

VOLUME ["/var/www"]

CMD ["nginx", "-g", "daemon off;"]
