#12 : analytical solution 
#13 : R markdown 

#12 
#20 people in a non-leap year, P(at least two birthdays the same)= 1−P(all 20 birthdays different)
#tot num possibilities same : 365 x 465 x ... x 365^20 
#tot num possibilities diff : 365 x 364 x 363 x ... x 346
#exercise 12.1 at least 2 birthdays are the same 30 people 
#P(at least one shared) = 1 - P(all unique)
#P(all unique) = 366/366 x 365/366 x ... x (366 - 29) / 366 
n_people <- 30
days_in_leap_year <- 366

# Compute probability that all birthdays are unique
p_unique <- prod((days_in_leap_year:(days_in_leap_year - n_people + 1)) / days_in_leap_year) #creates a sequence of numbers from 366 down to 366 - 29
#prod() : multiplies all elements together to get P(all unique), substract 1 gives P(at least one shared) 
# Compute probability that at least one pair shares a birthday
p_shared <- 1 - p_unique

# Print result
p_shared #0.7053034

#13 : R markdown : system for producing reports from a single R markdown document, PDF, Words, html etc 
#exercise 13.1 [R - markdown]
---
title: "Birthday Problem - Monte Carlo Simulation"
author: "Your Name"
date: "2025-03-11"
output: html_document
---

## Problem Overview

In this exercise, we are estimating the probability that at least two people share the same birthday. We assume that there are 30 people in the room, and each person is equally likely to have been born on any of the 366 days of the year (for a leap year). The two main approaches we will use are the **analytical solution** and the **Monte Carlo simulation**.

### Analytical Solution

To calculate the probability that at least two people share the same birthday, we first calculate the probability that **all people have unique birthdays**. This probability can be calculated using the formula:

\[
P(\text{all unique}) = \frac{366}{366} \times \frac{365}{366} \times \dots \times \frac{(366 - 29)}{366}
\]

The probability that **at least one person shares a birthday** is then:

\[
P(\text{at least one shared}) = 1 - P(\text{all unique})
\]

### R Code for Analytical Solution

```{r}
# Analytical solution for birthday problem
n_people <- 30
days_in_leap_year <- 366

# Compute probability that all birthdays are unique
p_unique <- prod((days_in_leap_year:(days_in_leap_year - n_people + 1)) / days_in_leap_year)

# Compute probability that at least one pair shares a birthday
p_shared <- 1 - p_unique

# Display result
p_shared
```

### R Code for Monte Carlo Simulation 
Now we will estimate the probability using a Monte Carlo simulation. This method simulates the scenario of 30 people having random birthdays multiple times and calculates the fraction of simulations where at least one pair of people shares a birthday.
```{r}
set.seed(123)  # Set seed for reproducibility
n_simulations <- 10000  # Number of simulations
n_people <- 30  # Number of people
days_in_leap_year <- 366  # Days in a leap year
count_shared <- 0  # Counter for cases with shared birthdays

# Run simulations
for (i in 1:n_simulations) {
  birthdays <- sample(1:days_in_leap_year, size = n_people, replace = TRUE)  # Simulate birthdays
  if (length(unique(birthdays)) < n_people) {  # Check if there are duplicate birthdays
    count_shared <- count_shared + 1
  }
}

# Estimate probability
p_shared_monte_carlo <- count_shared / n_simulations  # Estimate probability
p_shared_monte_carlo
```

### Histogram of unique birthdays
We will now generate a histogram of the number of unique birthdays across multiple simulations. In this case, we simulate the birthdays for 30 people 10 times and track how many unique birthdays are observed in each simulation.
```{r}
# Pre-allocate vector for storing number of unique birthdays
numberUnique <- rep(0, 10)

# Run the simulation and store results
for (i in 1:10) {
  birthdays <- sample(1:days_in_leap_year, size = n_people, replace = TRUE)
  numberUnique[i] <- length(unique(birthdays))
}

# Generate histogram for unique birthdays
hist(numberUnique, main = "Histogram of Number of Unique Birthdays", xlab = "Number of Unique Birthdays", col = "lightblue")
```

###Analytical Solution:
The calculated probability that at least two people share a birthday is: r p_shared

###Monte Carlo Simulation:
The estimated probability from the Monte Carlo simulation is:r p_shared_monte_carlo

#################code chunk so that R not appear on html : https://yihui.org/knitr/options/
#################table : https://www.tablesgenerator.com/markdown_tables.
#################knitr() package : produce table from data frame 
###########default heading                                                                                                                                                                                                                                               
---
title: "My Report Title"
author: "Jeremy Oakley"
date: "2024-01-27"
output:
  pdf_document: 
    number_sections: true
  html_document: 
    number_sections: true
fontsize: 11pt
urlcolor: blue
header-includes:
  - \usepackage{bm}
---                                                                                                                                                                                                                                              
                                                                                                                                                                                                                                              
                                                                                                                                                                                                                                              
knitr::kable(head(mtcars))                                                                                                                                                                                                                                              
                                                                                                                                                                                                                                              
                                                                                                                                                                                                                                              #for plotting 
 ```{r, fig.align = 'center', fig.cap = "My figure caption", fig.height = 3, fig.width = 3}
ggplot2::ggplot(mtcars, ggplot2::aes(x = wt, y = mpg)) +
  ggplot2::geom_point()
```                                                                                                                                                                                                                                             
#fig.height and fig.width that give the figure size you want.                                                                                                                                                                                                                                              
#you may find the option out.width = "60%" easier to work with than fig.height and fig.width                                                                                                                                                                                                                                             
#exercise 13.2
---
title: "Birthday Problem - Monte Carlo Simulation"
author: "Your Name"
date: "2025-03-11"
output: html_document
---

## Problem Overview

In this exercise, we are estimating the probability that at least two people share the same birthday. We assume that there are 30 people in the room, and each person is equally likely to have been born on any of the 366 days of the year (for a leap year). The two main approaches we will use are the **analytical solution** and the **Monte Carlo simulation**.

### Analytical Solution

To calculate the probability that at least two people share the same birthday, we first calculate the probability that **all people have unique birthdays**. This probability can be calculated using the formula:

\[
P(\text{all unique}) = \frac{366}{366} \times \frac{365}{366} \times \dots \times \frac{(366 - 29)}{366}
\]

The probability that **at least one person shares a birthday** is then:

\[
P(\text{at least one shared}) = 1 - P(\text{all unique})
\]

### R Code for Analytical Solution

```{r, echo=FALSE}
# Analytical solution for birthday problem
n_people <- 30
days_in_leap_year <- 366

# Compute probability that all birthdays are unique
p_unique <- prod((days_in_leap_year:(days_in_leap_year - n_people + 1)) / days_in_leap_year)

# Compute probability that at least one pair shares a birthday
p_shared <- 1 - p_unique

# Display result
p_shared
```
###monte carlo                                                                                                                                                                                               
```{r, echo=FALSE}
                                     
set.seed(123)  # Set seed for reproducibility
n_simulations <- 10000  # Number of simulations
n_people <- 30  # Number of people
days_in_leap_year <- 366  # Days in a leap year
count_shared <- 0  # Counter for cases with shared birthdays


# Run simulations
for (i in 1:n_simulations) {
  birthdays <- sample(1:days_in_leap_year, size = n_people, replace = TRUE)  # Simulate birthdays
  if (length(unique(birthdays)) < n_people) {  # Check if there are duplicate birthdays
    count_shared <- count_shared + 1
  }
}

# Estimate probability
p_shared_monte_carlo <- count_shared / n_simulations  # Estimate probability
p_shared_monte_carlo
```                                                                                                                                                                                                                                             
###histogram                                                                                                                                                                                                                                            
```{r, echo=FALSE}
# Pre-allocate vector for storing number of unique birthdays
numberUnique <- rep(0, 10)


# Run the simulation and store results
for (i in 1:10) {
  birthdays <- sample(1:days_in_leap_year, size = n_people, replace = TRUE)
  numberUnique[i] <- length(unique(birthdays))
}

# Generate histogram for unique birthdays
hist(numberUnique, main = "Histogram of Number of Unique Birthdays", xlab = "Number of Unique Birthdays", col = "lightblue")
```                                                                                                                                                                                                                                     
                                                                                                                                                                                                                                          
