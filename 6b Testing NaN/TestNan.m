%% Script to examine NetCDF data formats and check for NaN
% Note, you would carry out this test each time you load data.
% You should NOT test the whole file at the start

clear all
close all


%% Test a good file
NaNErrors = 0;
%% Set file to test
%%FileName = '../Model/o3_surface_20180701000000.nc'; % define our test file

%%FileName = 'C:\Users\mages\OneDrive\Documents\5011CEM\5011CEM2021_mageshs\Model\o3_surface_20180701000000.nc';
FileName = 'C:\Users\Samson\Documents\GitHub\5011CEM2021_mageshs\Model\o3_surface_20180701000000.nc';

Contents = ncinfo(FileName); % Store the file content information in a variable.

StartLat = 1;
StartLon = 1;

for idxHour = 1:25
    
    for idxModel = 1:8
        Data(idxModel,:,:) = ncread(FileName, Contents.Variables(idxModel).Name,...
            [StartLat, StartLon, idxHour], [inf, inf, 1]);
    end
    
    % check for NaNs
    if any(isnan(Data), 'All')
        fprintf('NaNs present\n')
        NaNErrors = 1;
    end
end
    
fprintf('Testing files: %s\n', FileName)
if NaNErrors
    fprintf('NaN errors present!\n')
else
    fprintf('No errors!\n')
end
    
    


%% Test File with Errors
NaNErrors = 0;
%% Set file to test
%%FileName = 'C:\Users\mages\OneDrive\Documents\5011CEM\5011CEM2021_mageshs\6b Testing NaN\TestNan.m'; % define our test file
FileName = 'C:\Users\Samson\Documents\GitHub\5011CEM2021_mageshs\Model\TestFileNaN.nc';

Contents = ncinfo(FileName); % Store the file content information in a variable.

StartLat = 1;
StartLon = 1;

mean([2, NaN, 4])
nanmean([2, NaN, 4])

fprintf('Testing files: %s\n', FileName)
for idxHour = 1:25
    
    for idxModel = 1:8
        Data(idxModel,:,:) = ncread(FileName, Contents.Variables(idxModel).Name,...
            [StartLat, StartLon, idxHour], [inf, inf, 1]);
    end
    
    % check for NaNs
    if any(isnan(Data), 'All')
        fprintf('NaNs present during hour %i\n', idxHour)
        NaNErrors = 1;
    end
end
    
if NaNErrors
    fprintf('NaN errors present!\n')
else
    fprintf('No errors!\n')
end