%% OM
%% 
function test = montage(course_name,task_full_file)
%%
[temp_dir,task_name,ext] = fileparts(task_full_file);
img_dir = fullfile(temp_dir,sprintf('cells_%s',course_name));
temp_list = dir(img_dir);
raw_list=[];
imgs={};
for i=1:length(temp_list)
  [doll, baby, ext] = fileparts([temp_list(i).name]);
  if strcmpi(ext,'.png')% || strcmpi(ext, '.jpg') || strcmpi(ext, '.jpeg')
    raw_list = [raw_list, temp_list(i)];
    imgs = [imgs, {fullfile(img_dir,temp_list(i).name)}];
  end
end
% imgss = {raw_list.name}';

n = length(imgs);
% n=20;
y = floor(sqrt(n));
x = ceil(n/y);
mouth = figure('visible', 'off');
if (x*y>=n)
  test = montage(imgs,'Size', [x y], 'BackgroundColor','w');
  imwrite(test.CData,task_full_file);
  fprintf('%d,%d\n',x,y);
elseif ~(x*y>=n)&&(x+y+1>=n)
  test = montage(imgs,'Size', [x y+1]);
  imwrite(test.CData,task_full_file);
  fprintf('%d,%d\n',x,y+1);
else
  test = montage(imgs,'Size', [x+1 y+1]);
  imwrite(test.CData,task_full_file);
  fprintf('%d,%d\n',x+1,y+1);
end
close(mouth)
end