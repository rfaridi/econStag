library(XLConnect)
library(stringr)
library(dplyr)
library(ggplot2)
library(scales)
library(grid)
library(gtable)

file <- "../Data/statisticaltable.xls"
wb <- loadWorkbook(file)
trade <- readWorksheet(wb,sheet = 'Table IV',startRow = 6,startCol = 1)
yr <- trade$Col1
yr.14 <- grep('2013-14',yr)
yr14 <- yr[1:yr.14]
yr.15 <- grep('2014-15',yr)
yrs <- c(1:yr.14,yr.15)
yr15 <- str_trim(yr[yrs])
yr15 <- sub('(\\d+-)(\\d{2}$)','\\2',yr15)
yr15 <- paste0('FY',yr15)
yr.16 <- grep('2015-16',yr)

master <- data.frame(year=yr15,
           cap_mach=as.numeric(trade$X34[yrs]),
           Exports=as.numeric(trade$X11[yrs]))


master$cap_mach[master$year=='FY05']=6876
master <- master %>%
              mutate(year=factor(master$year,
                                 levels=master$year),
                     exp_yr_gw=(Exports-lag(Exports))/lag(Exports))


save(master,file='./RData/master.RData')

#=================================================
#=========  Monthly Data =========================
#=================================================

# the row number where the first monthly data starts
m1 <- grep("July",yr)[1]
# the row number of the last observation
ml <- length(yr)
# the row numbers where year information is excluded
mSL <- c(m1:ml)[!m1:ml %in% c(yr.15,yr.16)]
# the corresponding months

mo.dat <- data.frame(#months=as.character(yr[mSL]),
                     cap_mach=as.numeric(trade$X34[mSL]),
                     Exports=as.numeric(trade$X11[mSL]))

# get rid of the last few rubbish texts
mo.dat <- mo.dat[-dim(mo.dat)[1]:-(dim(mo.dat)[1]-2),]

dates <- seq(from=as.Date("jul012013","%b%d%Y"),by='month',length.out = nrow(mo.dat))

mo.dat <- mo.dat %>% 
  mutate(dates=dates,
         gr_cm=(cap_mach-lag(cap_mach))/lag(cap_mach),
         gr_exp=(Exports-lag(Exports))/lag(Exports))

save(mo.dat, file ='./RData/Monthly_capMach_Exp.RData')
         #gr_cm=(cap_mach-lag(cap_mach))/lag(cap_mach))


