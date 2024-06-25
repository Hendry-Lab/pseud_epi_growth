# load packages
library(lme4)
library(emmeans)
library(lmerTest)
library(ggplot2)
library("ggpubr")


## Differences in virulence of strains
vir<-read.table("Survival_21strains_nocontrols.txt",header=T)
v1<-lmer(prop.dead ~ strains + (1|round), data = vir)
anova(v1)
shapiro.test(resid(v1))
qqnorm(resid(v1))
hist(resid(v1))
plot(predict(v1), resid(v1)) # all look great

## Differences in epiphytic ability between strains
epis<-read.table("Epiphytic_21_avg_per_tube.txt",header=T)
names(epis)
head(epis)
e1<-lmer(logged ~ Strain + (1|Block), data = epis)
anova(e1)
shapiro.test(resid(e1))
qqnorm(resid(e1))
hist(resid(e1))
plot(predict(e1), resid(e1))   ## checks look good
