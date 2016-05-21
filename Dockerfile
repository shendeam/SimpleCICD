FROM ubuntu

MAINTAINER Amol Shende

RUN apt-get update

# Install necessary tools
RUN apt-get install -y nano wget dialog net-tools

# Download and Install Nginx
RUN apt-get install -y nginx

# Remove the default Nginx configuration file
#RUN rm -v /etc/nginx/nginx.conf

# Adding your app to nginx DocumentRoot
RUN rm -rf /var/www/html/*
ADD index.html /var/www/html/

# Copy a configuration file from the current directory
#ADD nginx.conf /etc/nginx/

# Send nginx to foreground 
RUN echo "daemon off;" >> /etc/nginx/nginx.conf

EXPOSE 80

CMD service nginx start 
