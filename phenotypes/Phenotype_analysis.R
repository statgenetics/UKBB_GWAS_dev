# This is an R script file to illustrate simple R commands 
# to analyze the quantitate phenotypes from UK Biobank data
# the goal is to import dataframes, make simple figures and plot data
# Besides the data will be inverse rank normalized using another R script avalaible online

#install some useful packages
install.packages("ggplot2")
install.packages("pastecs")
install.packages("dplyr")
install.packages("moments")
install.packages("tidyverse")
install.packages("gridExtra")
install.packages("ggpubr")
install.packages("RNOmni")

#Load some useful libraries
library(pastecs)
library(dplyr)
library(moments)
library(tidyverse)
library(ggplot2)
library(gridExtra)
library(ggpubr)
library(RNOmni)

# Clean any existing variables for safety
rm(list=ls())

# set the working directory
setwd("/Users/dianacornejo/pleiotropy_UKB/phenotypes")

# read a space delimited file
df <- read.table("UKB_caucasians_BMIwaisthip_AsthmaAndT2D_withagesex_033120", header=T,
                   sep = " ", dec = ".")

# list the first 5 and list 5 rows of the data
head(df,5) 
tail(df,5)

# summary of contents
attributes(df) 

#another way to view the data
glimpse(df)

# Summary statistics
summary(df)

# displays the structure of the data frame
str(df) 

# to make sure the data is a data frame
class(df)

# check for missing values in each variable
is.na(df$BMI)
colSums(is.na(df))

# Is a quick plot and allows less customization
qplot(df$AGE, geom="histogram")
qplot(df$AGE,
      geom="histogram",
      binwidth = 6,  
      main = "Histogram for Age", 
      xlab = "Age",  
      fill=I("blue"), 
      col=I("red"), 
      alpha=I(.2),
      xlim=c(30,80))

# Make an histogram using ggplot2 for the quantitative traits in UKB
# BMI, waist circumference, hip circumference, and waist to hip ratio
ggplot(df, aes(x=AGE)) + 
  geom_histogram(aes(y=..density..), breaks=seq(0, 1, by=2), 
                 col="black", 
                 fill="white", 
                 alpha = .2) + 
  labs(title="Histogram for Age", x="Age", y="Count") + 
  xlim(c(10,80)) + 
  ylim(c(0,40000)) + 
  theme_classic()

age_plot_density = ggplot(df, aes(x=AGE)) + 
  geom_histogram(aes(y=..density..), binwidth=1, color="black", fill="white")+
  geom_density(alpha=.2, fill="#FF6666") +
  scale_color_grey() + scale_fill_grey() +
  labs(title="Histogram for Age", x="Age") + 
  scale_x_continuous(breaks=seq(30,75,5)) +
  scale_y_continuous(breaks=seq(0,0.06,0.01)) +
  theme_classic()
age_plot_density

bmi_plot_count = ggplot(df, aes(x=BMI)) + 
  geom_histogram(aes(y=..count..), binwidth=1, color="black", fill="white")+
  scale_color_grey() + scale_fill_grey() +
  scale_x_continuous(breaks=seq(10,70,10)) +
  scale_y_continuous(breaks=seq(0,40000,10000)) +
  labs(title="Histogram for BMI", x="BMI") +
  theme_classic()
bmi_plot_count + theme(axis.line = element_line(colour="black", size=0.5, lineend="round"))

bmi_plot_density = ggplot(df, aes(x=BMI)) + 
  geom_histogram(aes(y=..density..), binwidth=1, color="black", fill="white")+
  scale_color_grey() + scale_fill_grey() +
  scale_x_continuous(breaks=seq(10,70,10))  +
  labs(title="Histogram for BMI", x="BMI") +
  theme_classic()
bmi_plot_density

waist_plot_density = ggplot(df, aes(x=WAIST)) + 
  geom_histogram(aes(y=..density..), binwidth=2, color="black", fill="white")+
  scale_color_grey() + scale_fill_grey() +
  scale_x_continuous(breaks=seq(50,200,50)) +
  labs(title="Histogram for waist circumference", x="waist circumference") +
  theme_classic()
waist_plot_density

hip_plot_density = ggplot(df, aes(x=HIP)) + 
  geom_histogram(aes(y=..density..), binwidth=2, color="black", fill="white")+
  scale_color_grey() + scale_fill_grey() +
  scale_x_continuous(breaks=seq(50,200,50)) +
  scale_y_continuous(breaks=seq(0,0.05,0.01)) +
  labs(title="Histogram for hip circumference", x="hip circumference") +
  theme_classic()
hip_plot_density

# Append new variable to dataframe here waist to hip ratio

WHR = (df$WAIST/df$HIP)
df$WHR = WHR

whr_plot_density = ggplot(df, aes(x=WHR)) + 
  geom_histogram(aes(y=..density..), binwidth = 0.05, color="black", fill="white")+
  scale_color_grey() + scale_fill_grey() +
  labs(title="Histogram for waist-to-hip ratio", x="WHR") +
  theme_classic()
whr_plot_density

# Drawing qqplots with ggplot2

ggplot(df,aes(sample=BMI)) + 
  stat_qq() +
  labs(title="QQ plot for BMI in UKB-EUR")+
  theme_classic()

ggplot(df,aes(sample=WAIST)) + 
  stat_qq() +
  labs(title="QQ plot for waist circumference in UKB-EUR")+
  theme_classic()

# Drawing qqplots with ggpubr

bmi_qqplot = ggqqplot(df$BMI, title="QQ plot BMI UKB Caucasian")
png("QQplot_BMI_UKB_Caucasian.png", width = 6, height = 4, unit="in", res=300)
print(bmi_qqplot)
dev.off()

waist_circum_qqplot = ggqqplot(df$WAIST, title="QQ plot Waist circumference UKB Caucasian" )
png("QQplot_WAIST_UKB_Caucasian.png", width = 6, height = 4, unit="in", res=300)
print(waist_circum_qqplot)
dev.off()

hip_circum_qqplot = ggqqplot(df$HIP, title="QQ plot Hip circumference UKB Caucasian")
png("QQplot_HIP_UKB_Caucasian.png", width = 6, height = 4, unit="in", res=300)
print(hip_circum_qqplot)
dev.off()

whr_qqplot = ggqqplot(df$WHR, title="QQ plot Waist to hip ratio UKB Caucasian")
png("QQplot_WHR_UKB_Caucasian.png", width = 6, height = 4, unit="in", res=300)
print(whr_qqplot)
dev.off()


# Formal normality tests. They only accept a maximum of 5000 samples
# Regarding the distribution of the qq plot these variables are clearly not normally distributed

shapiro.test(df$BMI)

# Perform inverse rank normalization for traits with non-normal distribution
# For this the script requires the removal of missing obervations

df[complete.cases(df$BMI), ] #Keep only complete rows for BMI column
df_complete_BMI = df[complete.cases(df$BMI), ] # create a dataset with complete cases for BMI
colSums(is.na(df_complete_BMI)) # make sure it did the right thing

df_complete_WAIST = df[complete.cases(df$WAIST), ]
colSums(is.na(df_complete_WAIST))

df_complete_WHR = df[complete.cases(df$WHR), ]
colSums(is.na(df_complete_WHR))

# Now apply rank normalization using library(RNOmni)

z = rankNorm(df_complete_BMI$BMI)

df_complete_BMI$rankNorm_BMI = rankNorm(df_complete_BMI$BMI)
df_complete_WAIST$rankNorm_WAIST = rankNorm(df_complete_WAIST$WAIST)
df_complete_WHR$rankNorm_WHR = rankNorm(df_complete_WHR$WHR)

# Visualize the data

INT_BMI_density_plot = ggplot(df_complete_BMI, aes(x=rankNorm_BMI)) + 
  geom_histogram(aes(y=..density..), 
                 col="black", 
                 fill="white", 
                 alpha = .2) + 
  labs(title="Density plot for INT-BMI", x="rankNorm_BMI") + 
  theme_classic()
png("Density_plot_INT-BMI_UKB_Caucasian.png", width = 6, height = 4, unit="in", res=300)
print(INT_BMI_density_plot)
dev.off()

INT_BMI_qqplot = ggplot(df_complete_BMI,aes(sample=rankNorm_BMI)) + 
  stat_qq() +
  labs(title="QQ plot for INT-BMI UKB-EUR")+
  theme_classic()
png("QQplot_INT-BMI_UKB_Caucasian.png", width = 6, height = 4, unit="in", res=300)
print(INT_BMI_qqplot)
dev.off()

INT_WAIST_qqplot = ggplot(df_complete_WAIST,aes(sample=rankNorm_WAIST)) + 
  stat_qq() +
  labs(title="QQ plot for INT-WAIST UKB-EUR")+
  theme_classic()
png("QQplot_INT-WAIST_UKB_Caucasian.png", width = 6, height = 4, unit="in", res=300)
print(INT_WAIST_qqplot)
dev.off()

INT_WHR_qqplot = ggplot(df_complete_WHR,aes(sample=rankNorm_WHR)) +
stat_qq() +
  labs(title="QQ plot for INT-WHR UKB-EUR")+
  theme_classic()
png("QQplot_INT-WHR_UKB_Caucasian.png", width = 6, height = 4, unit="in", res=300)
print(INT_WHR_qqplot)
dev.off()

# Write new dataframe to file

write.table(df_complete_BMI, file = "UKB_caucasians_BMIwaisthip_AsthmaAndT2D_INT-BMI_withagesex_041720", append = FALSE, sep = " ", dec = ".",
            row.names = FALSE, col.names = TRUE, quote=FALSE)

write.table(df_complete_WHR, file = "UKB_caucasians_BMIwaisthip_AsthmaAndT2D_INT-WHR_withagesex_042020", append = FALSE, sep = " ", dec = ".",
            row.names = FALSE, col.names = TRUE, quote=FALSE)

# GLM: apply generalized linear models to obtain residuals

bmi_glm <- glm(BMI ~ AGE + factor(SEX), data=df_complete_BMI)
summary(bmi_glm)
df_complete_BMI$bmi_residuals = residuals.glm(bmi_residuals)
plot(bmi_residuals)

waist_glm <- glm(WAIST ~ BMI + AGE + factor(SEX), data=df)
summary(waist_glm)
plot(waist_glm)

whr_glm  <- glm(WHR ~ AGE + factor(SEX), data=df)
summary(whr_glm)
plot(whr_glm)

# To plot residuals from library car
install.packages("car")
library(car)
residualPlots(dfbmi_residuals)

