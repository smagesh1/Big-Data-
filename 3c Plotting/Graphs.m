%% Plotting graphs in Matlab
clear all
close all


%% 10,000 data processed
x2Vals = [2, 3, 4, 5, 6];
y2Vals = [401.76 , 273.78 , 257.94 , 204.84 , 187.67];
figure(1)
yyaxis right
plot(x2Vals, y2Vals, '-rx')
xlabel('Number of Processors')
ylabel('Processing time (s)')
title('Processing time vs number of processors')

legend('10,000 Data')


%% Show two plots on same y-axis
%% Mean processing time
y2MeanVals = y2Vals / 10000;

figure(2)
hold on
plot(x2Vals, y2MeanVals, '-rx')
xlabel('Number of Processors')
ylabel('Processing time (s)')
title('Mean Processing time vs number of processors')
legend('10,000 Data')

%% 5,000 data processed
x3Vals = [2, 3, 4, 5, 6];
y3Vals = [203.82 , 146.50 , 109.94 , 95.16 , 90.89];
figure(1)
yyaxis right
plot(x3Vals, y3Vals, '-rx')
xlabel('Number of Processors')
ylabel('Processing time (s)')
title('Processing time vs number of processors')

legend('5,000 Data')