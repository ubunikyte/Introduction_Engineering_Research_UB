close all
clear
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Point 1 in README
data = xlsread('Data_IER.xlsx');

%Getting data in correct form
%Splitting dataset into 3 groups; underweight, normal weight and
%overweight/obese for both 2019 and 2020
i = 1;
for i = 1:193

    if data(i,4) > 24.9
        
        if data(i,2) == 2019
        bmi_over20191(i,:) = data(i,:);
    
        else
             bmi_over20201(i,:) = data(i,:);
            
        end
        
    else
        if data(i,4) > 18.4 && data(i,4) < 25
            if data(i,2) == 2019
                
        bmi_normal20191(i,:) = data(i,:);
            else 
              bmi_normal20201(i,:) = data(i,:);  
                
            end
        else
            if data(i,2) == 2019
            bmi_under20191(i,:) = data(i,:);
       
            else
                bmi_under20201(i,:) = data(i,:);
            
            end
        end
    end
end

%Removing all rows with Nan values from the split datasets, corresponds to removing all unlogged datasets 
bmi_over20191(isnan(bmi_over20191))=0;
bmi_over20191(all(~bmi_over20191,2),:) = [];

bmi_over20201(isnan(bmi_over20201))=0;
bmi_over20201(all(~bmi_over20201,2),:) = [];

bmi_normal20191(isnan(bmi_normal20191))=0;
bmi_normal20191(all(~bmi_normal20191,2),:) = [];

bmi_normal20201(isnan(bmi_normal20201))=0;
bmi_normal20201(all(~bmi_normal20201,2),:) = [];


bmi_under20191(isnan(bmi_under20191))=0;
bmi_under20191(all(~bmi_under20191,2),:) = [];

bmi_under20201(isnan(bmi_under20201))=0;
bmi_under20201(all(~bmi_under20201,2),:) = [];

i=1;
j=9;
bmi_under2020 = zeros(15,2);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Point 2 in README
%creating arrays with BMI value and mean number of steps. Counter is used
%to ensure mean is calculated from existing data, even if it is not complete
%Arrays are created for underweight, normal weight and overweight+obese BMI
%Arrays made for 2019 and 2020 for 3 weight classes
for i = 1:15
  counter = 0;
    for j = 9:22
        if bmi_under20201(i,j) == 0
           counter = counter + 1; 
        end
        n(i,1) = 14-counter;
    bmi_under2020(i,2) = (bmi_under2020(i,2)+bmi_under20201(i,j));
    end
    bmi_under2020(i,2) = bmi_under2020(i,2)/n(i,1); %mean of steps to give 1 value of average steps over week
      bmi_under2020(i,1) = bmi_under20201(i,4);
end
i=1;

for i = 1:12
    
     if bmi_under2020(i,1) ==0
          bmi_under2020(i,:) = [];
     end
end

bmi_normal2020 = zeros(78,2);

i=1;
j=2;
for i = 1:78
  counter = 0;
    for j = 9:22
        if bmi_normal20201(i,j) == 0
           counter = counter + 1; 
        end
        n(i,1) = 14-counter;
    bmi_normal2020(i,2) = (bmi_normal2020(i,2)+bmi_normal20201(i,j));
    end
    bmi_normal2020(i,2) = bmi_normal2020(i,2)/n(i,1); %mean of steps to give 1 value of average steps over week
     bmi_normal2020(i,1) = bmi_normal20201(i,4);
end


bmi_over2020 = zeros(6,2);
for i = 1:6
  counter = 0;
    for j = 9:22
        if bmi_over20201(i,j) == 0
           counter = counter + 1; 
        end
        n(i,1) = 14-counter;
    bmi_over2020(i,2) = (bmi_over2020(i,2)+bmi_over20201(i,j));
    end
    bmi_over2020(i,2) = bmi_over2020(i,2)/n(i,1); 
     bmi_over2020(i,1) = bmi_over20201(i,4);
end


bmi_under2019 = zeros(15,2);
i=1;
j=2;
for i = 1:15
  counter = 0;
    for j = 9:22
        if bmi_under20191(i,j) == 0
           counter = counter + 1; 
        end
        n(i,1) = 14-counter;
    bmi_under2019(i,2) = (bmi_under2019(i,2)+bmi_under20191(i,j));
    end
    bmi_under2019(i,2) = bmi_under2019(i,2)/n(i,1); %mean of steps to give 1 value of average steps over week
     bmi_under2019(i,1) = bmi_under20191(i,4);
end

for i = 1:14
    
     if bmi_under2019(i,1) ==0
          bmi_under2019(i,:) = [];
     end
end


bmi_normal2019 = zeros(75,2);
i=1;
j=2;
for i = 1:75
  counter = 0;
    for j = 9:22
        if bmi_normal20191(i,j) == 0
           counter = counter + 1; 
        end
        n(i,1) = 14-counter;
    bmi_normal2019(i,2) = (bmi_normal2019(i,2)+bmi_normal20191(i,j));
    end
    bmi_normal2019(i,2) = bmi_normal2019(i,2)/n(i,1); 
     bmi_normal2019(i,1) = bmi_normal20191(i,4);
end

bmi_over2019 = zeros(4,2);
i=1;
j=2;
for i = 1:4
  counter = 0;
    for j = 9:22
        if bmi_over20191(i,j) == 0
           counter = counter + 1; 
        end
        n(i,1) = 14-counter;
    bmi_over2019(i,2) = (bmi_over2019(i,2)+bmi_over20191(i,j));
    end
    bmi_over2019(i,2) = bmi_over2019(i,2)/n(i,1);
     bmi_over2019(i,1) = bmi_over20191(i,4);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Point 3 in README

%Linear regression analysis
%Plotting scatter for 2020 dataset
figure(1)
hold on
scatter(bmi_normal2020(:,1), bmi_normal2020(:,2),'filled','b')
scatter(bmi_under2020(:,1), bmi_under2020(:,2),'filled','r')
scatter(bmi_over2020(:,1), bmi_over2020(:,2),'filled','g')

xlim([15 35])
ylim([0 15000])

xlabel('BMI Value', 'Fontsize', 18)
ylabel('Weekly Average Number of Steps', 'Fontsize', 18)
ax = gca;
ax.FontSize = 16;


all2020 = cat(1,bmi_normal2020,bmi_under2020,bmi_over2020);

i =1;

all2020(isnan(all2020))=0;
all2020(all(~all2020,2),:) = [];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
%Point 4 in README
x = all2020(:,1);
y = all2020(:,2); 
mdl2020 = fitlm(x,y);

format long
b1 = x\y;
ycalc1 = b1*x;

X = [ones(length(x),1) x];
b0 = X\y;

ycalc2 = X*b0;

%Plotting 2020 linear regression line
plot(x,ycalc2, 'k')
legend('Normal weight', 'Underweight', 'Overweight/Obese', 'Linear fitted model','Fontsize', 18)

%Plotting scatter of 2019 dataset
figure(2)
hold on
scatter(bmi_normal2019(:,1), bmi_normal2019(:,2), 'filled','b')
scatter(bmi_under2019(:,1), bmi_under2019(:,2),'filled','r')
scatter(bmi_over2019(:,1), bmi_over2019(:,2),'filled','g')

xlim([15 35])
ylim([0 15000])

xlabel('BMI Value', 'FontSize', 18)
ylabel('Weekly Average Number of Steps', 'FontSize', 18)
ax = gca;
ax.FontSize = 16;

all2019 = cat(1,bmi_normal2019,bmi_under2019,bmi_over2019);
all2019(isnan(all2019))=0;
all2019(all(~all2019,2),:) = [];

x19 = all2019(:,1);
y19 = all2019(:,2); 
mdl = fitlm(x19,y19);

X19 = [ones(length(x19),1) x19];
b2019 = X19\y19;
ycalc2019 = X19*b2019;

%Plotting 2019 linear regression line
plot(x19,ycalc2019, 'k')
legend('Normal weight', 'Underweight', 'Overweight/Obese', 'Linear fitted model','FontSize', 18)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Point 5 in README
%Linear analysis assumptions test
%Calculating residuals 
i = 1;

for i = 1 : 95
residual_2020(i,1) = all2020(i,1);
residual_2020(i,2) = all2020(i,2) - 107.3*residual_2020(i,1) + 1878; 

if  i <93
residual_2019(i,1) = all2019(i,1);
residual_2019(i,2) = all2019(i,2) -(-175.67190324657*residual_2019(i,1) + 10062.7340945666); 
end

end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Point 6 in README
%Plotting residuals vs probability values for 2019
figure(3)
n1 = normplot(residual_2019(:,2));
hold on
n2 = normplot(residual_2020(:,2));
grid off
set(n1,'color','b') % to set color to red
set(n1,'marker','o','markerfacecolor','b') % to change marker
set(n2,'color','r') % to set color to red
set(n2,'marker','o','markerfacecolor','r') % to change marker

xlabel('Residuals','FontSize', 18)
ylabel('Probability','FontSize', 18)
title('','FontSize', 18 )
ax = gca;
ax.FontSize = 16;
legend('2019','','', '2020', 'FontSize', 18, 'Location','Southeast')


%Plotting residuals vs fitted values for 2019
figure(4)
hold on
plotResiduals(mdl,'fitted','Marker','o','MarkerFaceColor','b')
box off
xlabel('Fitted values','FontSize', 18)
ylabel('Residuals','FontSize', 18)
title('','FontSize', 18 )
ax = gca;
ax.FontSize = 16;

%Plotting residuals vs fitted values for 2020

plotResiduals(mdl2020,'fitted','Marker','o', 'MarkerFaceColor','r', 'MarkerEdgeColor','r')
box off
xlabel('Fitted values','FontSize', 18)
ylabel('Residuals','FontSize', 18)
title('','FontSize', 18 )
ax = gca;
ax.FontSize = 16;

legend('2019','','2020','FontSize', 18, 'Location','Northeast')

%Obtaining scale location plot
%leverage value for 2019 dataset
h2019 = leverage(all2019);
%leverage value for 2020 dataset
h2020 = leverage(all2020);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Point 7 in README
%Calculating standardized residuals
i=1;
for i = 1:95
   
    st2020(i,1) = residual_2020(i,2)/sqrt(mdl2020.MSE*(1-h2020(i,1)));
  
    if st2020(i,1) < 0
       st2020(i,1) = st2020(i,1)*(-1); 
    end
   
    
    if i < 93
       st2019(i,1)=residual_2019(i,2)/sqrt(mdl.MSE*(1-h2019(i,1)));
 
        if st2019(i,1) < 0
       st2019(i,1) = st2019(i,1)*(-1); 
        end   
    end  
end

%2019 scale location plot
figure(5)
hold on
scatter(mdl.Fitted, sqrt(st2019), 'filled','b')
xlabel('Fitted values','FontSize', 18)
ylabel('Square Root of Standardized Residuals','FontSize', 18)
ax = gca;
ax.FontSize = 16;

%2020 scale location plot

scatter(mdl2020.Fitted, sqrt(st2020), 'filled','r')
xlabel('Fitted values','FontSize', 18)
ylabel('Square Root of Standardized Residuals','FontSize', 18)
ax = gca;
ax.FontSize = 16;

legend('2019','2020')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Point 8 in README
%Gender Distribution Calculations for Methods section
%Read initial file as table to be able to find "female", "male", "NA"
gd = readtable('Data_IER.xlsx');

%Create separate arrays for female, male and NA genders from table
f = gd(gd.gender=="Female",:);
m = gd(gd.gender=="Male",:);
na = gd(gd.gender=="NA",:);

female(:,1) = f(:,2);
female(:,2) = f(:,4);
female(:,3) = f(:,5);

male(:,1) = m(:,2);
male(:,2) = m(:,4);
male(:,3) = m(:,5);

none(:,1) = na(:,2);
none(:,2) = na(:,4);
none(:,3) = na(:,5);


%Switch table format to array
female = table2array(female);
male = table2array(male); 
none = table2array(none); 

i = 1;

%Separate arrays in 2019 and 2020 datasets
for i = 1:111
    
    if female(i,1) == 2019       
            female2019(i,1) = female(i,2);
            female2019(i,2) = female(i,3);
    end
   
    if female(i,1) == 2020
        female2020(i,1) = female(i,2);
            female2020(i,2) = female(i,3);
    end
    
    if i < 67
       
          if male(i,1) == 2019       
            male2019(i,1) = male(i,2);
            male2019(i,2) = male(i,3);
    end
   
    if male(i,1) == 2020
        male2020(i,1) = male(i,2);
            male2020(i,2) = male(i,3);
    end
     
        
    end
    
    if i < 15
       
    if none(i,1) == 2019       
            none2019(i,1) = none(i,2);
            none2019(i,2) = none(i,3);
    end
   
    if none(i,1) == 2020
        none2020(i,1) = none(i,2);
            none2020(i,2) = none(i,3);
            
    end
    
       
    end
    
end


%Remove all Nan rows
female2019(isnan(female2019))=0;
female2019(all(~female2019,2),:) = [];
female2020(isnan(female2020))=0;
female2020(all(~female2020,2),:) = [];

male2019(isnan(male2019))=0;
male2019(all(~male2019,2),:) = [];
male2020(isnan(male2020))=0;
male2020(all(~male2020,2),:) = [];

none2019(isnan(none2019))=0;
none2019(all(~none2019,2),:) = [];
none2020(isnan(none2020))=0;
none2020(all(~none2020,2),:) = [];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Point 9 in README
%Total gender distribution mean and std of BMI for male, female and NA for
%both 2019 and 2020
m_tot_2019 = mean(all2019(:,1));
m_tot_2020 = mean(all2020(:,1));
std_tot_2019 = std(all2019(:,1));
std_tot_2020 = std(all2020(:,1));

m_fem_2019 = mean(female2019(:,1));
m_fem_2020 = mean(female2020(:,1));
std_fem_2019 = std(female2019(:,1));
std_fem_2020 = std(female2020(:,1));

m_male_2019 = mean(male2019(:,1));
m_male_2020 = mean(male2020(:,1));
std_male_2019 = std(male2019(:,1));
std_male_2020 = std(male2020(:,1));

m_na_2019 = mean(none2019(:,1));
m_na_2020 = mean(none2020(:,1));
std_na_2019 = std(none2019(:,1));
std_na_2020 = std(none2020(:,1));
