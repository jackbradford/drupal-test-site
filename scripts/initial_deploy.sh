#!/bin/bash -i

# Exit on error
set -e

# Load .bashrc aliases
shopt -s expand_aliases

# Create the Drupal Root
mkdir drupal

# Run the install script
scripts/drupal_install.sh

# Allow write access to settings.php
sudo chmod 644 drupal/web/sites/default/settings.php

# Update the sync directory in settings.php
echo $'$config_directories[\'sync\'] = \'../../deploy\';' >> drupal/web/sites/default/settings.php

# Remove write access to settings.php
sudo chmod 444 drupal/web/sites/default/settings.php

# Create the custom module folder
mkdir drupal/web/modules/custom

# Copy the modules to the proper location within Drupal root.
cp -R modules/custom/. drupal/web/modules/custom/

# Change to drupal root
cd drupal

# Enable the deploy module
drush en drupaltest_deploy

# Temporary fix for issue #2583113
drupal entity:delete shortcut_set default

# Import the config
drush config-import -y

