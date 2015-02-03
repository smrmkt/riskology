source("conf.R")

# risk distribution sampler
sampler = function(rf_, total=10) {
  range = rf_[["max"]]-rf_[["min"]]
  alpha = total*(rf_[["mode"]]-rf_[["min"]])/range
  beta = total*(rf_[["max"]]-rf_[["mode"]])/range
  sample = rbeta(1, alpha, beta)
  sample*range
}

# calculate fatal risk
fatal_risk = function(fr) {
  if (fr[["prob"]] < runif(1)) {
    return(0)
  } else {
    if (fr[["fatal"]]) {
      return(-1)
    } else {
      month = fr[["month"]]*30
      rate = (END_DATE-START_DATE)*fr[["rate"]]
      return(max(month, rate))
    }
  }
}

# calculate delay factor
delay_factor = function(RF) {
  df = 0
  for (i in 1:length(RF)) {
    df = df+sampler(RF[[i]])
  }
  df
}

# calcurate delay
cancelled = 0
delays = c()
for (i in 1:N_TRIAL) {
  delay = 0
  # check fatal risk
  fatal = fatal_risk(FR)
  if (fatal == -1) {
    cancelled = cancelled+1
    next
  } else {
    delay = delay+fatal
  }
  # add other risk factors
  for (i in 1:length(RF)) {
    delay = delay+(END_DATE-START_DATE)*sampler(RF[[i]])
  }
  delays = c(delays, as.integer(delay))
}

# draw histgram
png("img/histgram_of_delays.png", width=800, height=600)
hist(delays,
     breaks=max(10, as.integer(N_TRIAL/30)),
     main="Histgram of simulated delay days",
     xlab="Delay days",
     ylab="Frequency")
dev.off()

# print result
sprintf("iteration count: %d", N_TRIAL)
sprintf("project cancel count with fatal risk: %d", cancelled)
sprintf("cancel rate: %02.1f%%", cancelled/N_TRIAL*100)
print("Summary of delay days:")
summary(delays)
