male <- nyc[gender==1, ]
female <- nyc[gender == 2, ]
meanMale <- mean(tripduration[gender == 1])
meanFemale <- mean(tripduration[gender == 2])
meanTotal = meanFemale - meanMale
sdmale <- sd(tripduration[gender == 1])
sdfemale <- sd(tripduration[gender == 2])
a <- dim(male)
sizeofMale <- a[1]
b <- dim(female)
sizeofFemale <- b[1]
denom <- ((sdmale^2 / sizeofMale) + (sdfemale^2 / sizeofFemale))
zscore <- meanTotal / sqrt(denom)
p <- 1-pnorm(zscore)
plot(x = seq(from = -5, to = 5, by = 0.1), y = dnorm(seq(from = -5, to = 5, by = 0.1), mean = 0), type = 'l',xlab = 'mean difference', ylab = 'possibility')
abline(v = zscore, col = 'red')