library(ggplot2)
themeLine <- theme_grey()+
  theme(panel.background=element_blank(),
        axis.title=element_blank(),
        panel.grid.major.y=
          element_line(linetype='dotted',
                       color='grey'),
        axis.line=element_line(linetype='dashed',
                               color='Grey'))


lineCh <- function(df,myvar) {
  #df <- cmach.df
  len <- dim(df)[1]
  nums <- c(seq(1,len,by=3),len)
  my_breaks <- df[['year']][nums]
  my_breaks2 <-df[[myvar]][nums]
  y_max <- max(df[[myvar]])
  dat2 <- data.frame(my_breaks,my_breaks2)
  #print(head(df))
  #print(head(dat2))
  localenv <- environment()
  p <- ggplot(data=df,
              aes(x=year,
                  y=get(myvar),
                  group=""),
              environment=localenv)+
    geom_line(size=1) +
    geom_point(data=dat2,
               aes(x=my_breaks,
                   y=my_breaks2),
               size=6,
               shape=21,
               fill='White') +
    scale_x_discrete(breaks=my_breaks)+
    expand_limits(x= c(0,len*1.05),y= c(0,y_max*1.05))+
    geom_text(data=dat2,
              aes(x=my_breaks,
                  y=my_breaks2,
                  label=format(my_breaks2,big.mark = ',')),
              size=5,
              family='Helvetica',
              vjust=-1.5, hjust=.5,
              alpha=.4)
  return(p+themeLine)
}
