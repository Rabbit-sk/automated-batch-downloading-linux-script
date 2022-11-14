# automated-batch-downloading-linux-script 
This is a Bash script for automated batch downloading also of files which are accessible only after login.

It downloads each file listed in links.txt to specified folder. It allows easy grouping of downloaded files.

The format of each line in link.txt file is supposed to be like this:
subDirectoryNameWhereFileWillBeSaved URL

To be able to download file accessible only after login, it uses cookies.txt saved mannually for example by some WEB browser addon, after login to some online service. Cookies file is updated after each downloaded file to prevent initial cookies.txt expiration. If download is corrupted by some error, error code is printed out and download starts again. File name part of URL is extracted from URL. Then it is decoded to human-readable format by Python function and then it is used as a file name. The porgress of downloading is also shown.
