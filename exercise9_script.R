setwd("~/Documents/junior/ICB_HW/ICB2019_Exercise09/")
library(ggplot2)

#Number 1:
# load/read data
starbuckssearches <- read.delim(file = "starbucks.txt")
head(starbuckssearches)
# create scatter plot
scatter = ggplot(data=starbuckssearches,aes(x=Month, y=StarbucksSearches)) +
  geom_point() + stat_smooth(data=starbuckssearches, aes(x=as.numeric(Month), y=StarbucksSearches), method = "lm") + theme_bw() + 
  labs(title = "Relative Number of Worldwide Starbucks Google Searches Over Time",
       y = "Relative Number of Worldwide Starbucks Google Searches", x = "Month") +
  scale_x_discrete(breaks = c('2004-01','2005-06','2007-01','2008-06','2010-01','2011-06','2013-01',
     '2014-06','2016-01','2017-06','2019-01'), labels = c('2004-01'='Jan 2004','2005-06'='Jun 2005',
    '2007-01'='Jan 2007','2008-06'='Jun 2008','2010-01'='Jan 2010','2011-06'='Jun 2011',
    '2013-01'='Jan 2013','2014-06'='Jun 2014','2016-01'='Jun 2016','2017-06'='Jun 2017','2019-01'='Jan 2019'))
scatter

#Number 2:
# load/read data
dat <- read.csv(file = "data.txt")
# create barplot
bar = ggplot(data = dat, aes(x=region, y=observations)) +
  stat_summary(geom="bar", fun.y="mean",fill="pink")+
  stat_summary(geom="errorbar", fun.data = "mean_se", width=0.5)
bar
# create scatterplot
scat = ggplot(data = dat,aes(x=region, y=observations)) +
  xlab("region") + ylab("observations") +  
  geom_point() + geom_jitter()
scat
#The bar and scatterplots show differennt stories. In the barplot, all of the 
# regions are represented by bars of basically the same height, showing
# that the populations are all basically the same. However, in the scatterplot,
# the east and west regions, have populations of varying sizes that are both
# higher and lower than the mean population that is represented in the barplot,
# white the north region has populations all near the mean and the south has
# high and low populations that average to the same mean as the other regions.
