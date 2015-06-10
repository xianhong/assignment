# notes
source("complete.R")

calculate_corr_per_monitor <- function (file){
  a<- read.csv(file)
  x<- a["sulfate"]
  y<- a["nitrate"]
  as.numeric(cor(x,y,use="pairwise.complete.obs"))
  
}

corr <- function(directory, threshold = 0) {
  
  complete_cases <- complete(directory)
  work_id<- subset(complete_cases,nobs > threshold)$id
  files <- id.full_filenames (directory,work_id)
  as.numeric(lapply(files,calculate_corr_per_monitor))      
  }