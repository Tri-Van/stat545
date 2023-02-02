library(IPDfromKM)
#SOLVD_placebo<-getpoints("C:/Users/Tri Van/Desktop/Capture.JPG",x1=0,x2=12,y1=0,y2=100)
SOLVD_placebo
SOLVD_trisk<-c(0,2,4,6,8,10,12) # unit =1 year
SOLVD_nrisk<-c(1284,940,719,562,425,328,151)

#Process data coordinates
SOLVD_placebo_preprocess<-preprocess(dat=SOLVD_placebo,trisk=SOLVD_trisk,nrisk=SOLVD_nrisk,maxy=100)
#Reconstruct IPD
est_SOLVD_placebo<-getIPD(prep=SOLVD_placebo_preprocess, armID=0, tot.events = NULL)
#Accuracy assessment
summary(est_SOLVD_placebo)
plot(est_SOLVD_placebo)

#Secondary analysis
report<-survreport(ipd1=est_SOLVD_placebo$IPD,arms=1,interval = 1)
print(report)

A <- structure(list(Time = c(0, 1, 2, 4, 6, 8, 9, 10, 11, 12, 13, 14, 15, 16, 18, 19, 20, 21, 22, 24, 25, 26, 27, 28, 29, 30), 
Counts = c(126.6, 101.8, 71.6, 101.6, 68.1, 62.9, 45.5, 41.9, 46.3, 34.1, 38.2, 41.7, 24.7, 41.5, 36.6, 19.6, 22.8, 29.6, 23.5, 15.3, 13.4, 26.8, 9.8, 18.8, 25.9, 19.3)), 
.Names = c("Time", "Counts"), row.names = c(1L, 2L, 3L, 5L, 7L, 9L, 10L, 11L, 12L, 13L, 14L, 15L, 16L, 17L, 19L, 20L, 21L, 22L, 23L, 25L, 26L, 27L, 28L, 29L, 30L,31L), class = "data.frame")

A <- structure(list(Time = c(0, 1, 2, 4, 6, 8, 9, 10, 11, 12, 13, 14, 15, 16, 18, 19, 20, 21, 22, 24, 25, 26, 27, 28, 29, 30), 
                    Counts = c(126.6, 101.8, 71.6, 101.6, 68.1, 62.9, 45.5, 41.9, 46.3, 34.1, 38.2, 41.7, 24.7, 41.5, 36.6, 19.6, 22.8, 29.6, 23.5, 15.3, 13.4, 26.8, 9.8, 18.8, 25.9, 19.3)), 
               .Names = c("Time", "Counts"), row.names = c(1L, 2L, 3L, 5L, 7L, 9L, 10L, 11L, 12L, 13L, 14L, 15L, 16L, 17L, 19L, 20L, 21L, 22L, 23L, 25L, 26L, 27L, 28L, 29L, 30L,31L), class = "data.frame")