
tide=tide_data
press=pressure_data

monthly_pressure_Pa <- press$pressure
#  Convert monthly surface pressure data to meters of water column (mwc)
monthly_pressure_mwc <- monthly_pressure_Pa / 9806.65

# Calculate monthly inverse barometric correction factor
monthly_temperature_degC <- press$temp- 273.15
# Calculate monthly inverse barometer correction factor
monthly_ibcf <- 1 - (0.002277 * monthly_pressure_mwc) / (1 + 0.0001 * monthly_temperature_degC * 1.8)


#Interpolating Missing data 
library(zoo)
spline_fit <- spline(seq_along(monthly_ibcf), monthly_ibcf, n=nrow(tide))#Interpolate the monthly_ibcf values using a cubic spline
interpolated_ibcf <- spline_fit$y

corT <- tide$fitted - interpolated_ibcf


time=tide$datetime
raw_height_cm=tide$height_cm
raw_height_m=tide$height_m
harmo_fitted_tide=tide$fitted
final_atomCorr=corT

f_tide=data.frame(time,raw_height_cm,raw_height_m,harmo_fitted_tide,final_atomCorr)

# #Only matched Pressure Date
# corrected_cor <- head(tide$fitted, length(monthly_ibcf)) - monthly_ibcf

write.csv(f_tide, file = "C:\\Users....csv")

