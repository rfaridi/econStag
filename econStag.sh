
sed -i "s%/site%/sites/all/themes/precision/images/figure%g" "./econStag.Rmd"

scp -P 49014 ./figs/*.png factcheck@factcheckbd.com:~/public_html/sites/all/themes/precision/images/figure
