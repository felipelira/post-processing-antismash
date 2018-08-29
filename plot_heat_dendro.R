# !/usr/bin/env R
# plot two heatmaps and two dendrograms using different methods of clustering and calculationd of distance.

library(ape)
library(gplots)

args = commandArgs(trailingOnly = TRUE)

input = args[1]

bacmet = read.table(input, header=T, row.names=1)

bacmet[bacmet>0] = 1

#========================

outTIFF1 = paste(args[1], '.dendro_binary_wardD2.tiff', sep = "")
outHEAT1 = paste(args[1], '.heat_binary_wardD2.tiff', sep = "")
outTREE1 = paste(args[1], '.tree_binary_wardD2.nwk', sep = "")

d_erwinia_binary = dist(bacmet, method = "binary")
hc_erwinia_wardD2 = hclust(d_erwinia_binary, method="ward.D2")


my_tree1 = as.phylo(hc_erwinia_wardD2)
write.tree(phy=my_tree1, file=outTREE1)


#save dendrogram as figure
tiff(outTIFF1, width = 540, height = 720,compression = c("jpeg"),bg = "white")
par(cex=0.8, mar=c(4,3,3,16))
plot(as.dendrogram(hc_erwinia_wardD2), horiz=T, xlab=input)
title(main= "\nhclust= ward.D2; dist= binary")
dev.off()

# save heatmap as figure
tiff(outHEAT1, res=120, height=1400, width=2000)
par(cex=0.6, mar=c(40,10,10,10))
heatmap.2(as.matrix(bacmet), scale="none", density.info="none", margins=c(10,15), cexCol=0.7, col=c("red", "green"), keysize=0.8, trace=c("none"), colVal=NULL,  tracecol="black",  hclustfun = function(x) hclust(x,method = 'ward.D2'), distfun = function(x) dist(x,method = 'binary'), main="hclust=ward.D2; dist=binary", cex.main=0.3, ylab = input) #, hline=median("none"), sub="BacMet2 genes - experimentally confirmed")
dev.off()



#========================
outTIFF2 = paste(args[1], '.dendro_euclidean_complete.tiff', sep = "")
outHEAT2 = paste(args[1], '.heat_euclidean_complete.tiff', sep = "")
outTREE2 = paste(args[1], '.tree_euclidean_complete.nwk', sep = "")

d_erwinia_euclidean = dist(bacmet, method = "euclidean")
hc_erwinia_complete = hclust(d_erwinia_euclidean, method="complete")


my_tree2 = as.phylo(hc_erwinia_wardD2)
write.tree(phy=my_tree2, file=outTREE2)

#save dendrogram as figure
tiff(outTIFF2, width = 540, height = 720,compression = c("jpeg"),bg = "white")
par(cex=0.8, mar=c(4,3,3,16))
plot(as.dendrogram(hc_erwinia_complete), horiz=T, xlab=input)
title(main= "hclust=complete; dist=euclidian")
xlab=input
dev.off()

# save heatmap as figure
tiff(outHEAT2, res=120, height=1200, width=1200)
par(cex=0.6, mar=c(20,4,5,4))
heatmap.2(as.matrix(bacmet), scale="none", density.info="none", margins=c(10,15), cexCol=0.7, col=c("red", "green"), keysize=0.8, trace=c("none"), colVal=NULL,  tracecol="black", hline=median("none"), distfun = function(x) dist(x,method = 'binary'), main="hclust=complete; dist=euclidian", ylab = input) #, sub="BacMet2 genes - experimentally confirmed")
dev.off()



