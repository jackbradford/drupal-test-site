# A test site to experiment with Drupal deployment strategies.

This project provides a system for deploying an existing Drupal site,
known here as *Drupal Test Site*, from a fresh installation of Drupal. The
deployment results in a fully-configured site, but does not include content.

## Dependencies

The scripts contained in this project were built on Debian 8.9, and they
require the following software:

* [Composer](https://getcomposer.org/).
* [Drush](https://www.drush.org/), installed globally via Composer.
* [Drupal Console Launcher](https://github.com/hechoendrupal/drupal-console-launcher).
  Drupal Console itself will be installed locally via Composer automatically. The launcher
  is needed for reasons stated in the link, and becomes especially important if you
  plan on installing mulitple Drupal instances on the same system.

It's also worth noting that Composer and Drush should be invokable via the commands
`composer` and `drush`, respectively. Drupal Console should be invokable via `drupal`.

## Usage

The system can be adapted to deploy any Drupal site. 

1. To start, clone this repository and, rather than use the initial-deploy script, 
   install Drupal via the script `scripts/drupal_install.sh`. 
1. Configure your site. I've used the deployment module to do so, though conceivably you
   could also configure it by hand via the admin GUI.
1. Get your site's UUID with `drush cget system.site uuid` while within the Drupal root.
   Use it to update the deployment module's `.install` file's call to `[YOURMODULE]_set_uuid()`.
   It should pass your UUID as its only argument.
1. Once you've written your configuration, enable the deployment module. Then, export your configuration
   to `/deploy`.
1. You'll want to make sure that each reference to that deployment module is updated if it's renamed, including
   in the initial deploy script.
1. Add your exported config, updated scripts, and adapted deployment module (copied to `/modules/custom/`) to
   your repository. The `drupal/` directory should not be included.
1. Once you push your changes to your central repository, you should be able to clone it elsewhere
   and use the installation instructions below to create a new instance of your site.


## Installation

Follow these steps to deploy a new instance of **this** site:

1. Create and enter a directory for the project.
1. Run `git clone https://github.com/jackbradford/drupal-test-site.git .`
1. Run `scripts/initial_deploy.sh`
1. You'll be asked to specify the "Drupal Root." Enter `drupal`, which has been
   created automatically.
1. Follow the rest of the prompts. The script will exit on failure. If such a
   failure occurs, it may be easiest to start the process again from scratch.
1. If the script completes without error, the site deployed successfully.

