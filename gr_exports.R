source('functions.R')
load('./RData/master.RData')
load('./RData/Monthly_capMach_Exp.RData')
#plot_exports <- lineCh(master,"Exports")
#ggsave('./figs/exports.png',plot_exports,
       #width=8.88,height=6,dpi=72)

exp.yr <- ggplot(master,
                 aes(x=year,
                     y=Exports,
                     group=''))

exp.yr.pl <- exp.yr+geom_line(color='Grey') + 
  stat_smooth(fill=NA,
              size=1,
              color='red') + 
  scale_x_discrete(breaks=master$year[seq(1,length(master$year),3)]) +
  ggtitle('Fig 1: Trend in Yearly Export Revenue (in crore BDT)')+
  themeLine 

ggsave('./figure/exp_yr.png',
       exp.yr.pl,
       width=8.88,
       height=8.88/1.618,
       dpi=72)


exp.yr.gw <- ggplot(master,
                 aes(x=year,
                     y=exp_yr_gw,
                     group=''))

exp.yr.gw.pl <- exp.yr.gw+geom_line(color='Grey') + 
  stat_smooth(fill=NA,
              size=1,
              color='red') + 
  scale_x_discrete(breaks=master$year[seq(1,length(master$year),2)]) + 
  scale_y_continuous(labels = percent) +
  ggtitle('Fig 2: Growth in Yearly Export Revenue')+
  themeLine 

ggsave('./figure/exp_yr_gw_pl.png',
       exp.yr.gw.pl,
       width=8.88,
       height=8.88/1.618,
       dpi=72)
#============================
#======= Monthly Data =======
#============================
exp.mo <- ggplot(mo.dat,
              aes(x=dates,
                  y=Exports))

exp.mo.pl <- exp.mo+geom_line(color='Grey') + 
            stat_smooth(fill=NA,
                        size=1,
                        color='red') + 
  scale_x_date(breaks=mo.dat$dates[seq(1,nrow(mo.dat),3)],
               labels=date_format('%b-%Y')) + 
  ggtitle('Fig 3: Trend in Monthly Export Revenue')+
  themeLine 

ggsave('./figure/exports_mo.png',
       exp.mo.pl,
       width=8.88,
       height=8.88/1.618,
       dpi=72)


exp.mo.gw <- ggplot(mo.dat,
                 aes(x=dates,
                     y=gr_exp))

exp.mo.gw.pl <- exp.mo.gw+
                geom_line(color='Grey') + 
                stat_smooth(fill=NA,size=1,color='red') + 
                scale_x_date(
                  breaks=mo.dat$dates[seq(1,nrow(mo.dat),3)],
                  labels=date_format('%b-%Y')) + 
              scale_y_continuous(labels = percent) +
  ggtitle('Fig 4: Growth in Monthly Export Revenue')+
                themeLine 

ggsave('./figure/exports_mo_gw.png',
       exp.mo.gw.pl,
       width=8.88,
       height=8.88/1.618,
       dpi=72)