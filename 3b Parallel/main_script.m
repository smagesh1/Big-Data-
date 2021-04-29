datasizes = [5000,10000]; 
workers = [2,3,4,5,6];
Results = [];
for idx1=1:size(datasizes,2)
    DataParameter = datasizes(idx1);
    for idx2 = 1:size(workers,2)
        WorkerParameter = workers(idx2);
        [Parallel_processing] = ParallelProcessing(DataParameter,WorkerParameter);
        Results = [Results; WorkerParameter,DataParameter,Parallel_processing];
    end
end

x2Vals = Results(:,1);
y2Vals1 = Results(:,2);
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

% %%sequential
% for idx = 1:size(datasizes,2)
%     LoopParameter = datasizes(idx);
%     [totalSequentialtime] = SequentialProcessing(LoopParameter);
%     Results2(idx,:) = [datasizes(idx), totalSequentialtime];
%     fprintf('result is %d', totalSequentialtime);
%     disp(totalSequentialtime)
%     
% end


     


