%% OM
%% 
cur_dir = pwd;
temp_list = dir;
for i=1:length(temp_list)
  if isfolder(temp_list(i).name)
    course_name=temp_list(i).name;
  end
end

course_dir = fullfile(cur_dir, course_name);
cells_dir = fullfile(cur_dir, sprintf('cells_%s', course_name));

if exist(cells_dir, 'dir')
  delete(sprintf('%s\\*.png',cells_dir));
  delete(sprintf('%s\\*.db',cells_dir));
%   rmdir(cells_dir,'s');
  mkdir(cells_dir)
else
  mkdir(cells_dir);
end

%%  Generate cells
base_pix = 300; %cell
x_pix = 300;
y_pix = 300;
x_cell = x_pix/base_pix;
y_cell = y_pix/base_pix;
if exist(course_dir, 'dir')
  
%   fprintf('Cellulizing %s',course_name);
  temp_list = dir(course_dir);
  raw_list=[];
  for i=1:length(temp_list)
    [doll, baby, ext] = fileparts([temp_list(i).name]);
    if strcmpi(ext,'.png') || strcmpi(ext, '.jpg') || strcmpi(ext, '.jpeg')
      raw_list = [raw_list, temp_list(i)];
    end
  end
          
  for i=1:length(raw_list)
    [doll, baby, ext] = fileparts([raw_list(i).name]);
    if strcmpi(ext,'.png') || strcmpi(ext, '.jpg') || strcmpi(ext, '.jpeg')
      
    if strcmpi(ext,'.png')%<<<<<<<PNG
      if contains(baby,'_')
        chap = str2double(extractBefore(baby,'_'));
        if isnan(chap)
          chap=0;
        end        
      else
        chap = 0;
      end
      [cur_img, map]= imread(fullfile(course_dir,raw_list(i).name)) ;
      [row, col, dep] = size(cur_img);
      
      if isempty(map)
        [new_img] = imresize(cur_img,[x_pix y_pix]);%Basic implementation ONLY
        imwrite(new_img,sprintf('%s\\%02.f_%04.f_%d_%d_%d.png',cells_dir,...
          chap, i, x_cell,y_cell , x_cell*y_cell) );%Basic implementation ONLY
      else
        [new_img,new_map] = imresize(cur_img,map,[x_pix y_pix]);%Basic implementation
        imwrite(new_img,new_map,sprintf('%s\\%02.f_%04.f_%d_%d_%d.png',cells_dir,...
          chap, i, x_cell,y_cell , x_cell*y_cell) );%Basic implementation ONLY
     end
      end
      
   
    end
    
    
    if strcmpi(ext, '.jpg') || strcmpi(ext, '.jpeg')%<<<<<<<JPG
      if contains(baby,'_')
        chap = str2double(extractBefore(baby,'_'));
        if isnan(chap)
          chap=0;
        end
      else
        chap = 0;
      end
      [cur_img]= imread(fullfile(course_dir,raw_list(i).name)) ;
      [row, col, dep] = size(cur_img);
        new_img = imresize(cur_img,[x_pix y_pix]);%Basic implementation ONLY
        imwrite(new_img,sprintf('%s\\%02.f_%04.f_%d_%d_%d.png',cells_dir,...
          chap, i, x_cell,y_cell , x_cell*y_cell) );%Basic implementation ONLY
    end
    end   
end 

%% Montaging 
task_full_file= fullfile(cur_dir,sprintf('final_%s.png',course_name));
img_dir = fullfile(cur_dir,sprintf('cells_%s',course_name));
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
