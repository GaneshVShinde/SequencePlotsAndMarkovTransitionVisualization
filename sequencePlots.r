library("TraMineR")

genrateSeqPlot=function(inputFileinitial,outputFolder)
{
  for (j in 0:10)
  {
    st_r = paste(inputFileinitial,j,".csv",sep='')
    seqq=read.csv(st_r,stringsAsFactors = F)
    
    for(i in 1:nrow(seqq))
    {
      seqq[i,which(seqq[i,]=="DHP")]="Drop Home Pheremone"
      seqq[i,which(seqq[i,]=="DFP")]="Drop Food Pheremone"
      seqq[i,which(seqq[i,]=="FHP")]="Follow Home Pheremone"
      seqq[i,which(seqq[i,]=="FFP")]="Follow Food Pheremone"
      seqq[i,which(seqq[i,]=="MRND")]="Move Randomly"
      seqq[i,which(seqq[i,]=="RGH")]="Remember Home"
      seqq[i,which(seqq[i,]=="RGF")]="Remember Food"
    }
    df_seq=seqdef(seqq)
    jpeg(paste(outputFolder,"/tmSeq",j,".jpeg",sep=''),width = 1200, height = 600)
    seqiplot(df_seq)
    dev.off()
    jpeg(paste(outputFolder,"/hist",j,".jpeg",sep=''),width = 1200, height = 500)
    seqmtplot(df_seq)
    dev.off()
  }
}
