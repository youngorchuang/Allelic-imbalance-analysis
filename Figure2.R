# Figure 2
dataSNP <- read.table("Figure 2-Source Data 2.txt", sep = "\t")

library("ggplot2")

ggplot(dataSNP, aes(x = as.factor(group), y = ratio, color = group, fill=group)) + geom_boxplot(size = 0.2, alpha = 0.75)  + ylab("Allelic ratio\nrs1047643 (T vs C)") + xlab("") + theme_bw() + theme(panel.grid = element_blank(), legend.position = "none", axis.line = element_line(colour="black"), text = element_text(size=11))
# + geom_point(position = position_jitter(width=0.1), alpha = 0.7, size=I(3))

# P-value
wilcox.test(dataSNP[dataSNP$group %in% "CNTL", 6], dataSNP[dataSNP$group %in% "SLE", 6])


dataSNP <- read.table("Figure 2-Source Data 3.txt", sep = "\t")
library("ggplot2")

ggplot(dataSNP, aes(x = as.factor(group), y = adjust, color = group, fill=group)) + geom_boxplot(size = 0.2, alpha = 0.75) + ylab("Allelic ratio\nrs1047643 (C vs T)") + xlab("") + theme_bw() + theme(panel.grid.minor = element_blank(), legend.position = "none", axis.line = element_line(colour="black"), text = element_text(size=11))


dataSNP <- read.table("Figure 2-Source Data 4.txt", sep = "\t")
library("ggplot2")

ggplot(dataSNP, aes(x = as.factor(group), y = adjust, color = group, fill=group)) + stat_boxplot(alpha = 0.4, outlier.size = -1, coef=1.95) + geom_point(position = position_jitter(width=0.3), alpha = 0.6, size=I(3)) + ylab("Allelic expression ratio\nRef vs Alt alleles") + xlab("") + theme_bw() + theme(panel.grid = element_blank(), legend.position = "none", axis.line = element_line(colour="black"), text = element_text(size=11))


## Output soure data as eLife journal requirement
write.table(dataTrans, file = "Figure 5-Source Data 1.txt", sep = "\t", row.names = F, quote = FALSE, col.names = T)



# Figure 3
dataSorted <- read.table("Figure 3-Source Data 2.txt", sep = "\t")

library("ggplot2")

ggplot(dataSorted, aes(x= group, y= length/1000, fill=Group)) + labs(x = "Epigenome ID", y = "Enhancer length (kb)") + geom_bar(stat = "identity") + theme_bw() + theme(
   axis.text.x = element_text(size = 7, angle = 90, hjust = 0), legend.position = "top", legend.direction = "horizontal"
)



# Figure 4
data_final <- read.table("Figure 4-Source Data 1.txt", sep = "\t")

library("ggplot2")

# ECDF plot 1 between two groups
ggplot(data_final, aes(x=tpm, colour=group)) + geom_step(aes(y=..y..), stat="ecdf", size = 1.2, alpha = 0.65) + xlab("TPM on a super-enhancer") + ylab("Cumulative frequency") + xlim(0, 15) + scale_colour_manual(name = "Group", values = c("SLE" = "red", "CNTL" = "black")) + facet_grid(~ cell) + theme_bw()

# ECDF plot 1 within each of two groups
ggplot(data_rmBnaive, aes(x=tpm, colour=cell)) + geom_step(aes(y=..y..), stat="ecdf", size = 1.1, alpha = 0.75) + xlab("TPM on a super-enhancer") + ylab("Cumulative frequency") + scale_colour_manual(name = "B-cell", values = c("T3" = "black", "aN" = "#CD950C", "SM" = "#912CEE", "DN" = "red")) + xlim(0, 15) + facet_grid(~ group) + theme_bw()



# Figure 5
dataTrans <- read.table("Figure 5-Source Data 1.txt", sep = "\t")
ggplot(dataTrans, aes(x = cells, y=values * 100, colour = group)) + geom_boxplot(outlier.size = -1, alpha=0.25, size = 0.1) + ylab("CpG methylation level (%)\non SE region") + xlab("B cell types") + geom_smooth(method = "lm", aes(group=group), size = 1.1, alpha=0.45, level = 0.9) + scale_colour_manual(name = "Group", values = c("SLE" = "red", "CNTL" = "black")) + theme_bw() + theme(panel.grid.minor = element_blank(), axis.line = element_line(colour="black"), text = element_text(size=12))






