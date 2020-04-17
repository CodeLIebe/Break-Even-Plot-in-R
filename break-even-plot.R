
library(ggplot2)

#add your values here
TotalUnitsSold <- 5734
BreakEvenUnits <- 5260
BreakEvenUSD  <- 47343
FixCosts <- 9226
VarCostsPerUnit <- 41550/TotalUnitsSold
SalesPrice <- 9

xmax <-10000


x <- "Strawberries sold in kg"
y <- "USD"


#define linear functions
FixedCosts <- function(x) FixCosts
TotalRevenue <- function(x) SalesPrice*x
TotalCosts <- function(x) VarCostsPerUnit*x + FixCosts

ymax <- TotalCosts(xmax)

p <- ggplot(data = data.frame(x = c(0,xmax)), mapping = aes(x = x)) 
p + 
  geom_point(x=BreakEvenUnits, y = BreakEvenUSD, color="orange", size=3) + 
  stat_function(fun = TotalRevenue, color="gray22", size =1) +
  stat_function(fun = FixedCosts,color="orange",size=1) +
  stat_function(fun = TotalCosts,color="orange",size=1) +
  scale_x_continuous(breaks = c(0,BreakEvenUnits, xmax)) +
  scale_y_continuous(breaks= c(0,BreakEvenUSD,ymax)) +
  xlab(x) +
  ylab(y)
