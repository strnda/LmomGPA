library(data.table); library(ggplot2); library(lmomRFA)

source('R/auxiliary_functions/imports.R')

mx <- data.table(readRDS('data/DV.rds'))
aux <- data.table((readRDS('paper/data/mapa.RDS')))

setkey(aux)

aux <- unique(aux[,.(SP_ID, cluster, eval)])

MX <- data.table(dcast(mx[, list(year, SP_ID, dV)], year ~ SP_ID, value.var = 'dV'))
MX <- MX[, year := NULL]

moments <- data.table(t(apply(MX, 2, samlmu)), keep.rownames = T)

names(moments)[2:5] <- paste('m', 1:4, sep = '_')

num <- seq(min(moments[,4])*.5, max(moments[,4])*1.1, .01)
mr <- data.table(m_3 = num, m_4 = num*(1 + 5*num)/(5 + num))



(lmrd <- ggplot(data = NULL, aes(x = m_3, y = m_4)) +
    geom_line(data = mr, colour = 'black', lty = 'dashed') +
    geom_point(data = merge(moments, aux, by.x = 'rn', by.y = 'SP_ID'),
               aes(fill = eval, shape = factor(cluster)), 
               colour = 'grey5',
               size = 2.5) +
    scale_shape_manual(values = c(21, 22, 25), name = 'Cluster') +
    scale_fill_manual(values = c(NA, 'grey45'), name = 'Passed \nAD-test') +
    guides(shape = guide_legend(override.aes = list(fill = c('grey55'))),
           fill = guide_legend(override.aes = list(shape = 21,
                                                   fill = c(NA, 'grey55')))) +
    theme_bw() +
    labs(x = 'L-skewness', y = 'L-kurtosis', title = 'L-moment ratio diagram'))

# ggsave('~/Desktop/lmrd.pdf',lmrd)