#!/bin/bash


links=$(lynx --dump -nonumbers -listonly $1 | grep -e trinum.com -e .jpg$ -e skaping.com -e viewsurf.com -e webcam-hd.com -e quanteec.com)
for link in $links
do
    echo "WebCam(
          name: '',
          url:
              '$link',
        ),"
done