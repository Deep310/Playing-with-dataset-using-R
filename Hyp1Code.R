nyc <- read.csv(file.choose(), header = TRUE, sep = ",")
attach(nyc)
subscriber <- nyc[usertype == "Subscriber", ]
customer <- nyc[usertype == "Customer", ]
nsub <- dim(subscriber)
sizeofSub <- nsub[1]
ncust <- dim(customer)
sizeofCust <- ncust[1]
meansub <- mean(tripduration[subscriber$birth.year>1990])
meancust <- mean(tripduration[customer$birth.year>1990])
sdsub <- sd(tripduration[subscriber$birth.year>1990])
sdcust <- sd(tripduration[customer$birth.year>1990])
meantotal <- meansub - meancust
denom <- ((sdsub^2 / sizeofSub) + (sdcust^2 / sizeofCust))
zscore <- meantotal/ sqrt(denom)
p <- 1-pnorm(zscore)
plot(x=seq(from = -5, to = 5, by = 0.1), y = dnorm(seq(from = -5, to = 5, by = 0.1),mean = 0), type = 'l', xlab = 'mean difference', ylab = 'possibility')
abline(v = zscore, col = 'red')
