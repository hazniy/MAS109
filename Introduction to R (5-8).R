#5 : Packages 
#6 : data frames 
#7 : Scripts 
#8 : A tip for understanding R code
#install.packages() to install a package.
install.packages("zoo")
#need to call back the package, 2 ways : 
#zoo package has a function rollmean() for computing rolling means (e.g. mean at time t of the most recent 4 observations up to time t)
zoo::rollmean(x, k = 4) #[1] 11.5 12.5 13.5 14.5 15.5 16.5 17.5 18.5 
#or 
library(zoo)
rollmean(x, k = 4) #[1] 11.5 12.5 13.5 14.5 15.5 16.5 17.5 18.5

#6 : data frames 
#R has various built-in data frames that we can use as illustrations
head(mtcars) #The full data set has 32 rows, but we will just display the first 6
head(CO2)
#extracting rows and columns 
mtcars$cyl #[1] 6 6 4 6 8 6 8 4 4 6 6 8 8 8 8 8 8 4 4 4 4 8 8 8 8 4 4 4 8 6 8 4
mtcars[2, ]
#tibbles : R will normally only show the first 10 rows, and as many columns as can be fitted in the screen (but R will tell us if there are more columns)
#Displaying only the first few rows, so large datasets don't clutter your screen.
#Keeping column types visible.
#Avoiding automatic conversion of character strings to factors.
tibble(mtcars)
#Line three tells us what data type we have in each column. (<dbl> is short for “double precision”, a numeric variable type).
#force R to display all the rows of a tibble, we can use the print function:
mtcarsTibble <- tibble::tibble(mtcars)
print(mtcarsTibble, n = nrow(mtcarsTibble))

str(mtcars) #display the internal structure of an object in a compact and readable way.
tibble::glimpse(mtcars)
#:: operator is used to access functions from a specific package without loading the entire package.
#glimpse() is like str(), but designed for tibbles and data frames.
#A compact overview of the dataset.
#A horizontal format (instead of the vertical output from str()), making it easier to scan.

#list 
mylist <- list(a = 1:10, b = "Monday")
names(mylist) #[1] "a" "b"
mylist$b #[1] "Monday"
#exercise 6.1 
install.packages("morley")
mean(morley$Speed) #[1] 852.4
median(morley$Speed) #[1] 850
IQR(morley$Speed) #[1] 85
quantile(morley$Speed, probs = c(0.25, 0.75))   #25%  75% 807.5 892.5  

#7 : Scripts 
#7.1 
x <- sample(2 * 1:10, size = 1) #2
y <- sample(2 * 1:10, size = 1) #14
x * y #[1] 28

#8 : A tip for understanding R code
x <- rep(2:4, each = 3)
sum(unique(x)) 
x #[1] 2 2 2 3 3 3 4 4 4
unique(x) #[1] 2 3 4
