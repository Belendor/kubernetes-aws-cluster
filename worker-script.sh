#!/bin/bash

# Launch web server
sudo apt-get update -y
sudo apt-get install apache2 -y
sudo systemctl enable apache2
sudo systemctl start apache2
echo "${file_content}!" > /var/www/html/index.html
