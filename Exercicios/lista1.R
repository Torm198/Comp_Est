library(tidyverse)
########exercicio 1###########
amostra <- function(n,lambda=1,gamma=1){
  (log(runif(n)/lambda)/-lambda)+gamma
}

amostra(10)

##########exercicio 2#########

