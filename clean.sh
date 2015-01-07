#!/bin/bash
# preserve wp-config.php
mv wp-config.php wpconfig.bak

# clean up all other files
rm *.php
rm -fR wp-*
rm readme.html license.txt helion

# restore wp-config.php
mv wpconfig.bak wp-config.php
