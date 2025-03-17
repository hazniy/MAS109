---
title: "Cherry Tree Measurements Analysis"
author: "Hazni"
output:
  html_document: default
---

```{r, echo=FALSE}
# This code chunk will stop any messages/warnings appearing in your web page/pdf report.
# Including 'echo = FALSE' in the code chunk options stops this code from being displayed in your report.
knitr::opts_chunk$set(warning = FALSE)
knitr::opts_chunk$set(message = FALSE)
```

## Task 4
Load the tidyverse library into R:
```{r}
library(tidyverse)
```

## Task 5
```{r}
Trees <- read_csv("C:/Users/Farhazni/Desktop/Cherry_Tree_Measurements.csv")
head(Trees)
```
##Task 6
```{r}
max(Trees$Diameter)
Diam_Max <- max(Trees$Diameter)#assign new variable
Trees[Trees$Diameter==Diam_Max,]#find the max in that index
max(Trees$Height); max(Trees$Volume);
#Tree 31 also has the largest height and volume measurements.
```
##Task 7
```{r}
#Scatter plot to show the relationship between the diameter and volume of the measured cherry trees:
ggplot(data = Trees, aes(x = Diameter, y = Volume)) +
  geom_point(shape=17, size=2.5) +
  labs(x = "Tree diameter (inches)", y = "Tree volume (cubic ft)", 
       title = "The relationship between the diameter and volume of the cherry trees") 
```
##Task 8 
```{r}
summary(Trees[,-1])
#Using the mean value, the average tree diameter is 13.25 inches, and the range of tree diameters is 12.3 inches, with trees in the sample ranging from 8.3 to 20.6 inches in diameter.
#The average (mean) tree height in this data is 76 ft, with a relatively wide range, between 63 and 87 ft.
#The tree volume has a very wide range of 66.8 cubic ft, with values between 10.2 and 77 cubic ft. The average (mean) volume is 30.7 cubic ft.
#The mean and median values are the same for the tree height. This suggests that the sample of tree heights likely follow a distribution that is symmetric in shape. However, the mean and median values of the tree volume data are quite different, suggesting this variable has a distribution with a more skewed shape (towards lower values, as the median is less than the mean).

```
##Task 9 
```{r}
ggplot(data = Trees, aes(x = Height)) + 
  geom_histogram(colour = "blue", fill = "white", binwidth = 4) +
  labs(x = "Tree height (ft)", title = "Histogram of the tree height")

ggplot(data = Trees, aes(x = Volume)) + 
  geom_histogram(colour = "blue", fill = "white", binwidth = 10) +
  labs(x = "Tree volume (cubic ft)", title = "Histogram of the tree volume")
```





