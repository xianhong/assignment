id.filenames <- function (id=1:332) {
  len<- length(id)
  n<- 1
  filenames<-character(len)
  while  (n <= len) {
    if (id[n]<10) filenames[n]<-paste0("00",id[n])
      else if (id[n]<100) filenames[n]<-paste0("0",id[n])
    else filenames[n]<-id[n]
  
  n<- n+1
  }
  paste(filenames,".csv",sep="")
}

id.full_filenames <- function (directory, id=1:332) {
  if (length(id)==0) character()
  else paste(directory,id.filenames(id),sep="/")
  
}

full_read <- function (directory, id=1:332) {
  files <- id.full_filenames (directory,id)
  a <- data.frame()
  for (f in files) {
    a<- rbind(a, read.csv(f))
  }
  a
}

pollutantmean <- function(directory, pollutant, id = 1:332) {
  all_records<- full_read(directory,id)
  mean(all_records[[pollutant]],na.rm=TRUE)
}
  
