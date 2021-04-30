function TestingErrors(FileName,Contents)
%Test for data to see if it has Nan or Text Present

%%Define plain text variable types
DataTypes = {'NC_Byte', 'NC_Char', 'NC_Short', 'NC_Int', 'NC_Float', 'NC_Double'}; 
FileID = netcdf.open(FileName,'NC_NOWRITE'); % open file read only and create handle
%% Variables
NaNErrors = 0;
StartLat = 1;
StartLon = 1;
%% Create and open log file
LogFileName = 'AnalysisLog.txt';

LogID = fopen('AnalysisLog.txt', 'a');

%% Checking for NaNs
for idxHour = 1:25
    for idxModel = 1:8
        Data(idxModel,:,:) = ncread(FileName, Contents.Variables(idxModel).Name,...
            [StartLat, StartLon, idxHour], [inf, inf, 1]);
    end
    if any(isnan(Data), 'All') % Checking if data contains NaNs
    % if any(nanmean([2, NaN, 4]), 'All')
        fprintf('NaNs present\n')
        fprintf(LogID, '%s: %s processing data hour %i\n', datestr(now, 0), 'NaN Error');
        NaNErrors = 1;
     else
        fprintf(LogID, '%s: %s processing data hour %i\n', datestr(now, 0), 'Success');
    end
end

%% Print Output
fprintf('\nTesting files: %s\n', FileName)
if NaNErrors
    fprintf('NaN errors are present.\n')
    
else
    fprintf('No Nan errors present.\n')
    
end

%% Check for non-numerical values
for idx = 0:size(Contents.Variables,2)-1 % Loop through each variable
    % Read the data type for each variable and store the value
    [~, datatype(idx+1), ~, ~] = netcdf.inqVar(FileID,idx);
end

%% Storing datatypes
DataInFile = DataTypes(datatype);

%% Find character data types
FindText = strcmp('NC_Char', DataInFile);

%% Output result if any text is found or not
if any(FindText)
    fprintf('Error, text variables present:\n')
    fprintf(LogID, '%s: %s processing data hour %i\n', datestr(now, 0), 'Text Error');
    
else
    fprintf('All data is numeric.\n')
    fprintf(LogID, '%s: %s processing data hour %i\n', datestr(now, 0), 'Success');
end

end