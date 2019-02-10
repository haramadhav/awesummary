%% OM

%% function cellulizer(course_name)
course_name = 'wiki_TEST'; % FOR 820 and 920
course_dir = sprintf('course_%s', course_name);
cells_dir = sprintf('cells_course_%s', course_name);

if ~exist(cells_dir, 'dir')
    mkdir(cells_dir);
end

%%  Generate cells
base_pix = 100; %cell
x_pix = 100;
y_pix = 100;
x_cell = x_pix/base_pix;
y_cell = y_pix/base_pix;
if exist(course_dir, 'dir')
  fprintf('YES\n');
  list = dir(fullfile(course_dir, '*.png'));
  for i=1:length(list)
    cur_img = imread(fullfile(course_dir,list(i).name)) ;
    [row, col, dep] = size(cur_img);
    %For now cell 1x1
    if (x_pix==col && y_pix ==row)
      imwrite(cur_img,sprintf('%s\\%04.f_%d_%d_%d.png',cells_dir,...
         i, x_cell,y_cell , x_cell*y_cell) );
    elseif (row>col)
      pivot = floor(row/2-col/2); % to square crop the center of image
         new_img = cur_img(pivot:pivot+col-1,:,:);
      new_img2 = imresize(new_img,[x_pix y_pix]);%Basic implementation ONLY
      imwrite(new_img2,sprintf('%s\\%04.f_%d_%d_%d.png',cells_dir,...
         i, x_cell,y_cell , x_cell*y_cell) );%Basic implementation ONLY
    elseif (row<col)
      pivot = floor(col/2-row/2); % to square crop the center of image
      new_img = cur_img(:,pivot:pivot+row-1,:);
      new_img2 = imresize(new_img,[x_pix y_pix]);%Basic implementation ONLY
      imwrite(new_img2,sprintf('%s\\%04.f_%d_%d_%d.png',cells_dir,...
         i, x_cell,y_cell , x_cell*y_cell) );%Basic implementation ONLY
    else
      new_img2 = imresize(cur_img,[x_pix y_pix]);%Basic implementation ONLY
      imwrite(new_img2,sprintf('%s\\%04.f_%d_%d_%d.png',cells_dir,...
         i, x_cell,y_cell , x_cell*y_cell) );%Basic implementation ONLY
      
    end
    %For cell 1x2 or 2x2 or odd sizes
      
  end
end
   
    