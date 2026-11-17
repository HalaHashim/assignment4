FROM fedora:latest

# Upgrade the system and install the required tools
RUN dnf -y upgrade && \
    dnf -y install tuxpaint vim httpd && \
    dnf clean all

# Copy the local web page into the web root
COPY myinfo.html /var/www/html/myinfo.html

# Make httpd start at boot
RUN systemctl enable httpd

# Expose port 80
EXPOSE 80

# Run httpd in the foreground
CMD ["httpd", "-D", "FOREGROUND"]
