#14 : probability distribution 
#‘d’ denotes the probability density function, pdf (or probability mass function, pmf, for discrete distributions);
#‘p’ denotes the cumulative distribution function, cdf;
#‘q’ denotes the quantile function (inverse cdf);
#‘r’ denotes the function to simulate random draws from the distribution (random generation).

## To compute Pr(X=40), we use the pmf:
dbinom(x = 40, size = 50, prob = 0.8)   #X Bin(n = 50, p = 4/5) 
## To compute Pr(X ≤ 30), we use the cdf:
pbinom(q = 30, size = 50, prob = 0.8) 
## Here we want to compute the 0.9 quantile (90th percentile) of the probability distribution.
## Hence, we use the quantile function:
qbinom(p = 0.9, size = 50, prob = 0.8)
## Under the company's assumption, we use the random generation function to simulate the sample
## given the assumed Binomial distribution 100 times and record the simulated value of X in each case:
X100 <- rbinom(n = 100, size = 50, prob = 0.8)
## plot the histogram of the simulated X values:
hist(X100, xlab = "X", main = "", freq = FALSE)

#15 Rstudio projects 
#file paths 
getwd() #R will have a current working directory
readr::read_csv("myData.csv") #or this one 
readr::read_csv("/Users/Jeremy/Documents/MAS113/myData.csv") #or this 

#working directories 
myData <- read_csv("../data/myData.csv") 
#If your R Markdown document is in the folder myProject/reports, and you want to import a file myData.csv from myProject/data, specify the (relative) file path in your R Markdown document as

