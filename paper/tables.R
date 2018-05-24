library(readxl); library(xtable)

DV_1 <- read_excel('paper/data/DV_1.xlsx')
names(DV_1)[1] <- 'Period'

xtable(DV_1, caption = 'X')

xtable(DV_val, caption = 'X')


`Cluster 1` <- c(xi = -0.00530658, alpha = 0.85686111, kappa = -0.14766189)
`Cluster 2` <- c(xi = -0.02086639, alpha = 0.82660196, kappa = -0.19029369)
`Cluster 3` <- c(xi = -0.03812996, alpha = 0.70880068, kappa = -0.31723319)

xtable(rbind(`Cluster 1`, `Cluster 2`, `Cluster 3`), caption = 'X')
