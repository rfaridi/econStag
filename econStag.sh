
sed -i "s%/figure%/sites/all/themes/precision/images/figure%g" "./econStag.html"

scp -P 49014 ./figure/*.png factcheck@factcheckbd.com:~/public_html/sites/all/themes/precision/images/figure
