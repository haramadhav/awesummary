%%OM

%% protocol
host = 'ftp.awesummary.xyz';
% username = 'hara@awesummary.xyz';
username = 'awesummary';
password = 'nicholshall';

dTails = ftp(host,username,password);
% dTails.dir = '/hara';
web_list = dir(dTails);
if cell2mat((strfind({web_list.name}, 'hara')))
  work_dir = cd(dTails,'hara');
  dir_list = dir(dTails);
  fprintf('work_dir = \\hara\\ \n');
end
close(dTails);