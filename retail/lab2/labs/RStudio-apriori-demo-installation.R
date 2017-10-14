#installing the packages for RStudio demo

#handling dependencies
library(magrittr)
library(tibble)

#To install graphNEL:
source("http://bioconductor.org/biocLite.R")
biocLite("graph")

#To install NCIgraph:
biocLite("NCIgraph")

#Installing RGraphviz:
biocLite("Rgraphviz")

#Installing arulesViz
install.packages("arulesViz")
