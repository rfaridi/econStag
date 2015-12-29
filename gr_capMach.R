library(gtable)
library(grid)
library(dplyr)
library(scales)
source('functions.R')
load('./RData/master.RData')
load('./RData/Monthly_capMach_Exp.RData')
plot_cmach <- lineCh(master,"cap_mach")
ggsave('./figs/cmach.png',plot_cmach,
       width=8.88,height=6,dpi=72)

mo.dat <- mo.dat %>% 
  mutate(gr_cm=(cap_mach-lag(cap_mach))/lag(cap_mach))

p <- ggplot(mo.dat,aes(x=dates,y=cap_mach))
p1 <- p+geom_line()+scale_x_date(breaks=mo.dat$dates[c(seq(1,26,3),27)],labels=date_format('%b-%Y'))

per <- ggplot(mo.dat,aes(x=dates,y=gr_cm))
p2 <- per+geom_bar(stat='identity')+scale_x_date(breaks=mo.dat$dates[c(seq(1,26,3),27)],labels=date_format('%b-%Y')) 
