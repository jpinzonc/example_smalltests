

read.table(1.txt, header = FALSE)
read.table(1.txt, header =F, sep = "	")
a<-read.csv("2.csv", header = F)
a<-read.csv("1.txt", header = F, sep = "	")
a
colnames(a)=c("row","category","#genes","%genes_total","%gene_Process hits")
names(a)
a$'%gene_Process hits'

pie(a$'#genes',labels=a$'category',edges=1000, radius=1, clockwise=T, border=T, main = "PIE")