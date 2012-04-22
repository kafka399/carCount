setwd('/home/git/carCount/')

######read positives############
files=list.files('test/pos/')
pos=matrix(nrow=NROW(files),ncol=100*100)

for(i in 1:NROW(files))
{
  gray_file=read.pnm(paste('test/pos/',files[i],sep=''))
  pos[i,]=c(gray_file@grey)
}
outcome=vector(length=NROW(files))
outcome[which(outcome!=1)]=1


########read negatives#############
files=list.files('test/neg/')
neg=matrix(nrow=NROW(files),ncol=100*100)

for(i in 1:NROW(files))
{
  gray_file=read.pnm(paste('test/neg/',files[i],sep=''))
  neg[i,]=c(gray_file@grey)
}
tmp=vector(length=NROW(files))
tmp[which(tmp!=0)]=0
outcome=c(outcome,tmp)

forecast=svm(rbind(pos,neg),outcome)

cross_val=pos[84:90,]

pred=predict(forecast,cross_val,decision.values=TRUE)


##########################unseen data######################
files=list.files('crossval/out/slide/')
cross=matrix(nrow=NROW(files),ncol=100*100)

for(i in 1:NROW(files))
{
  gray_file=read.pnm(paste('crossval/out/slide/',files[i],sep=''))
  cross[i,]=c(gray_file@grey)
}
pred=predict(forest,cross,decision.values=TRUE)

###############copy positives into result directory###############
dir.create('result')
file.copy(paste('crossval/out/slide/',files[which(as.double(pred)>0.75)],sep=''),'result/')
