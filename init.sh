#!/bin/bash
# download all required files
wget https://wordpress.org/latest.zip
wget https://downloads.wordpress.org/plugin/wp-fastest-cache.zip
wget http://g7743e0143085e2793a5aef95989b09ea.cdn.hpcloudsvc.com/helion-1.0.1-linux-glibc2.3-x86_64.zip

# unzip files
unzip latest.zip
unzip wp-fastest-cache.zip -d wordpress/wp-content/plugins/
unzip helion-1.0.1-linux-glibc2.3-x86_64.zip

# move files into place
mv helion-1.0.1-linux-glibc2.3-x86_64/helion ./
mv wordpress/* ./

# clean up
rm -fR helion-1.0.1-linux-glibc2.3-x86_64*
rm latest.zip
rm wp-fastest-cache.zip
rmdir wordpress/

