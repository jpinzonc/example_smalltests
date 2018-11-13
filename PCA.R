http://www.r-bloggers.com/computing-and-visualizing-pca-in-r/
library(ggbiplot)
library(ggplot2)
graphEvent2$groups <- ifelse(graphEvent2$well=="W1" | graphEvent2$well=="W2" | graphEvent2$well=="W3" | graphEvent2$well=="W4" | graphEvent2$well=="W5" | graphEvent2$well=="W6","A",
                             "B") 
  
#Remove NA and create two data frames where the variables are selected
ad=graphEvent2 %>% na.omit%>%dplyr::select(area,diff_time, amplitude)
adq=graphEvent2 %>% na.omit%>%dplyr::select(groups)
ir.groups <- as.factor(adq[,1])

ir.pca <- prcomp(ad, centr = TRUE, scale. = TRUE) 

plot(ir.pca, type="l")
summary(ir.pca)

predict(ir.pca, 
        newdata=tail(log.ir, 2))

#graph
g <- ggbiplot(ir.pca, obs.scale = 1, var.scale = 1, 
              groups =ir.groups, ellipse = TRUE, 
              circle = F)

g <- g + scale_color_discrete(name = '')
g <- g + theme(legend.direction = 'horizontal', 
               legend.position = 'top')
g

theta <- seq(0,2*pi,length.out = 100)
circle <- data.frame(x = cos(theta), y = sin(theta))
p <- ggplot(circle,aes(x,y)) + geom_path()
loadings <- data.frame(ir.pca$rotation, 
                     .names = row.names(ir.pca$rotation))
p + geom_text(data=loadings, 
              mapping=aes(x = PC1, y = PC2, label = .names, colour = .names)) +
  coord_fixed(ratio=1) +
  labs(x = "PC1", y = "PC2")
