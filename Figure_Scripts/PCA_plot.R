library(ggplot2)

setwd('~/Documents/Oslo_Workshop/')

#Read in the eigenvec_table from WRAPsnps.sh
eigenvec_table <- read.table(<MY.pca.evec>)

#open a PDF file to print out the PCA
pdf('PCA_BAMscorer.pdf')

#create the PCA plot with headers and labels
eigenvec_plot <- ggplot(eigenvec_table, aes(x = V2, y = V3)) + 
                    geom_point(size = 2) +
                    labs(title = "PCA",
                         x = "PC1", y = "PC2") +
                    theme_bw() +
                    theme(plot.title = element_text(hjust=0.5))

#visualize the plot
eigenvec_plot

#close the PDF
dev.off()
                    
                 
