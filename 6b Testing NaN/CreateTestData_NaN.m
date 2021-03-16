%% Replaces one hours worth of data with NaN
clear all
close all

%%OriginalFileName = './Model/o3_surface_20180701000000.nc';
OriginalFileName = 'C:\Users\mages\OneDrive\Documents\5011CEM\5011CEM2021_mageshs\Model\o3_surface_20180701000000.nc';
NewFileName = 'C:\Users\mages\OneDrive\Documents\5011CEM\5011CEM2021_mageshs\Model\TestFileNaN.nc';
copyfile(OriginalFileName, NewFileName);

C = ncinfo(NewFileName);
ModelNames = {C.Variables(1:8).Name};


%% Change data to NaN
BadData = NaN(700,400,1);

%% Write to *.nc file
Hour2Replace = 12;
for idx = 1:8
    ncwrite(NewFileName, ModelNames{idx}, BadData, [1, 1, Hour2Replace]);
end
