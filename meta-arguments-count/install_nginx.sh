#!/bin/bash

: <<'END'
sudo bash -c '
apt-get update && \
apt-get install -y nginx \
systemctl start nginx \
systemctl status nginx 
'
echo <h1>"Terraform in oneshort by TWS</h1> | sudo tee /var/www/html/index.html
comment
# sudo bash -c 'commands' runs all the inner commands as root.

# The \ makes it neat across multiple lines.

# && ensures that the next command only runs if the previous one succeeds.
END

sudo apt-get update >> /var/log/user_data.log 2>&1
sudo apt install nginx -y >> /var/log/user_data.log 2>&1
sudo systemctl start nginx >> /var/log/user_data.log 2>&1
sudo systemctl status nginx >> /var/log/user_data.log 2>&1
echo <h1>"Terraform in oneshort by TWS</h1> | sudo tee /var/www/html/index.html
