setwd('~/Documents/Oslo_Workshop/')

#Input the SNP loading file desired to make a histogram for a particular database

Loadings <- read.table(<MY.SNP.loadings>, quote="\"", comment.char="")
hist(Loadings$V4)
