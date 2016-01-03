library(dplyr)
library(scales)
source('functions.R')
load('./RData/master.RData')
load('./RData/Monthly_capMach_Exp.RData')

cm <- ggplot(mo.dat,aes(x=dates,
                        y=cap_mach))
cm.plot <- cm+geom_line()+ stat_smooth(fill=NA,
                                       size=1,
                                       color='red') + 
         scale_x_date(breaks=mo.dat$dates[c(seq(1,26,3),27)],
                      labels=date_format('%b-%Y')) + 
        scale_y_continuous(limits = c(700,2100)) +
                    themeLine + 
        theme(axis.text.x=element_text(angle = 40,
                                       vjust =.5))

ggsave('./figs/cm_plot.png',
       cm.plot,
       width=8.88,
       height=6,
       dpi=72)


cm.gw <- ggplot(mo.dat,aes(x=dates,
                           y=gr_cm))

cm.gw.pl <- cm.gw+
                  geom_line()+ 
                         stat_smooth(fill=NA,
                                     size=1,
                                     color='red') + 
                scale_x_date(breaks=mo.dat$dates[c(seq(1,26,3),27)],
                labels=date_format('%b-%Y')) +
             scale_y_continuous(labels = percent) +
  themeLine + 
  theme(axis.text.x=element_text(angle = 40,
                                 vjust =.5))

ggsave('./figs/cm_gw.png',
       cw.gw.pl,
       width=8.88,
       height=6,
       dpi=72)




