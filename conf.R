# trial iteration count
N_TRIAL = 3000

# project period
START_DATE = as.Date("2015/1/1")
END_DATE   = as.Date("2016/9/30")
SPAN       = END_DATE-START_DATE

# fatal risk: SPECFLAW(failure to reach consensus)
FR = list("prob"=0.15, "fatal"=TRUE, "month"=8, "rate"=0)

# other risk factors
RF = list(1:10, list())
## RF01: SCHEDFLAW(error in original sizing) 
RF[[1]]  = list("min"=0.0, "mode"=0.2, "max"=0.5)
## RF02: TURNOVER(effet of employee turnover) 
RF[[2]]  = list("min"=0.0, "mode"=0.05, "max"=0.1)
## RF03: INFLATION(requirement function growth) 
RF[[3]]  = list("min"=0.0, "mode"=0.1, "max"=0.2)
## RF04: PRODUCTIVITY(effect of productivity variance) 
RF[[4]]  = list("min"=0.0, "mode"=0.05, "max"=0.2)
## RF05: OTHER RISK 
RF[[5]]  = list("min"=0.0, "mode"=0.0, "max"=0.0)
## RF06: OTHER RISK 
RF[[6]]  = list("min"=0.0, "mode"=0.0, "max"=0.0)
## RF07: OTHER RISK 
RF[[7]]  = list("min"=0.0, "mode"=0.0, "max"=0.0)
## RF08: OTHER RISK 
RF[[8]]  = list("min"=0.0, "mode"=0.0, "max"=0.0)
## RF09: OTHER RISK 
RF[[9]]  = list("min"=0.0, "mode"=0.0, "max"=0.0)
## RF10: OTHER RISK 
RF[[10]] = list("min"=0.0, "mode"=0.0, "max"=0.0)



