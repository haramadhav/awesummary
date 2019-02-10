%% OM
tic

host = 'ftp.awesummary.xyz';
% username = 'hara@awesummary.xyz';
username = 'awesummary';
password = 'nicholshall';
dTails = ftp(host,username,password);
% dTails.dir = '/hara';
web_list = dir(dTails);
  work_dir = cd(dTails,'/public_html/Uploads');
  dir_list = dir(dTails);
  fprintf('work_dir = %s \n', work_dir);
  course_idx = (strfind({dir_list.name}, 'EECS'));
  for i = 1:length(course_idx)
    if cell2mat(course_idx(i))
      course_name = dir_list(i).name;
      get_from_ftp(dTails,course_name);
    end
  end
close(dTails);
fprintf('Gate to the heaven is CLOSED. \n');
toc
