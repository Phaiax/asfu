asfu
====

automatic ssh file uploader


Usage:
./asfud.sh <directory-to-monitor> <ssh host> <url>
ssh host example: marc@myhost:/home/mark/www/screenshots

ATTENTION: removes the uploaded file locally (just comment out the rm line to
disable this behaviour)

You need to have installed 
 * xclip
 * inotify-tools
 
 With ubuntu, you get a notification via notify send. Please extend and push your changes.
