eye_gaze<- read.csv('E:/Semester VII/Final Year Project/test.csv', 
                    header=TRUE)

attach(eye_gaze)


plot(eye_gaze[,1],eye_gaze[,2],pch=19,col="red",xlab="X-coordinate of the image",ylab="Y-coordinate of the image")


plot(eye_gaze[,1], eye_gaze[,2], xlim=c(400, 1200), ylim=c(200, 600), main="Outliers removed \n A much better fit!", xlab="X", ylab="Y", pch="*", col="red", cex=2)
abline(lm(eye_gaze[,1] ~ eye_gaze[,2], data=eye_gaze), col="blue", lwd=3, lty=2)


eye_gaze <- na.omit(eye_gaze) 
eye_gaze <- scale(eye_gaze) 
fit <- kmeans(eye_gaze, 3)


aggregate(eye_gaze,by=list(fit$cluster),FUN=mean)
# append cluster assignment
#eye_gaze <- data.frame(eye_gaze, fit$cluster)


library(cluster) 
clusplot(eye_gaze, fit$cluster, color=TRUE, shade=TRUE, 
         labels=2, lines=0,xlim=c(0,1700),ylim=c(0 ,1000))





