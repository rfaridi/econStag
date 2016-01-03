library(dplyr)
library(scales)
source('functions.R')
load('./RData/master.RData')
load('./RData/Monthly_capMach_Exp.RData')
plot_cmach <- lineCh(master,"cap_mach")
ggsave('./figs/cmach.png',plot_cmach,
       width=8.88,height=8.88*(1/1.618), dpi=72) 

cm <- ggplot(mo.dat,aes(x=dates,
                        y=cap_mach))
cm.plot <- p+geom_line()+
         scale_x_date(breaks=mo.dat$dates[c(seq(1,26,3),27)],
                      labels=date_format('%b-%Y')) + 
        scale_y_continuous(limits = c(0,2100))

cm.gw <- ggplot(mo.dat,aes(x=dates,
                           y=gr_cm))
cm.gw.pl <- per+geom_bar(stat='identity')+
                scale_x_date(breaks=mo.dat$dates[c(seq(1,26,3),27)],
                labels=date_format('%b-%Y')) 

ggsave('./figs/exports2.png',
       cw.gw.pl,
       width=8.88,
       height=6,
       dpi=72)




