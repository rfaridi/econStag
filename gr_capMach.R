library(gtable)
library(grid)
source('functions.R')
load('./RData/master.RData')
load('./RData/Monthly_capMach_Exp.RData')
plot_cmach <- lineCh(master,"cap_mach")
ggsave('./figs/cmach.png',plot_cmach,
       width=8.88,height=6,dpi=72)

mo.dat <- mo.dat %>% 
  mutate(gr_cm=(cap_mach-lag(cap_mach))/lag(cap_mach))
