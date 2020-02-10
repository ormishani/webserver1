FROM centos:latest
MAINTAINER OrMishani
RUN yum -y install httpd
COPY test/index.html /var/www/html/
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80