Author: Ugne Bunikyte
Contact information: u.bunikyte@student.tudelft.nl
Introductory information:


Description of project: 
This project aims to test the validity of a linear regression model to predict the effect of BMI on physical activity levels. 
The time period of interest is before and during the Covid-19 pandemic. 
The data was taken from a cohort of students in Erasmus University Rotterdam in the Netherlands.


Installation instructions:
The required software is Matlab.
Matlab R2021a installed through TU Delft's academic license. 
Install Matlab here: https://nl.mathworks.com/?s_tid=gn_logo
Furthermore, Statistical and Curve Fitting Toolboxes must be installed in Matlab R2021a.


Dataset title: Data_IER.xlsx (unavailable due to sensitive material)
Required information from Dataset: Year of study (2019 or 2020), BMI of participants, gender of participants, number of steps per day tracked by fitness watch x7, number of steps per day tracked by a mobile phone application x7

From the Data_IER.xlsx, the following columns must remain:

ID 	year	gender	bmi	stap_est	erv_fa_sub1_q	erv_fa_sub2_q	erv_fa	stap_app_1_aantal	stap_app_2_aantal	stap_app_3_aantal	stap_app_4_aantal	stap_app_5_aantal	stap_app_6_aantal	
stap_app_7_aantal	stap_om_1_aantal	stap_om_2_aantal	stap_om_3_aantal	stap_om_4_aantal	stap_om_5_aantal	stap_om_6_aantal	stap_om_7_aantal

Delete all other columns for code to run.


Methodological information:

Collection of data:
Data collected from students using an Omron fitness tracker and mobile phone application.


Generation of data (explanation of Matlab Code):
(Points 1 to 9 labelled in comments in code)
1. Read-in data is split into 6 matrices:
2019 - BMI Underweight (below 18.5)
2019 - BMI Normal Weight (between 18.5 and 25)
2019 - BMI Overweight (above 25) 
2020 - BMI Underweight (below 18.5)
2020 - BMI Normal Weight (between 18.5 and 25)
2020 - BMI Overweight (above 25) 

All rows containing NaN cell(s) removed

2. Mean number of steps over 7 days, for both watch and application is calculated.
Note: mean value is calculated irregardless if no data is available for a day/some days/only one method of counting steps

3. Plot scatters:
Figure(1) --> scatter of all BMI groups for 2020 (x-axis is BMI, y-axis is average number of steps)
Figure(2) --> scatter of all BMI groups for 2019 (x-axis is BMI, y-axis is average number of steps)

4. Linear model fitted for 2019 and 2020
Linear models for 2019 and 2020 datasets are plotted onto Figures(1) and (2)

5. Residuals calculated

6. Linear assumption validity graphs plotted:
Figure(3) --> Residuals versus probability 2019 and 2020 using plotResiduals(linearmodel,'probability')(x-axis is residuals, y-axis is probability)
Figure(4) --> Fitted values versus residuals 2019 and 2020 using plotResiduals(linearmodel,'fitted')(x-axis is fitted values, y-axis is residuals)

7. To obtain scale location plots:
Standardized residuals calculated
Figure(5) --> Scatter of fitted values versus square root of standardized residuals 2019 and 2020 (x-axis is fitted values, y-axis is sqrt of standardized residuals)
 (scale location plot)

8. Gender Distribution/BMI Distribution calculations:
Data read in as table
3 separate tables created for female, male or NA
Tables transformed to arrays
Arrays split for 2019 and 2020 (6 arrays for female, male, NA depending on 2019 or 2020 dataset)
NaN rows removed

9. BMI values' standard deviation and mean calculated for the 6 cases described above 







