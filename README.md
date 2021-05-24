
Contact information: u.bunikyte@student.tudelft.nl
Introductory information:

Dataset title: Data_IER.xlsx (unavailable due to sensitive material)
Dataset contains: Year of study (2019 or 2020), BMI of participants, gender of participants, number of steps per day tracked by fitness watch x7, number of steps per day tracked by a mobile phone application x7


Methodological information:

All data containing anything other than year, gender, BMI and number of steps is removed.

Data is split into 6 matrices:
2019 - BMI Underweight (below 18.5)
2019 - BMI Normal Weight (between 18.5 and 25)
2019 - BMI Overweight (above 25) 
2020 - BMI Underweight (below 18.5)
2020 - BMI Normal Weight (between 18.5 and 25)
2020 - BMI Overweight (above 25) 

All rows containing NaN cell(s) removed

Mean number of steps over 7 days, for both watch and application is calculated.
Note: mean value is calculated irregardless if no data is available for a day/some days/only one method of counting steps


Code Description: 

Goal: 
Perform linear regression on data, check regression assumptions using scale location plot, residual vs fitted value plot and residual vs probability plot


Installation instructions:
Matlab R2020b installed through TU Delft's academic license, Statistical and Curve Fitting Toolboxes used

Code explanation:
Figure(1) --> scatter of all BMI groups for 2020 (x-axis is BMI, y-axis is average number of steps)
Figure(2) --> scatter of all BMI groups for 2019 (x-axis is BMI, y-axis is average number of steps)

Linear model fitted for 2019 and 2020
Linear models for 2019 and 2020 datasets are plotted onto Figures(1) and (2)

Residuals calculated

Figure(3) --> Residuals versus probability 2019 using plotResiduals(linearmodel,'probability')(x-axis is residuals, y-axis is probability)
Figure(4) --> Fitted values versus residuals 2019 using plotResiduals(linearmodel,'fitted')(x-axis is fitted values, y-axis is residuals)
Figure(5) --> Residuals versus probability 2020 using plotResiduals(linearmodel,'probability')(x-axis is residuals, y-axis is probability)
Figure(6) --> Fitted values versus residuals 2020 using plotResiduals(linearmodel,'fitted')(x-axis is fitted values, y-axis is residuals)

To obtain scale location plots:
Standardized residuals calculated

Figure(7) --> Scatter of fitted values versus square root of standardized residuals 2019(x-axis is fitted values, y-axis is sqrt of standardized residuals)
Figure(8) --> Scatter of fitted values versus square root of standardized residuals 2020(x-axis is fitted values, y-axis is sqrt of standardized residuals)

Gender Distribution/BMI Distribution calculations:

Data read in as table
3 separate tables created for female, male or NA
Tables transformed to arrays
Arrays split for 2019 and 2020 (6 arrays for female, male, NA depending on 2019 or 2020 dataset)
NaN rows removed

BMI values' standard deviation and mean calculated for the 6 cases described above 





