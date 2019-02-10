%% OM
function [done] = cellulizer2_ftp(course_name,temp_dir)
%% function cellulizer(course_name)
% course_name = 'EECS1120'; % For 1020 and 1120
course_dir = fullfile(temp_dir, course_name);
cells_dir = fullfile(temp_dir, sprintf('cells_%s', course_name));

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
  
  fprintf('Cellulizing %s',course_name);
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
%   done = 1;
end

