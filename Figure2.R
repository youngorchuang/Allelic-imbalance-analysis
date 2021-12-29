# Figure 2
write.table(dataSNP[,c(1,2,3,6, 7)], file = , sep = "\t", row.names = F, quote = FALSE, col.names = T)

dataSNP <- read.table("Figure 2-Source Data 2.txt", sep = "\t")

library("ggplot2")

ggplot(dataSNP, aes(x = as.factor(group), y = ratio, color = group, fill=group)) + geom_boxplot(size = 0.2, alpha = 0.75)  + ylab("Allelic ratio\nrs1047643 (T vs C)") + xlab("") + theme_bw() + theme(panel.grid = element_blank(), legend.position = "none", axis.line = element_line(colour="black"), text = element_text(size=11))
# + geom_point(position = position_jitter(width=0.1), alpha = 0.7, size=I(3))

# P-value
wilcox.test(dataSNP[dataSNP$group %in% "CNTL", 6], dataSNP[dataSNP$group %in% "SLE", 6])


dataSNP <- read.table("Figure 2-Source Data 3.txt", sep = "\t")
library("ggplot2")

ggplot(dataSNP, aes(x = as.factor(group), y = adjust, color = group, fill=group)) + geom_boxplot(size = 0.2, alpha = 0.75) + 
ylab("Allelic ratio\nrs1047643 (C vs T)") + xlab("") + theme_bw() + theme(panel.grid.minor = element_blank(), legend.position = "none", axis.line = element_line(colour="black"), text = element_text(size=11))


