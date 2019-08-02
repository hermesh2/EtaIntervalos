# install.packages("MBESS")
library(MBESS)
library(dplyr)
# F(1,220)=4.397,
# error_function <- 
#   tryCatch( expr = {ci.pvaf(F.value= 4.397, df.1= 1, df.2= 220, N= 560 , conf.level= .90)}, 
#           error=function(e){cat("ERROR :",conditionMessage(e), "\n")}
#           )  
# is.null(error_function)
# error_function 
# df.1 <- 1
# df.2 <- 220
# F.value = 4.397
# Lims <- conf.limits.ncf(F.value = 4.397, conf.level = 0.90, df.1 = df.1, df.2 = df.2)
# Lower.lim <- Lims$Lower.Limit/(Lims$Lower.Limit + df.1 + df.2 + 1)
# Upper.lim <- Lims$Upper.Limit/(Lims$Upper.Limit + df.1 + df.2 + 1)
# Lower.lim
# Upper.lim
# 
# eta = 0.834 / 41.722
# eta



eta_ci <- 
  function(df.1 , df.2, F_value , SS_effect, SS_error, conf_level = 0.90, digits = 3){
    Lims <- conf.limits.ncf(F.value = F_value, conf.level = conf_level, df.1 = df.1, df.2 = df.2)
    Lower.lim <- Lims$Lower.Limit/(Lims$Lower.Limit + df.1 + df.2 + 1)
    Upper.lim <- Lims$Upper.Limit/(Lims$Upper.Limit + df.1 + df.2 + 1)
    print( paste("eta = ", (SS_effect / SS_error) %>%  round(digits = digits) ,
                 "[", Lower.lim %>%  round(digits = digits),
                 ", ",Upper.lim %>%  round(digits = digits), "]" ))
    return( list( 
      eta = SS_effect / SS_error,
      Lower.lim = Lower.lim,
      Upper.lim = Upper.lim
    ) %>% unlist %>%  round(digits = digits) )
}

eta_ci(df.1 = 1, df.2 = 220, F_value = 4.397,SS_effect = 0.834,SS_error = 41.722, conf_level = 0.90 ) 
eta_ci(df.1 = 2, df.2 = 440, F_value = 3.627,SS_effect = 3.012,SS_error = 182.684, conf_level = 0.90 ) 





