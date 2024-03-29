%% Script to examine NetCDF data formats and check for non-numeric values (chars only)

clear all
close all

%% Define plain text variable types
DataTypes = {'NC_Byte', 'NC_Char', 'NC_Short', 'NC_Int', 'NC_Float', 'NC_Double'};

%% Test a good file
%% Set file to test
%%FileName = '../Model/o3_surface_20180701000000.nc'; % define our test file
FileName = 'C:\Users\Samson\Documents\GitHub\5011CEM2021_mageshs\Model\o3_surface_20180701000000.nc';

Contents = ncinfo(FileName); % Store the file content information in a variable.
FileID = netcdf.open(FileName,'NC_NOWRITE'); % open file read only and create handle

for idx = 0:size(Contents.Variables,2)-1 % loop through each variable
    % read data type for each variable and store
    [~, datatype(idx+1), ~, ~] = netcdf.inqVar(FileID,idx);
end

%% display data types
DataInFile = DataTypes(datatype)'

%% find character data types
FindText = strcmp('NC_Char', DataInFile);

%% print results
fprintf('Testing file: %s\n', FileName)
if any(FindText)
    fprintf('Error, text variables present:\n')
else
    fprintf('All data is numeric, continue analysis.\n')
end

%% #####

%% Test File with Errors
%% Set file to test;
    %%FileName = '../Model/TestFileText.nc'; % define our test file
    %%FileName = 'C:\Users\mages\OneDrive\Documents\5011CEM\5011CEM2021_mageshs\6a Testing Text\TestyTest.nc';
    FileName = 'C:\Users\Samson\Documents\GitHub\5011CEM2021_mageshs\6a Testing Text\TestyTest.nc';
    
    Contents = ncinfo(FileName); % Store the file content information in a variable.
    FileID = netcdf.open(FileName,'NC_NOWRITE'); % open file read only and create handle

    for idx = 0:size(Contents.Variables,2)-1 % loop through each variable
        % read data type for each variable and store
        [~, datatype(idx+1), ~, ~] = netcdf.inqVar(FileID,idx);
    end

    %% display data types
    DataInFile = DataTypes(datatype)'

    %% find character data types
    FindText = strcmp('NC_Char', DataInFile);

    %% print results
    fprintf('Testing file: %s\n', FileName)
    if any(FindText)
        fprintf('Error, text variables present:\n')
    else
        fprintf('All data is numeric, continue analysis.\n')
    end

