$wheretosave = $pwd

# preserve wp-config.php
Move-Item "$wheretosave\wp-config.php" "$wheretosave\wpconfig.bak"

# remove files
Remove-Item -Recurse -Force "$wheretosave\wp-*"
Remove-Item -Recurse -Force "$wheretosave\*.php"
Remove-Item -Recurse -Force "$wheretosave\helion.exe"
Remove-Item -Recurse -Force "$wheretosave\readme.html"
Remove-Item -Recurse -Force "$wheretosave\license.txt"

# restore wp-config.php
Move-Item "$wheretosave\wpconfig.bak" "$wheretosave\wp-config.php"
