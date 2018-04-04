# A vector is a one dimensional set of numbers.
1:6
# Create an object 
die<- 1:6
die
# you can see object already in use by ls()
ls()
# some mathematical maniputaltions 
die-1
die/2
die*die
# R uses elementwise execution.
# it lines up the 2 die vectors and then multiplies the first
# element of vector 1 with first element of vector 2.
# if the length of the shorter vector does not divide evenly 
# into the length of longer vector, R will return a warning.
# this is called vector recycling. 
1:2
1:4
die
die+1:2
die+1:4
# Element wise operations ensures that values from one observation
# or case are only paired with values from the same observation
# or case. 
# but r can also give traditional matrix multiplication.
# inner multiplicaton %*%
# outer multiplication %o%
die%*%die
die%o%die

## Functions 
# R comes with many functions 
# write the name of the function followed by the data.
round(3.1415)
factorial(3)
# Sample is a usefull function. 
#Sample takes 2 arguments a vector named x and a number names
# size. sample will return size elements form the vector. 
sample(x=1:4,size = 2)

# To roll a die and get a number use the sample function
sample(x=die,size = 1)
# if you dont know what arguments a functions needs you can
# check by using the args() function
args(sample)
# now in sample function for our die, the sampling is happening 
# without replacement hence if i make the size 2, still i wont
# get the same number drawn twice. 
# In our case the roll of one die and its outcome is independent
# of second roll. to do this we need sample with replacement.
sample(x=die,size = 2,replace = TRUE)
dice<- sample(x= die,size = 2, replace = TRUE)
dice
dice
# notice if we call dice multiple times stil we get the same
# number this is because R has stored the results of the first
# operation as dice and whenever we call its throws the same old workigns
# We need to create a roll function to solve this

## Function constructor
# every function in r has 3 basic parts:
# a name
# a body of code
# a set of arguments
# to do this call funtion() and follow it with a pair of braces
# my_function<- function() {}
roll<- function() {
die<-1:6
dice<- sample(x=die,size = 2, replace = TRUE)
sum(dice)
}

roll()
roll# if you type the name of the function without parenthesis
# r will show the code that makes the function. 

# If you have situation where the x (here die) may change value 
# future uses then this a more efficient code
roll2<- function(bones) {
  dice<- sample(bones,size = 2,replace = TRUE)
  sum(dice)
}

roll2(bones = 1:4)
# Above i have not given a default value to bones, i can do that
# if bones doesnt have a specfic value it will take the default
roll2<- function(bones= 1:6) {
  dice<- sample(bones,size = 2, replace = TRUE)
  sum(dice)
}
roll2()
roll2(bones = 1:8)


