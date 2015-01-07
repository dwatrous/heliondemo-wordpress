$wheretosave = $pwd
$webclient = New-Object System.Net.WebClient

function Expand-ZIPFile($file, $destination) {
    $shell = new-object -com shell.application
    $zip = $shell.NameSpace($file)
    foreach($item in $zip.items()) {
        $shell.Namespace($destination).copyhere($item)
    }
}

# download latest wordpress
$wordpressdownloadurl = "https://wordpress.org/latest.zip"
$wordpresszip = "$wheretosave\wordpress.zip"
$webclient.DownloadFile($wordpressdownloadurl,$wordpresszip)

# download cache plugin
$cachedownloadurl = "https://downloads.wordpress.org/plugin/wp-fastest-cache.zip"
$cachezip = "$wheretosave\wp-fastest-cache.zip"
$webclient.DownloadFile($cachedownloadurl,$cachezip)

# get the helion client
$heliondownloadurl = "http://g7743e0143085e2793a5aef95989b09ea.cdn.hpcloudsvc.com/helion-1.0.1-win32-ix86.zip"
$helionzip = "$wheretosave\helion-1.0.1-win32-ix86.zip"
$webclient.DownloadFile($heliondownloadurl,$helionzip)

# unzip files into proper locations
Expand-ZIPFile –File "$wheretosave\wordpress.zip" –Destination "$wheretosave"
Expand-ZIPFile –File "$wheretosave\wp-fastest-cache.zip" –Destination "$wheretosave\wordpress\wp-content\plugins"
Expand-ZIPFile –File "$wheretosave\helion-1.0.1-win32-ix86.zip" –Destination "$wheretosave"

# move files into place
Move-Item "$wheretosave\wordpress\*" "$wheretosave"
Move-Item "$wheretosave\helion-1.0.1-win32-ix86\helion.exe" "$wheretosave\helion.exe"

# remove unnecessary files
Remove-Item "$wheretosave\wordpress.zip"
Remove-Item "$wheretosave\wp-fastest-cache.zip"
Remove-Item "$wheretosave\helion-1.0.1-win32-ix86.zip"
Remove-Item "$wheretosave\wordpress"
Remove-Item -Recurse "$wheretosave\helion-1.0.1-win32-ix86"
