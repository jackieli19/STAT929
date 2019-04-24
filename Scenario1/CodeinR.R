#load library
library(sarima)
library(fGarch)
library(FinTS)
library(TSA)
library(forecast)
library(astsa)

#load data
data <- read.csv('~/OneDrive/0_UW/2019 Winter Term/STAT929 Time Series/Contest/Scenario1/hyd_post.txt', header=TRUE, sep=',')

#plot graph of data
data <- data[, 'x']
plot(data,type='l')

data_12 <- ts(data,frequency=12)

auto.arima(data_12,D=1)