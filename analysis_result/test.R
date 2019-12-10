

data<-read.csv("result.csv")
tol<-data[,3:16]
tol<-unlist(tol)
qqnorm(tol, main="Q-Q Plot of the Collected Data", xlab="Theoretical Quantiles (Joules)", ylab="Sample Quantiles (Joules)")
qqline(tol)
grid(lty=3, lwd=0.1)

logtol<-log(tol)
qqnorm(logtol, main="Q-Q Plot of the Collected Data in Log Transformation", xlab="Theoretical Quantiles (Joules)", ylab="Sample Quantiles (Joules)")
qqline(logtol)
grid(lty=3, lwd=0.1)

sqtol<-sqrt(tol)
qqnorm(sqtol, main="Q-Q Plot of the Collected Data in Squared Transformation", xlab="Theoretical Quantiles (Joules)", ylab="Sample Quantiles (Joules)")
qqline(sqtol)
grid(lty=3, lwd=0.1)

wi<-data[,10:16]
wi<-unlist(wi)
wio<-data[,3:9]
wio<-unlist(wio)


wi<-data[,3:34]
wi<-unlist(wi)
qqnorm(wi, main="Q-Q Plot of Apps with Issues (reciduals)", ylab="Reciduals of Sample Quantiles (Joules)")
qqline(wi)
wio<-data[,35:66]
wio<-unlist(wio)
qqnorm(wio, main="Q-Q Plot of Apps without Issues (reciduals)", ylab="Reciduals of Sample Quantiles (Joules)")
qqline(wio)

qqplot(wi,wio, xlab="Energy Consumption of Apps with Issues (Joules)",  ylab="Energy Consumption of Apps without Issues (Joules)")

shapiro.test(tol)
shapiro.test(logtol)
shapiro.test(sqtol)

summary(wi)
summary(wio)
sd(wi)
sd(wio)

hist(tol, ylim=30*c(0,5), xlim=5*c(5,10),col="dark grey", main="Histogram of Collected Data", xlab="Energy Consumption (Joules)")
grid(lty=3, lwd=0.1)

par(mfrow=c(1,2))
hist(wi, ylim=50*c(0,5),xlim=10*c(4,9), main="Histogram of Apps with Issues", xlab="Energy Consumption (Joules)")
grid(lty=3, lwd=0.1)
hist(wio, ylim=50*c(0,5),xlim=10*c(4,9), main="Histogram of Apps without Issues", xlab="Energy Consumption (Joules)")
grid(lty=3, lwd=0.1)
le
t.test(wi, wio, paired=TRUE)

library(vioplot)
par(mfrow=c(3,3))
for(i in 3:9){
  newdata<-c(data[i+7], data[i])
  vioplot(newdata, ylim=3*c(9,17), xlab="Apps with/without issues", ylab="Energy", wex=1.2, col=c("tomato", "skyblue"), names=c("1","0"))
  grid(lty=3, lwd=0.1)
}

par(mfrow=c(1,1))
vioplot(wi, wio, xlab="Apps with/without performance issues", ylab="Energy Consumption (Joules)", lwd=3, wex=1.2, col=c("tomato", "skyblue"), names=c("1","0"), main="Violin Plot of Apps' Energy Consumption" )
legend("topright", c("with 1 issue", "with 0 issue"), fill=c("tomato", "skyblue"))

plot(wio, ylim=5*c(5,10), xlab="Testing Times", ylab="Energy Consumption (Joules)", col="skyblue", pch=16, main="Scatter Plot of Two Treatments")
points(wi, col="tomato", pch=17)
grid(lty=3, lwd=0.1)
legend("bottom", c("Apps with 1 issue", "Apps with 0 issue"), col=c("tomato", "skyblue"), pch=c(17,16) )

wilcox.test(wi, wio, paired=TRUE, alternative = "two.sided")


SIGN.test(wi, wio, md = 0, alternative = "two.sided", conf.level = 0.95)
SIGN.test(wi, wio, md = 0, alternative = "less", conf.level = 0.95)

library(effsize)
cliff.delta(wi, wio)

library(ltm)
v1<-rep(1:0 , each=140)
v2<-c(wi,wio)
biserial.cor (v2, v1, use = "all.obs")

cor.test(wi, wio, method=c("kendall"))

rectCol="grey", colMed="black", colMed2="white"

par(mfrow=c(4,4))
for(i in 3:18){
  newdata<-c(data2[i], data2[i+32])
  ggplot( aes(x=myaxis, y=Energy_Consumption (J), fill=name)) +
    geom_violin(width=1.4) +
    geom_boxplot(width=0.1, color="grey", alpha=0.2) +
    scale_fill_viridis(discrete = TRUE) +
    theme_ipsum() +
    theme(
      legend.position="none",
      plot.title = element_text(size=11)
   ) +
    xlab("")