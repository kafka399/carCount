setwd('/home/git/carCount/')
files=list.files('test/pos/')

pos=matrix(nrow=NROW(files),ncol=100*100)

for(i in 1:NROW(files))
{
  gray_file=read.pnm(paste('test/pos/',files[i],sep=''))
  pos[i,]=c(gray_file@grey)
}
outcome=vector(length=NROW(files))
outcome[which(outcome!=1)]=1



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

forest=svm(rbind(pos,neg),outcome)

cross_val=pos[84:90,]

pred=predict(forest,cross_val,decision.values=TRUE)


##########################unseen data######################
files=list.files('crossval/out/slide/')
cross=matrix(nrow=NROW(files),ncol=100*100)

for(i in 1:NROW(files))
{
  gray_file=read.pnm(paste('crossval/out/slide/',files[i],sep=''))
  cross[i,]=c(gray_file@grey)
}
pred=predict(forest,cross,decision.values=TRUE)