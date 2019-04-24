#load libraries
library(PerformanceAnalytics)
library(quantmod)
library(rugarch)
library(car)
options(digits=4)
library(FinTS)
library("forecast")


data <- read.csv("../OneDrive/0_UW/2019 Winter Term/STAT929 Time Series/Contest/Scenario2/stock/stock19.txt")
data=data[,"x",drop=F]
data=as.vector(t(data))
class(data)

plot(data,type='l')

ArchTest(data,lags = 10)

garch11.spec = ugarchspec(variance.model = list(garchOrder=c(1,1)),mean.model = list(armaOrder=c(0,0)))
                                                                                
data.garch11.fit = ugarchfit(spec=garch11.spec, data=data, solver.control=list(trace = 1))
                                                                                  
data.garch11.fit

plot(data.garch11.fit,which='all')


egarch11.spec = ugarchspec(variance.model = list(model='eGARCH',garchOrder=c(1,1)),
                           mean.model = list(armaOrder=c(0,0)),
                           distribution.model = "std")

data.egarch11.fit = ugarchfit(spec=egarch11.spec, data=data, solver.control=list(trace = 1))

data.egarch11.fit
