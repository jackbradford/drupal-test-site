# A Drupal Test Site to experiment with deployment strategies.

This project provides a testing ground for deployment strategy. The ideal
deployment allows one to perform a fresh install, followed by the 
installation/enabling of a deployment module.

The deployment module should be designed such that we can install a brand new
instance of the site anywhere and at any point in time.


# Installation

Follow these steps to deploy a new instance of this site:

1. Create a directory for the project. `cd` to that directory.
1. Run `git clone https://github.com/jackbradford/drupal-test-site.git .`.
1. Run `scripts/initial_deploy.sh`.
1. You'll be asked for the "Drupal Root." Enter `drupal`, which is automatically
   created in the current directory.
1. Follow the rest of the prompts. The script will exit on failure. If such a
   failure occurs, I've found it easiest to scrap the whole directory and
   recreate it, then start the process over from scratch.
1. Assuming the script completes, the site deployed successfully.

