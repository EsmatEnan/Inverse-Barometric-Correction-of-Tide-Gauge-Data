# Inverse-Barometric-Correction-of-Tide-Gauge-Data
This repository contains an R script that applies inverse barometric (IB) correction to tide-gauge records using collocated surface pressure and temperature data. It converts pressure (Pa) to meters of water column (mwc), computes a temperature-aware IB correction factor, interpolates it to the tide series, and outputs an atmospherically corrected tide.

Key steps included in the workflow:

Convert Pressure to Water Column (mwc):
Atmospheric pressure (Pa) is converted into meters of water column to make it compatible with tide gauge measurements.
Inverse Barometric Correction Factor (IBCF):
The correction factor is computed using surface pressure and temperature data, adjusting for density changes with temperature.
Interpolation of Missing Data:
Cubic spline interpolation is used to match the IB correction series with the tide gauge time series, ensuring consistency in length and resolution.
Corrected Tide Calculation:
The harmonic-fitted tide values are corrected by subtracting the interpolated IB correction factor, producing the final atmospherically corrected tide series.
Output:
The script exports a tidy dataset (CSV) containing:
Time
Raw tide height (cm, m)
Harmonic-fitted tide
Final corrected tide

Dependencies:
zoo (for interpolation)
Standard R functions

R (≥ 4.1 recommended)
Packages: zoo
