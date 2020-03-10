aula 1
================
10/03/2020

# Geração de números NPAs (Números pseudo-aleatórios)

## Números pseudo-aleatórios

  - números aleatórios (NAs) gerados usando fenomenos naturais
    (e.g.,lançamento de um dado ou mmoeda)

  - número, pseudo-aleatório, gerados computacionalmente

#### Definição

Um gerador NPa é um algoritmo que produz como output sequências de
números que podem ser usados em substituição de uma sequências IIDs de
verdadeiros NAs

### Gerador Congrencial Linear (gerador de Lehma)

  - Algoritmo
      - Input: m \> 1 (módulo)
          - a existe em {1,2,…,m-1} (multiplicativo)
          - c existe em {0,1,…,m-1} (incremento)
          - X\_0 existe em {0,1,..,m-1} (semente)
      - Output: X\_1,X\_2,… uma sequência NPAs
        1.  for n=1,2,3,… do
        2.  X\_n \<- (aX\_{n-1}+c) mud m
        3.  Output X\_n
        4.  end for
      - Pontos:
        1.  mud: resto da divisão inteira
        2.  A sequência gerada consiste em números inteiros, X\_n existe
            em {0,1,…, m-1}
        3.  Output depende fortemente dos parametros m,a,c,X\_0

##### No R

``` r
LCG <- function(n, m, a, c, X0) {
  X <- c()
  Xn <- X0
  for (i in 1:n) {
    Xn <- (a*Xn + c) %% m
    X[i] <- Xn
  }
  return(X)
}
m <- 8;a <- 5;c <- 1;seed <- 0;N<-10
X<-numeric();Y<-numeric()
X[1]<-seed

for(n in 2:(N+1)) {
  X[n] <- LCG(1, m, a, c, X[n-1])
  Y[n]<-5*X[n-1]+1
}

Congruencial <- data.frame(n=c(1:N),Yn=Y[2:(N+1)],Xn=X[2:(N+1)])
Congruencial
```

    ##     n Yn Xn
    ## 1   1  1  1
    ## 2   2  6  6
    ## 3   3 31  7
    ## 4   4 36  4
    ## 5   5 21  5
    ## 6   6 26  2
    ## 7   7 11  3
    ## 8   8 16  0
    ## 9   9  1  1
    ## 10 10  6  6

### Observações sobre geradores NPAs

  - Sequência NPas é periódica.
      - O comprimento é uma medida de qualidade
  - Depende de X\_0 (Seed)
  - Podem apresentar dependência
  - Podemos fazer testes de uniformidade (geradores uniformes de NPAs) e
    testes de correlação
