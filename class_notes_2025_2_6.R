### class script 2025-2-6

url = 'ftp://aftp.cmdl.noaa.gov/products/trends/co2/co2_mm_mlo.txt' # sets url as a variable
co2 = read.table(file = url, col.names = c("year", "month", "decimal_date", "monthly_average", "deseasonalized", "n_days", "st_dev_days", 
                                           "monthly_mean_uncertainty")) # reads url for data and assigns names to columns
head(co2)
summary(co2)
range(co2$decimal_date)
min(co2$monthly_average)
max(co2$monthly_average)

pdf(file="figures/my_sweet_figure.pdf", width=7,height=5)
plot(monthly_average ~ decimal_date, data=co2, type = "l", xlab = "Year", ylab = "Monthly Co2 (ppm)", main = "Keeling Curve") # plots the data (monthly avg as a function of date using ~)
lines(y=co2$deseasonalized, x=co2$decimal_date, col="red")
dev.off()

# examine seasonal cycle
co2$seasonal_cycle = co2$monthly_average -co2$deseasonalized
head(co2)

plot(seasonal_cycle ~ decimal_date, data=co2, type = "l", col = "blue")

co2$decimal_date > 2020 # shows dates since 2020
which(co2$decimal_date > 2020) # asks which indicies are greater than 2020

co2_2020to2025 = co2[co2$decimal_date > 2020, ] # new variable from subsect of "co2"
summary(co2_2020to2025)

plot(seasonal_cycle ~ decimal_date, data=co2_2020to2025, type="l")

# examine monthly trend across timeseries

jan_analysis = co2$seasonal_cycle[which(co2$month==1)]
mean(jan_analysis)

co2_monthly_cycle = data.frame(month = seq(12), detrended_monthly_cycle=NA)

co2_monthly_cycle$detrended_monthly_cycle[1] = mean(co2[co2$month==1, "seaonal_cycle"]) # returned error, copied class code below
# problem with seq() function?

co2_monthly_cycle = data.frame(month=c(1:12), detrended_monthly_cycle=NA) #Note how it automatically recycles NA to fill the column
head(co2_monthly_cycle)

co2_monthly_cycle$detrended_monthly_cycle[1] = mean(co2[co2$month==1,'seasonal_cycle'])
co2_monthly_cycle$detrended_monthly_cycle[2] = mean(co2[co2$month==2,'seasonal_cycle'])
co2_monthly_cycle$detrended_monthly_cycle[3] = mean(co2[co2$month==3,'seasonal_cycle'])
co2_monthly_cycle$detrended_monthly_cycle[4] = mean(co2[co2$month==4,'seasonal_cycle'])
co2_monthly_cycle$detrended_monthly_cycle[5] = mean(co2[co2$month==5,'seasonal_cycle'])
co2_monthly_cycle$detrended_monthly_cycle[6] = mean(co2[co2$month==6,'seasonal_cycle'])
co2_monthly_cycle$detrended_monthly_cycle[7] = mean(co2[co2$month==7,'seasonal_cycle'])
co2_monthly_cycle$detrended_monthly_cycle[8] = mean(co2[co2$month==8,'seasonal_cycle'])
co2_monthly_cycle$detrended_monthly_cycle[9] = mean(co2[co2$month==9,'seasonal_cycle'])
co2_monthly_cycle$detrended_monthly_cycle[10] = mean(co2[co2$month==10,'seasonal_cycle'])
co2_monthly_cycle$detrended_monthly_cycle[11] = mean(co2[co2$month==11,'seasonal_cycle'])
co2_monthly_cycle$detrended_monthly_cycle[12] = mean(co2[co2$month==12,'seasonal_cycle']) # note how inefficient this code is!

co2_monthly_cycle

plot(detrended_monthly_cycle ~ month, type="l", data=co2_monthly_cycle) 

# practicing for loops
i = 77
print(paste("this is run", i))

# "for" assigns a value to a variable ("i"), going through a loop (1-4)
for (i in c(1,2,3,4)){
  print(paste("this is run", i))
}

for (peanut in c(35:41)){ 
  print(paste("this is run", peanut))
}

for (peanut in c("what", "the", "dog", "doing")){ 
  print(paste("this is run", peanut))
}

# indexing

my_vector = c(1,3,5,2,4) # initialize loop variables above loop!
n = length(my_vector)
my_vector_sq = rep(NA,n)
for(i in seq(n)){
  my_vector_sq[i] = my_vector[i]^2
  print(paste("i=",i, "and my_vector[i]=", my_vector[i], "and my_vector_sq[i]=", my_vector_sq[i]))
  total
}
my_vector_sq


# nested for loop

mat = matrix(c(2,0,8,5,5,-4), nrow=2, ncol=3)
mat_sq = matrix(rep(NA,6), nrow=2, ncol=3) 
 
for (i in seq(2)){
  for (j in seq(3)) {
    mat_sq[i,j] = mat[i,j]^2
  }
}
mat_sq






