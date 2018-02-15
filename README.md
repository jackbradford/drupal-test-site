# A Drupal Test Site to experiment with deployment strategies.

This project provides a testing ground for deployment strategy. The ideal
deployment allows one to perform a fresh install, followed by the 
installation/enabling of a deployment module.

The deployment module should be designed such that we can install a brand new
instance of the site anywhere and at any point in time.


# Installation

Follow these steps to deploy a new instance of this site:

1. Create and enter a directory for the project.
1. Run `git clone https://github.com/jackbradford/drupal-test-site.git .`
1. Run `scripts/initial_deploy.sh`
1. You'll be asked to specify the "Drupal Root." Enter `drupal`, which has been
   created automatically.
1. Follow the rest of the prompts. The script will exit on failure. If such a
   failure occurs, it may be easiest to start the process again from scratch.
1. If the script completes without error, the site deployed successfully.

