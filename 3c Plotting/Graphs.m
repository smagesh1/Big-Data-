%% Plotting graphs in Matlab
clear all
close all


%% 10,000 data processed
x2Vals = [2, 3, 4, 5, 6];
y2Vals = [401.76 , 273.78 , 257.94 , 204.84 , 187.67];
figure(1)
yyaxis left
plot(x2Vals, y2Vals, '-bd')
xlabel('Number of Processors')
ylabel('Processing time (s)')
title('Processing time vs number of processors')

%% 5,000 data processed
x3Vals = [2, 3, 4, 5, 6];
y3Vals = [203.82 , 146.50 , 109.94 , 95.16 , 90.89];
figure(1)
yyaxis right
plot(x3Vals, y3Vals, '-rx')
xlabel('Number of Processors')
ylabel('Processing time (s)')
title('Processing time vs number of processors')

legend('5,000 Data','10,000 Data')


%% Show two plots on same y-axis
%% Mean processing time
y2MeanVals = y2Vals / 10000;
y3MeanVals = y3Vals/ 5000;



figure(2)
plot(x2Vals, y2MeanVals, '-bd')
hold on
plot(x3Vals,y3MeanVals, '-rx')
xlabel('Number of Processors')
ylabel('Processing time (s)')
title('Mean Processing time vs number of processors')
legend('5,000 Data','10,000 Data')


%% sequential proccessing plot

x4Vals = [1,2,3,4,5,6];
y4Vals = [1222.81,1222.82,1222.81,1222.81,1222.81,1222.81]
figure(3)
yyaxis right
plot(x4Vals, y4Vals, '-rx')
xlabel('1 Proccessor')
ylabel('Processing time(s)')
title('Sequential Processing time')

legend('10,000 Data')
