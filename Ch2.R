# Calling library to work for you
qqplot()
library(ggplot2)
x<- c(-1,-0.8,-0.6,-0.4,-0.2,0,0.2,0.4,0.6,0.8,1)
x
y<- x^3
y
qplot(x)
# the scatter plot worked because R used what is called as 
# element wise execution. 

## Histogram
x<- c(1,2,2,2,3,3)
qplot(x,binwidth=1)
x2<- c(1,1,1,1,1,2,2,2,2,3,3,4)
qplot(x2,binwidth=1)

# Excercise
x3<- c(0,1,1,2,2,2,3,3,4)
qplot(x3,binwidth=1)

# Replecate provides an easy way to repeat an R command 
# many times. First argument gives the number of times you
# want to repeat and then give the command  that you wish to repeat.
replicate(3,1+1)
replicate(10, roll())

rolls<- replicate(10000,roll())
qplot(rolls,binwidth=1)
# the result suggests that the dice is fair. in the long run
# each number occurs in the proportion to the number of combinations
# that can generate it. 

## ??keyword  R will promt for related help pages
??ggplot2
# if you know the function still need help then
?sample

# we can use the prob argument in the sample function to make
# the dice unfair. we need to wieght it in favor of certain no.
roll<- function(){
  die<- 1:6
  dice<- sample(die,2,replace = TRUE,
                prob = c(1/8,1/8,1/8,1/8,1/8,3/8))
  sum(dice)
}

rolls<- replicate(10000,roll())
qplot(rolls, binwidth=1)

