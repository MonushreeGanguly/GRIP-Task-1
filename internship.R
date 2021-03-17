info<-read.csv("C:/Users/debashishganguly/Downloads/student_scores.csv")

head(info,25)

#1.scatterplot(ordering)
plot(info$Hours,info$Scores)

#2.correlation
cor(info$Hours,info$Scores)

#Interpretation: 1 unit increase in the number of hours studied is leading
# to 0.97 unit increase in marks scored.

#3.Simple Linear Regression Model
r<-lm(Scores~Hours,data=info)

#4.Add regression line
abline(r)

#Interpretation: There is a strong uphill (positive) linear relationship between
#  number of hours studied and marks scored.Deviations are very small, majority 
#  of the points on the plot lie on the line of best fit.

#5.Summary Stats
summary(r)

#Call: shows the way the function has been defined. Here, it is scores explained
# by the number of hours using info data.

# Residuals: shows how much the model got each of its predictions wrong 
# i.e. how different the predictions were than the actual results.

#Coefficients: shows the actual predictor and the significance of each of 
# those predictors.
# 1) The Y intercept i.e. how much cann be scored with 0 hours of study
# 2) slope/ cefficient of no. of hours 9.7758, shows positive relationship, 
# increasing the no.of study hours by 1 unit would increase the 
# score by 9.7758 marks.
 
names(r)
coef(summary(r))

#6.coefficients
coef(r)

r$coef[1]+r$coef[2]*5

#7. fitted values
r$fitted.values
plot(info$Hours,r$fitted.values)

#8. prediction command
predict(r)
predict(r,list(Hours=9.25))
predict(r,data.frame(Hours=9.25))
predict(r,data.frame(Hours=c(9.25,3,16)))

8.1 manually
2.4837+9.7758*9.25

#9. prediction vs confidence interval
predict(r,data.frame(Hours=c(9.25,3,16)),interval = "confidence",level = 0.9)

predict(r,data.frame(Hours=c(9.25,3,16)),interval = "prediction",level = 0.9)

#  confidence interval is used when say you want to find the mean value of scores 
#  given that hours=5 prediction interval is used when say you want to find the 
#  likely range value of scores when hours=15. The prediction interval is wider 
#  than confidence interval.

#8.Extrapolation is using the model to make prediction outside the range of 
#  the input data. Example we had taken 16 while prediction. Regression only 
#  applies to the range in hand here it is 0 to 10 so going beyond this range 
#  means we are assumin that the pattern of uphill relation continues.

#ggplot (not working showing error)
ggplot(info,aes(x=Hours,y=Scores))+geom_point()+geom_smooth(method="lm")
