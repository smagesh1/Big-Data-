
%loading data
FileName = '..\Model\o3_surface_20180701000000.nc'; 
Contents = ncinfo(FileName);
Lat = ncread(FileName, 'lat');
Lon = ncread(FileName, 'lon');

TestingErrors(FileName,Contents) %automating testing first
NumHours = 5;
datasizes = [5000];
Workers = [2,3,4,5,6]; 

% automating sequential processing and plot

for idx = 1:size(datasizes,2)
    LoopParameter = datasizes(idx);
    [Sequential_times] = SequentialProcessing(LoopParameter, NumHours,FileName,Contents,Lat,Lon);
    SeqResults(idx,:) = [datasizes(idx), Sequential_times];
    
x2 = Workers;
y2 = Sequential_times;
figure(2)
yyaxis right
plot(x2, y2, '-bd')
xlabel('Number of Processors')
ylabel('Processing time (s)')
title('Processing time vs number of processors')
legend('5,000 Data','10,000 Data')


end





Results = []; 

%%Automating parallel processing and plot
for idx = 1:size(datasizes,2) %going through each location in datasize
    DataParameter = datasizes(idx);

    for idx2 = 1: size(Workers, 2) %going through each worker in the Workers array
        WorkerParameter = Workers(idx2);
        [Parallel_processing] = ParallelProcessing(DataParameter, WorkerParameter,FileName,Contents,Lat,Lon, NumHours); %passing function with parameters it needs for parallel processing analysis
        Results = [Results; WorkerParameter, Parallel_processing]; %%results stored in array results
       
    end

%%graph plotting automation    
x2Vals = Results(:,1);
y2Vals = Results(:,2);
figure(1)
yyaxis left
plot(Results(:,1), Results(:,2), '-rx')
yyaxis right
plot(Results(:,1), Results(:,2), '-bo')
hold on
xlabel('Number of Processors')
ylabel('Processing time (s)')
title('Processing time vs number of processors')
legend('5,000 Data','10,000 Data')
Results = [];

end

%%Manually plotting mean processing results
ymeanvals = y2Vals/5000;
y2meanvals = y2Vals/10000;
x = Workers;
y = ymeanvals;
figure(2)
yyaxis left
plot(x, y, '-rx')
xlabel('Number of Processors')
ylabel('Mean Processing time (s)')
title('Mean Processing time vs number of processors')

x2 = Workers;
y2 = y2meanvals;
figure(2)
yyaxis right
plot(x2, y2, '-bd')
xlabel('Number of Processors')
ylabel('Mean Processing time (s)')
title('Mean Processing time vs number of processors')


legend('5,000 Data','10,000 Data')

%%Manually plotting sequential
%%10k
x4Vals = [1,2,3,4,5,6];
y4Vals = [1300.90,1300.90,1300.90,1300.90,1300.90,1300.90];
figure(3)
yyaxis left
plot(x4Vals, y4Vals, '-bd')
xlabel('1 Proccessor')
ylabel('Processing time(s)')
title('Sequential Processing times')
legend('10,000 Data')
%%5k
x5Vals = [1,2,3,4,5,6];
y5Vals = [601.04,601.04,601.04,601.04,601.04,601.04];
figure(4)
yyaxis left
plot(x5Vals, y5Vals, '-rx')

xlabel('1 Proccessor')
ylabel('Processing time(s)')
title('Sequential Processing times')
legend('5,000 Data')





