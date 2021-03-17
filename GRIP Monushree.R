# GRIP: The Sparks Foundation

# Monushree Ganguly, Data Science & Business Analysis Intern

## Task 1: Prediction using Supervised ML 

#IMPORTING DATA
info<-read.csv("C:/Users/debashishganguly/Downloads/student_scores.csv")

head(info,25)

# 1.scatterplot
plot(info$Hours,info$Scores)

#2.correlation
cor(info$Hours,info$Scores)


#Interpretation: 1 unit increase in the number of hours studied is leading
# to 0.97 unit increase in marks scored.

#3.Simple Linear Regression Model
r<-lm(Scores~Hours,data=info)

#4.Add regression line
abline(r)

# Interpretation: There is a strong uphill (positive) linear relationship 
# between number of hours studied and marks scored.Deviations are very small, 
# majority of the points on the plot lie on the line of best fit.

#5.Summary Stats
summary(r)

# Residuals shows how different the predictions were than the actual results.

coef(summary(r))

# Coefficients shows the actual predictor and the significance of each of 
# those predictors.

# 1) The Y intercept i.e. how much cann be scored with 0 hours of study

# 2) slope/ coefficient of no. of hours 9.7758 shows positive relationship, 
# i.e. increasing the no.of study hours by 1 unit would increase the 
# score by 9.7758 marks.


#7. fitted values
r$fitted.values
plot(info$Hours,r$fitted.values)

#8.0 prediction command on R
predict(r)

##  QUESTION:
#   What will be predicted score if a student studies for 9.25 hrs/ day? 

predict(r,list(Hours=9.25))

# We can find this manually also
2.4837+9.7758*9.25

# CONCLUSION: If a student studies for 9.25 hrs/ day, his/her predicted 
# score will be 92.90985.