#!/bin/bash


links=$(lynx --dump -nonumbers -listonly $1 | grep -e trinum.com -e .jpg$ -e skaping.com -e viewsurf.com -e webcam-hd.com -e quanteec.com)
#sortLinks=$(echo "${links[@]}" | sed 's/[0-9]//g' | sort -u )
for link in $links
do
    echo "WebCam(
          name: '',
          url:
              '$link',
        ),"
done