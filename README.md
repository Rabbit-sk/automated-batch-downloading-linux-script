# download-after-login-linux-script
This is a Bash script which downloads files listed in file links.txt.

The format of each line in link.txt file is supposed to be like this:
subDirectoryNameWhereFileWillBeSaved URL

To be able to download file accessible only after login, it uses cookies.txt saved mannually for example by some WEB browser addon, after login to some online service. Cookies file is updated after each downloaded file to prevent initial cookies.txt expiration. If download is corrupted by some error, error code is printed out and download starts again. File name part of URL is extracted and decoded from URL format to readable format by Python function and then it is used as a file name. The porgress of downloading is also shown.
