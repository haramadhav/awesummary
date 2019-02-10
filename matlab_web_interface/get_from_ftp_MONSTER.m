%% OM
tic
% try
host = 'ftp.awesummary.xyz';
% username = 'hara@awesummary.xyz';
username = 'awesummary';
password = 'nicholshall';
dTails = ftp(host,username,password);
% dTails.dir = '/hara';
web_list = dir(dTails);
if cell2mat((strfind({web_list.name}, 'hara')))
  work_dir = cd(dTails,'/hara');
  dir_list = dir(dTails);
  fprintf('work_dir = %s \n', work_dir);
  course_idx = (strfind({dir_list.name}, 'course'));
  for i = 1:length(course_idx)
    if cell2mat(course_idx(i))
      course_name = dir_list(i).name;
      get_from_ftp(dTails,course_name);
%       temp_dir = fullfile(pwd,sprintf('\\hara'));
%       course_dir = fullfile(temp_dir,course_name);
%       if exist(course_dir, 'dir')
%         delete(sprintf('%s\\*.png',course_dir));
%         delete(sprintf('%s\\*.db',course_dir));
%         rmdir(course_dir, 's');
%         mkdir(course_dir);
%       else
%         mkdir(course_dir);
%       end
%       fileattrib(temp_dir, '+w');
%       fprintf('Grabbing %s from heavens',course_name);
%       tmp = mget(dTails, course_name, temp_dir);
%       waitfor(tmp);
%       fprintf('--- Oh yeah!\n');
%       cellulizer_ftp(course_name,temp_dir);
%       fprintf('--- DONE\n');
    end
  end
end
close(dTails);
fprintf('Gate to the heaven is CLOSED. \n');
toc

% catch ME
%   ME
% %   keyboard
% end