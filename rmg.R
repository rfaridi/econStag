#============ Ready Made Garments =========

rmg <- trade$X6[yrs]
rmg.df <- data.frame(year=as.character(yr15),
                     rmg=as.numeric(rmg))

p <- ggplot(data=rmg.df,aes(x=year,y=rmg,group=""))+
  geom_line(alpha=.3)

rmg.mo <- as.numeric(trade$X6[months])
#months <- as.character(trade$Col1[months])
df.mo <- data.frame(months=as.numeric(months),rmg.mo,stringsAsFactors = F)
df.mo <- df.mo[!is.na(df.mo$rmg.mo),]

p <- ggplot(data=df.mo,aes(x=months,y=rmg.mo,group=""))+
  geom_line(alpha=.3)+ylim(8000,15000)
