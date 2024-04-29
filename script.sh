#!/bin/bash

# Update system packages
yum update -y

# Install PHP 7.2 and MySQL extension
amazon-linux-extras enable php7.2
yum install -y php php-mysqlnd

# Install required PHP extensions for WordPress
yum install -y php-gd php-xml php-mbstring

# Install and configure Apache web server
yum install -y httpd
systemctl start httpd
systemctl enable httpd

# Download and extract WordPress
yum install -y wget
wget https://wordpress.org/latest.tar.gz
tar -xzf latest.tar.gz
mv wordpress/* /var/www/html/
cp /var/www/html/wp-config-sample.php /var/www/html/wp-config.php

# Configure permissions for WordPress
chown -R apache:apache /var/www/html/
chmod -R 700 /var/www/html/

# Update Apache configuration
echo "<Directory /var/www/html/>
    AllowOverride All
</Directory>" |  tee -a /etc/httpd/conf.d/wordpress.conf

# Set database details in WordPress configuration
sed -i "s/define( 'DB_NAME', 'database_name_here' );/define( 'DB_NAME', \'${DB_NAME}\' );/" /var/www/html/wp-config.php
sed -i "s/define( 'DB_USER', 'username_here' );/define( 'DB_USER', \'${DB_USER}\' );/" /var/www/html/wp-config.php
sed -i "s/define( 'DB_PASSWORD', 'password_here' );/define( 'DB_PASSWORD', \'${DB_PASSWORD}\' );/" /var/www/html/wp-config.php
sed -i "s/define( 'DB_HOST', 'localhost' );/define( 'DB_HOST', \'${DB_HOST}\' );/" /var/www/html/wp-config.php
sed -i 's/<?php/<?php\n if (isset($_SERVER['\''HTTP_X_FORWARDED_PROTO'\'']) \&\& $_SERVER['\''HTTP_X_FORWARDED_PROTO'\''] === '\''https'\''\){ $_SERVER['\''HTTPS'\''] = '\''on'\''; }/' /var/www/html/wp-config.php

# Restart Apache
systemctl restart httpd

# Clean up temporary files
rm -rf latest.tar.gz wordpress

echo "WordPress installation completed successfully!"
