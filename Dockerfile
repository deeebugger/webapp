FROM amazonlinux

RUN yum update -y && yum -y install httpd
RUN rm -rf /etc/httpd/conf.d/welcome.conf

COPY configs/index.html  /var/www/html/

# Start httpd service and bind port 80
EXPOSE 80

# start httpd 
ENTRYPOINT ["/usr/sbin/apachectl", "-D", "FOREGROUND"]