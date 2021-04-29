FileName = '..\Model\o3_surface_20180701000000.nc';
Contents = ncinfo(FileName);
% TestingErrors(FileName,Contents)
% 
 
% 
Lat = ncread(FileName, 'lat');
Lon = ncread(FileName, 'lon');
NumHours = 5;
DataSize = [5000,10000];

%sequential


for idx = 1:size(DataSize,2)
    LoopParameter = DataSize(idx);
    [tSeq] = SequentialProcessing(LoopParameter, NumHours,FileName,Contents,Lat,Lon);
    SeqResults(idx,:) = [DataSize(idx), tSeq];
    fprintf('Result for Sequential is %f \n', tSeq);
    
end

% 
% 
% 
% %% 
% % %%parallel
Workers = [2,3,4,5,6]; 
% ParResults = []; 
% 
% 
% for idx = 1:size(DataSize,2)
%     DataParameter = DataSize(idx);
% 
%     for idx2 = 1: size(Workers, 2)
%         WorkerParameter = Workers(idx2);
%         [PP] = ParallelProcessing(DataParameter, WorkerParameter,FileName,Contents,Lat,Lon, NumHours);
%         ParResults = [ParResults; WorkerParameter, PP];
%         fprintf(parLogID, 'Result for Parallel is %f \n', PP);
%     end
% 
%     
% x2Vals = ParResults(:,1);
% y2Vals1 = ParResults(:,2);
% figure(1)
% yyaxis left
% plot(ParResults(:,1), ParResults(:,2), '-rx')
% yyaxis right
% plot(ParResults(:,1), ParResults(:,2), '-bo')
% hold on
% xlabel('Number of Processors')
% ylabel('Processing time (s)')
% title('Processing time vs number of processors')
% legend('5,000 Data','10,000 Data')
% ParResults = [];
% 
% end
% x = Workers;
% y = [201.98,144.63,117.09,100.91,99.47];
% figure(2)
% yyaxis left
% plot(x, y, '-rx')
% xlabel('Number of Processors')
% ylabel('Processing time (s)')
% title('Processing time vs number of processors')
% 
% x2 = Workers;
% y2 = [411.23,282.03,226.97,216.23 ,192.74];
% figure(2)
% yyaxis right
% plot(x2, y2, '-bd')
% xlabel('Number of Processors')
% ylabel('Processing time (s)')
% title('Processing time vs number of processors')
% 
% 
% legend('5,000 Data','10,000 Data')
% 
x2 = Workers;
y2 = tSeq;
figure(2)
yyaxis right
plot(x2, y2, '-bd')
xlabel('Number of Processors')
ylabel('Processing time (s)')
title('Processing time vs number of processors')