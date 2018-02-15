#open metafor library
library(metafor)

#import data file with N, reported m, and reported sd for each study
data <- read.csv('meta.analysis.3.6.15.csv', header = TRUE)
#get rid of notes column
data <- data[,1:8]

#get the standardized mean change within each group. NOTE THAT THIS VERSION USES THE SD FROM THE BOUNDARY SLIDES!
data1 <- escalc(measure="SMCR", m1i=m1i, m2i=m2i, sd1i=sd1i, ni=ni, ri=ri, data=data)

#check it out
data1

#run the meta analysis
metaanalysis <- rma(yi, vi, data=data1, method="FE", digits=2)
metaanalysis

forest(metaanalysis)
funnel(metaanalysis)
