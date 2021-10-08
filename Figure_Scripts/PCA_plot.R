library(ggplot2)

setwd('~/Documents/Oslo_Workshop/')
eigenvec_table <- read.table("West_East.pca.evec")

pdf('PCA_BAMscorer.pdf')
eigenvec_plot <- ggplot(eigenvec_table, aes(x = V2, y = V3)) + 
                    geom_point(size = 2) +
                    labs(title = "PCA",
                         x = "PC1", y = "PC2") +
                    theme_bw() +
                    theme(plot.title = element_text(hjust=0.5))
 
eigenvec_plot

dev.off()
                    
                 
