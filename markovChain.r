# x <- c(1,2,1,1,3,4,4,1,2,4,1,4,3,4,4,4,3,1,3,2,3,3,3,4,2,2,3)
# p <- matrix(nrow = 4, ncol = 4, 0)

# for (t in 1:(length(x) - 1))
# {
#  p[x[t], x[t + 1]] <- p[x[t], x[t + 1]] + 1
# }
# for (i in 1:4) p[i, ] <- p[i, ] / sum(p[i, ])


#tbl=read.table('tm0.csv', header = TRUE,  sep = ',',  stringsAsFactors = FALSE)
#get_markov_chain=function(inputFileinitial)
#{
    inputFileinitial="Data/seqPlots/df"
    nms=c("DHP","DFP","FHP","FFP","MRND","context+1","context-1")
    lstTransMat =list()
    lstu0 = list()
    marginalProbab=list()
    for (k in 0:10)
    {
        st_r = paste(inputFileinitial,k,".csv",sep='')
        tbl=read.table(st_r, header = TRUE,  sep = ',',  stringsAsFactors = FALSE)
        tbl =t(tbl)
        pTotal <- matrix(nrow = 7, ncol = 7, 0)
        rownames(pTotal)<- nms
        colnames(pTotal)<- nms
        #u0=0
        for (i in 1:ncol(tbl))
        {
         #   u0=u0+table(tbl[,i])
            p <- matrix(nrow = 7, ncol = 7, 0)
            rownames(p)<- nms
            colnames(p)<- nms
            #rownames(x) <- value

            x=unname(as.vector(tbl[,i]),force=FALSE)
            for(t in 1:99)
            {
                # print(x[t])
                # print(x[t+1])
                p[x[t], x[t + 1]] <- p[x[t], x[t + 1]] + 1   
            }
            for (j in 1:ncol(p)) p[j, ] <- p[j, ] / sum(p[j, ])
            pTotal = pTotal+p
        }
        #lstu0[st_r]=list((u0/ncol(tbl))/nrow(tbl))
        pTotal=pTotal/ncol(tbl)
        lstTransMat[st_r]=list(pTotal)
        #marginalProbab[st_r]=list(matrix(as.vector(lstu0[[st_r]]),nrow=1) %*% lstTransMat[[st_r]])
    }
 #   return(list(lstu0,lstTransMat,marginalProbab))
#}

checkConstanTprobab=function(p) {
    i =1
    old_p = p
    new_p = p
    sm = sum(p)
    ll = list()
    ll[[i]] = p
    while(sm>0.01)
    {
        old_p = new_p
        new_p = old_p %*% p
        sm=sum(abs(old_p-new_p))
        i =i+1
        ll[[i]] = new_p
    }

    return(list(list(ll),list(i)))
}