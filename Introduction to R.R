#left : Console 
#Inputs & outputs 
2 + 3 #[1] 5
5 * 6 #[1] 30
2 ^ 4 #[1] 16
500 ^ 3 #[1] 1.25e+08 #1.25 multiplied by 10 to the power of 8 
#exercise 2.1 
1 / 1000 ^ 3 #[1] 1e-09
#exercise 2.2 
4 / 2*2 #4
4 / (2*2) #1
16 ^ 1/2 #8
16 ^ (1/2) #4

#Variables and vectors
x <- 3
x #[1] 3
2 * x #[1] 6
##Everything in R is case sensitive: x is not the same as X.
y <- c(2, 4, 6, 8, 10) #vector variable c() 
z <- c(3, 5, 7, 9, 11)
y + z #[1]  5  9 13 17 21
#create a sequence of integers (as a vector)
3:10 #[1]  3  4  5  6  7  8  9 10 
x <- 3:10 
x #[1]  3  4  5  6  7  8  9 10
#test to see if elements of this vector equal a particular value
x == 4 #[1] FALSE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE 
#we sum the result, each TRUE is counted as a 1, and each FALSE is counted as a 0
sum(x < 5) #[1] 2 
#subsetting vectors
x <- c(12, 14, 16, 18, 20)
x[3] #[1] 16
#can replace elements
x[2] <- 0
x #[1] 12  0 16 18 20
#exercise 3.1 
x <- c(12, 14, 16, 18, 20)
x[2:4] #[1] 14 16 18
x[c(1, 3, 5)] #[1] 12 16 20
x[-4] #[1] 12 14 16 20

#logical subsetting 
x <- c(12, 14, 16, 18, 20)
x < 15 #[1]  TRUE  TRUE FALSE FALSE FALSE
x[x < 15] #[1] 12 14 #extract elements that satisfy condition 
#character strings 
x <- c("Monday", "Tuesday", "Wednesday")
x #[1] "Monday"    "Tuesday"   "Wednesday"
#factor() carry additional information about the possible levels. 
x <- factor(c("mild" ,"mild", "none", "severe"))
x # [1] mild   mild   none   severe 
  # Levels: mild none severe
x <- factor(c("mild" ,"mild", "none", "severe"),
            levels = c("none", "mild" ,"moderate", "severe"))
x # [1] mild   mild   none   severe
  # Levels: none mild moderate severe
#exercise 3.2 
responses <- factor(c("yes" ,"no", "no"),
            levels = c("yes", "no" ,"undecided")) 
responses #[1] yes no  no 
          # Levels: yes no undecided

#functions 
x <- 1:10
mean(x) ## [1] 5.5
#arguments (sort)
y <- c(5, 10, 6, 11, 7, 12)
sort(y) #[1]  5  6  7 10 11 12
sort(y, decreasing = TRUE) #[1] 12 11 10  7  6  5
seq(from = 0, to = 10, length = 11) #[1]  0  1  2  3  4  5  6  7  8  9 10
seq(from = 3, to = 11, length = 12) #[1]  3.000000  3.727273  4.454545  5.181818
                                    #[5]  5.909091  6.636364  7.363636  8.090909
                                    #[9]  8.818182  9.545455 10.272727 11.000000
#Help
?sort #trying the examples can often help you to understand how a function works.
#exercise 4.1 
#1. 
sample(1:6, size = 1) #[1] 2 RANDOM
#2. 
sample(1:6, size = 6) #[1] 4 2 5 1 3 6 RANDOM 
#3. 
#sample() : default samples without replacement, meaning it picks each number only once.
sample(1:6, size = 6, replace = TRUE) #[1] 6 5 3 1 2 3 
#the results will better reflect real dice rolls, where some numbers may appear more than once, just as in actual rolling.
