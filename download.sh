#!/bin/bash

download_file () {
   curl -c cookies.txt -b cookies.txt -L --create-dirs -o ./"$3"/"$2" --retry-delay 5 --retry 5 -A "Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:94.0) Gecko/20100101 Firefox/94.0" "$1"
   curlExitCode=$?
   echo "curl exit code: $curlExitCode"
   return $curlExitCode
}

url_decode () {
   python -c "import sys, urllib as ul;print ul.unquote_plus(sys.argv[1])" $1
}


while IFS= read -r inputLine
do
   printf "\nDownloading next file.\n"
   fileLink=${inputLine##* }
   directory=${inputLine% *}
   urlDecoded=$(url_decode $fileLink)
   fileName=${urlDecoded##*/}
   until download_file "$fileLink" "$fileName" "$directory"
   do
      echo "Error! Retrying the download."
   done
done < links.txt


