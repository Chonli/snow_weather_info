#!/bin/bash

pagesWebcam=$(lynx --dump -nonumbers -listonly https://www.skieur.com/station-ski-webcam | grep www.skieur.com/station-ski-webcam-)
pagesWebcam+=$(lynx --dump -nonumbers -listonly https://www.skieur.com/station-ski-webcam/2| grep www.skieur.com/station-ski-webcam-)
pagesWebcam+=$(lynx --dump -nonumbers -listonly https://www.skieur.com/station-ski-webcam/3 | grep www.skieur.com/station-ski-webcam-)
pagesWebcam+=$(lynx --dump -nonumbers -listonly https://www.skieur.com/station-ski-webcam/4 | grep www.skieur.com/station-ski-webcam-)

webcamLinks=''

for page in $pagesWebcam
do
    links=$(lynx --dump -nonumbers -listonly $page | grep https:// | grep -v -e www.skieur.com -e www.ski-planet.com -e www.ski-planet.com -e twitter.com -e www.instagram.com -e www.youtube.com)
    webcamLinks+=" $page "
    for link in $links
    do

        #www.trinum.com remove /small_
        #viewsurf.com
        # | grep www.skaping.com
        # finish by .jpg
        # webcam-hd.com
        #| sed -e "s/\/small_/\//"
        
        webcamLinks+="$(echo $link | grep -e trinum.com -e .jpg$ -e skaping.com -e viewsurf.com -e webcam-hd.com) "
    done
done

#sortLinks=$(echo "${webcamLinks[@]}" | sort -u )

echo $webcamLinks | tr ' ' '\n' > result.txt