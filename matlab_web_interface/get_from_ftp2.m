%%OM
%%
function get_from_ftp2(dTails,course_name)

  temp_dir = fullfile(pwd,sprintf('\\hara'));
  course_dir = fullfile(temp_dir,course_name);

  if exist(course_dir, 'dir')
    delete(sprintf('%s\\*.png',course_dir));
    delete(sprintf('%s\\*.db',course_dir));
    rmdir(course_dir, 's');
    mkdir(course_dir);
  else
    mkdir(course_dir);
  end

  fileattrib(temp_dir, '+w');
  fprintf('Grabbing %s from heavens',course_name);
  tmp = mget(dTails, course_name, temp_dir);
  waitfor(tmp);
  fprintf('--- Oh yeah!\n');
  cellulizer2_ftp(course_name,temp_dir);
  fprintf('--- DONE\n');
end

