library(Gmisc)

for (j in 0:19)
{


    lbl = paste("Data/seqPlots/markov",j,'.csv', sep = "")
    csv=read.table(lbl, header = TRUE,  sep = ',',  stringsAsFactors = FALSE)
    # for(i in 1:nrow(csv))
    # {
    #     csv[i,] = 100*(csv[i,]/sum(csv[i,]))
    #     csv[i,which(csv[i,]<10)] = 0
    # }
    rownames(csv)=c("DHP","DFP","FHP","FFP","MRND","context+1","context-1")
    jpeg(paste("TransMats2/markov",j,".jpeg",sep=''),width = 1200, height = 600)
    transitionPlot(csv*1000,main = "Transition of action to action",box_label = c("from", "to"))
    dev.off()
}