library(tidyverse)
#códigos não corrigidos, use por sua propria conta e risco

########exercicio 1###########
#utilizando função inversa com uniforme na 1 e 2
amostra_exponencial <- function(n,lambda=1,gamma=1){
  (log(runif(n)/lambda)/-lambda)+gamma
}

amostra(10)

##########exercicio 2#########


amostra_pareto <- function(n,a=2,b=2){
  b/(1-runif(n))**(1/a)
}
amostra_pareto(10)


#########exercicio 3##########



#usando sample
data.frame(x=sample(0:4,1000,replace = TRUE, prob = c(0.1,0.2,0.2,0.2,0.3))) %>%
  count(x) %>% mutate(prop_obs=n/sum(n))
