all: view

R_OPTS=--no-save --no-restore --no-init-file --no-site-file

view: econStag.html
	view $<

econStag.html: econStag.Rmd master.RData cmach.png exports.png
	Rscript -e 'rmarkdown::render("$<")'

#econStag.html: econStag.md cmach.png	
#	R ${R_OPTS} -e "markdown::markdownToHTML('econStag.md','econStag.html',options=c('fragment_only'))"

exports.png: gr_exports.R master.RData functions.R
	Rscript ${R_OPTS} $<

cmach.png: gr_capMach.R master.RData functions.R 
	Rscript ${R_OPTS} $<

#exports.RData: exports.R read.R
	#Rscript ${R_OPTS} $<
	
master.RData: read.R
	Rscript ${R_OPTS} $<



clean: 
	#rm -f *.Rout







