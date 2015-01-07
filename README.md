HP Helion WordPress deployment
=======================

These files make it easy to deploy the latest version of WordPress on the Helion Development Platform. The instructions below show step-by-step how to push directly to a Helion Development Platform installation. Two services, MySQL and Filesystem, are required and can be managed by Dev Platform, assuming they were enabled when the platform was installed on Helion OpenStack. *This example is meant to be a starting point, not a production ready service. You'll want to ensure that the filesystem and mysql services can accommodate the scale requirements.*

# Getting ready
After cloning this repository, some initialization is required before it can be pushed to Helion Development Platform. This is necessary to accommodate the most current WordPress version going forward.

## Manual initialization
Download the following resources

 * https://wordpress.org/latest.zip
 * https://downloads.wordpress.org/plugin/wp-fastest-cache.zip
 * http://docs.hpcloud.com/als/v1/client/download

Unzip the wordpress files into the main directory.

Unzip wp-fastest-cache.zip into the ```wp-content/plugin``` directory.

Unzip the helion client and put the binary in the main directory.

## Initialization on Windows
The repository includes a powershell script to perform the steps above. After cloning this repository, open a windows console and change into the main directory. Then run the command as follows

```
C:\Users\watrous\Documents\GitHub\heliondemo-wordpress>powershell .\init.ps1
```

## Initialization on Linux
Coming soon.

# Push to Helion Development Platform
With all the files in place, all that's left is to ```helion push```.

```
C:\Users\watrous\Documents\GitHub\heliondemo-wordpress>helion push
Would you like to deploy from the current directory ? [Yn]:
Using manifest file "manifest.yml"
Instances:         1
Application Deployed URL [wordpress.15.50.137.82.xip.io]:
Application Url:   http://wordpress.15.50.137.82.xip.io
Creating Application [wordpress] as [https://api.15.50.137.82.xip.io -> default -> default -> wordpress] ... OK
  Map http://wordpress.15.50.137.82.xip.io ... OK
Service wordpress-db:
Creating new service [wordpress-db] ... OK
  Binding wordpress-db to wordpress ... OK
Service wordpress-fs:
Creating new service [wordpress-fs] ... OK
  Binding wordpress-fs to wordpress ... OK
Uploading Application [wordpress] ...
  Checking for bad links ...  OK
  Copying to temp space ...  OK
  Checking for available resources ...  OK
  Processing resources ... OK
  Packing application ... OK
  Uploading (47K) ...  OK
Push Status: OK
Starting Application [wordpress] ...
stackato[dea_ng]: Staging application
staging: -----> Downloaded app package (6.7M)
staging: ****************************************************************************
staging: * Using the legacy buildpack to stage a 'php' framework application.
staging: *
staging: * Note that the legacy buildpack is a migration tool to provide backwards
staging: * compatibility while moving from Stackato 2.x to Stackato 3.0.  It is not
staging: * updated with new features beyond what Stackato 2.10.6 supplied.
staging: *
staging: * Please use a non-legacy buildpack for any new code developed for Stackato!
staging: ****************************************************************************
staging:
staging: end of staging
staging: -----> sh helion-setup.sh
staging:        Adapt WordPress to store wp-content and other modifiable files in a Helion filesystem service.
staging:        Configuration file not found. Setting up...
staging:        Migrating data to shared filesystem...
staging:        Symlink to files in shared filesystem...
staging:        Symlink to folders in shared filesystem...
staging:        All Done!
staging: -----> Uploading droplet (4.4M)
stackato[dea_ng]: Completed staging application
stackato[dea_ng.0]: Launching web process: /home/stackato/startup
app[stderr.0]: AH00558: apache2: Could not reliably determine the server's fully qualified domain name, using 172.17.0.43. Set the 'ServerName' directive globally to suppress this message
OK
http://wordpress.15.50.137.82.xip.io/ deployed
```
