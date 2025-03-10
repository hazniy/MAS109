#9 : Monte Carlo Methods 
#10 : loops 
#11 : Computing accurate Monte Carlo estimates
#simulate one set of 20 birthdays at a time, and record the number of unique birthdays.
numberUnique <- rep(0, times = 5)
numberUnique #[1] 0 0 0 0 0
#simulate the first set of 20 birthdays, count how many unique birthdays there are, and store the result in element 1 of numberUnique
birthdays <- sample(x = 1:365, size = 20, replace = TRUE)
numberUnique[1] <- length(unique(birthdays))
numberUnique #[1] 20  0  0  0  0
sort(birthdays) #[1]   4   8  20  25  35  60  75 109 118 128
                #[11] 131 180 191 197 202 211 214 227 333 346
#Then we simulate the second set of 20 birthdays, count how many unique birthdays there are, and store the result in element 2 of numberUnique
numberUnique[2] <- length(unique(birthdays))
sort(birthdays) #[1]   2  38  53  86  90  97 109 148 167 179
                #[11] 179 189 249 253 260 266 293 327 334 346
numberUnique #[1] 20 19  0  0  0
#exercise 10.1 
# Pre-assign numberUnique to be a vector of 5 zeros
numberUnique <- rep(0, 5)  
# Perform five simulations and store the results in numberUnique
birthdays <- sample(x = 1:365, size = 20, replace = TRUE)
numberUnique[1] <- length(unique(birthdays))

birthdays <- sample(x = 1:365, size = 20, replace = TRUE)
numberUnique[2] <- length(unique(birthdays))

birthdays <- sample(x = 1:365, size = 20, replace = TRUE)
numberUnique[3] <- length(unique(birthdays))

birthdays <- sample(x = 1:365, size = 20, replace = TRUE)
numberUnique[4] <- length(unique(birthdays))

birthdays <- sample(x = 1:365, size = 20, replace = TRUE)
numberUnique[5] <- length(unique(birthdays))
# Print the results
print(numberUnique) #[1] 20 20 19 19 19

#OR using loop 
results <- rep(0, times = 4)
for(i in 1:4){
  results[i] <- i ^ (i + 1)}
results #[1] 1 8 81 1024
#exercise 10.2 
#1. 
# Pre-assign numberUnique to be a vector of 10 zeros
numberUnique <- rep(0, 10)  
# Perform 10 simulations and store results in numberUnique
for (i in 1:10) {
  birthdays <- sample(x = 1:365, size = 20, replace = TRUE)
  numberUnique[i] <- length(unique(birthdays))
}
# Print the results
print(numberUnique) #[1] 20 20 20 20 20 19 19 20 19 19
#2.
reciprocals <- rep(0, 3)
reciprocals[1] <- 1 / 1
reciprocals[2] <- 1 / 2
reciprocals[3] <- 1 / 3
#or same with this form : 
reciprocals <- rep(0, 3)  # Pre-assign a vector of length 3
for (i in 1:3) {
  reciprocals[i] <- 1 / i}
print(reciprocals)  # [1] 1.0000000 0.5000000 0.3333333
#This loop iterates 3 times and assigns 1/i to the i-th position in the vector reciprocals.

#3. FIBONACCI SEQUENCE 
results <- rep(1, times = 10)
for(i in 3:10){
  results[i] <- results[i-1] + results[i-2]
}
print(results) #[1]  1  1  2  3  5  8 13 21 34 55
#Why i in 3:10 and Not i in 1:10?
#The first two values (results[1] and results[2]) are already set to 1.
#The formula results[i] <- results[i-1] + results[i-2] requires at least two previous values to compute the next term.
#If we started at i = 1, results[i-1] and results[i-2] would not exist (out of bounds error).

#11 : Computing accurate Monte Carlo estimates
#the more simulations we do, the better the estimate will be. Simulating 5 sets of 20 birthdays wasn’t enough, so let’s try a larger number: 100,000:
numberUnique <- rep(0, 100000)
for(i in 1:100000){
  birthdays <- sample(x = 1:365, size = 20, replace = TRUE)
  numberUnique[i] <- length(unique(birthdays))
}
mean(numberUnique < 20) #[1] 0.40967
#exercise 11.1
#Leap Year Constraint: Since all 30 people were born in a leap year, their birthdays are randomly assigned from 366 days instead of 365.
#Monte Carlo Method: We will simulate this scenario many times (e.g., 100,000 trials) and compute the relative frequency of each event.
#1. estimate the probability that two people only have birthdays on the same day.
#2. estimate the probability that at least two people have birthdays on the same day;
set.seed(123)  # For reproducibility
n_simulations <- 100000  # Number of trials
n_people <- 30
days_in_leap_year <- 366

# Counters
count_at_least_one_shared <- 0
count_exactly_one_pair <- 0

# Simulation loop
for (i in 1:n_simulations) {
  birthdays <- sample(1:days_in_leap_year, size = n_people, replace = TRUE)
  unique_counts <- table(birthdays)
  
  # Check if at least one birthday is shared
  if (any(unique_counts > 1)) {
    count_at_least_one_shared <- count_at_least_one_shared + 1
  }
  
  # Check if exactly one pair exists (one birthday occurs twice, all others are unique)
  if (sum(unique_counts == 2) == 1 && sum(unique_counts > 2) == 0) {
    count_exactly_one_pair <- count_exactly_one_pair + 1
  }
}

# Estimate probabilities
prob_at_least_one_shared <- count_at_least_one_shared / n_simulations
prob_exactly_one_pair <- count_exactly_one_pair / n_simulations

# Print results
cat("Estimated probability of at least two people sharing a birthday:", prob_at_least_one_shared, "\n")
cat("Estimated probability of exactly one pair sharing a birthday:", prob_exactly_one_pair, "\n")
