%% OM
% Repeat this every 10 seconds or whatever

%% 
host = 'ftp.awesummary.xyz';
% username = 'hara@awesummary.xyz';
username = 'awesummary';
password = 'nicholshall'; %Hi Dear, please dont! PLEASE :)
dTails = ftp(host,username,password);
% dTails.dir = '/hara';
web_list = dir(dTails);
work_dir = cd(dTails,'/public_html/');
% dir_list = dir(dTails);
temp_dir = fullfile(pwd,sprintf('\\hara'));
task_list = 'master_request_log.txt';
loc = fullfile(temp_dir,task_list);
fileattrib(temp_dir, '+w');
if exist(loc, 'file')
    delete(loc);
end
fileattrib(temp_dir, '+w');
fprintf('Grabbing heavenly tasks');
tmp = mget(dTails, task_list, temp_dir);
waitfor(tmp);
fprintf('--- Oh yeah!\n');
%%
delimiter = {' ','-'};
formatSpec = '%s%s%s%[^\n\r]';
fileID = fopen(loc,'r');
dataArray = textscan(fileID, formatSpec, 'Delimiter', delimiter, 'MultipleDelimsAsOne', true, 'TextType', 'string',  'ReturnOnError', false);
fclose(fileID);
tasks = [dataArray{1:end-1}];
clearvars filename delimiter formatSpec fileID dataArray ans;
%%
work_dir = cd(dTails,'/public_html/Uploads');
for i=1:size(tasks)
  task_file = sprintf('%s_%s_%s.png',tasks(i,1),tasks(i,2),tasks(i,3));
  task_full_file = fullfile(temp_dir, task_file);
  if ~exist(task_full_file, 'file')
    work_dir = cd(dTails,'/public_html/Uploads');
    get_from_ftp2(dTails, char(tasks(i,2)));
    motager(tasks(i,2),task_full_file);
    work_dir = cd(dTails,'/public_html/Downloads');
    up_paths = mput(dTails, task_full_file);
%   else
%     fprintf('Yayyy! No tasks :) Chilling now!\n');
  end
end

close(dTails);