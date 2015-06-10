source("pollutantmean.R")

sum_complete_obs_per_monitor <- function (file){
  a<- read.csv(file)
  not_na <-(!is.na(a$sulfate)) & (!is.na(a$nitrate))
  d<- table(not_na)
  n<- as.integer(d["TRUE"])
  if (is.na(n)) 0
  else n
  
}
complete <- function(directory, id = 1:332) {
  files <- id.full_filenames (directory,id)
  nobs<-as.numeric(lapply(files,sum_complete_obs_per_monitor))      
  data.frame(id,nobs)
}


