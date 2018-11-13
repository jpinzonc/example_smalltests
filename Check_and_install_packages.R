libraries <- c("ggplot2", "dplyr", "lubridate", "tidyr","grid", "gridExtra","gtable" , "cowplot", "xts", 
                      "RColorBrewer", "scatterplot3d","strucchange", "zoo", "tools")
lapply(libraries, require, character.only=T)

# Other Option:
install.packages("pacman")
pacman::p_load(dplyr, RColorBrewer)
