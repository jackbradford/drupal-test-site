#!/bin/bash -i

# This script makes several assumptions:
#	- /etc/apache2/apache2.conf includes a <Directory> entry that defines
# 	  the rewrite engine's behavior.
#	- Site has been enabled via Apache.
#	- Composer is installed and is accessible via the alias "composer"
#	- Drush is installed and is accessible via the alias "drush"
#	- PHP and mySQL are installed and the database (and its user) has been set up.
#

# Expand aliases defined in the shell ~/.bashrc
shopt -s expand_aliases

# Collect Information
echo "1/7: Enter the Drupal Root:"
read drupalroot

echo "2/7: Enter mySQL database name:"
read db_name

echo "3/7: Enter mySQL username:"
read db_user

echo "4/7: Enter mySQL password:"
read db_password

echo "5/7: Enter Site Admin Account Username:"
read site_admin_un

echo "6/7: Enter a password for site admin:"
read site_admin_pw

echo "7/7: Enter a site name:"
read site_name

# Download Drupal and its dependencies via Composer.
composer create-project drupal-composer/drupal-project:8.x-dev $drupalroot --stability dev --no-interaction

# Navigate to the Drupal Root.
cd $drupalroot

# Install the site via Drush.
drush si --db-url=mysql://$db_user:$db_password@127.0.0.1/$db_name --account-name=$site_admin_un --account-pass=$site_admin_pw --site-name="$site_name"

