%% OM MAHAGANAPATHAYE NAMAHA
%% Reference Images Generator
% dig_size = length(num2str(size(file_list)));
if ~exist('ref_imgs', 'dir')
    mkdir('ref_imgs');
end
dig_size = 3; % for future
num_of_references = 100; %%%%%%<<<<<<NUMBER OF REFERENCES
x_cell = ones(num_of_references,1);%%Change this for 1x1 or 1x2 or 2x2
x_pix_val = 100; % Not sure how this affects the final printed sheet
y_cell = ones(num_of_references,1);%%Change this for 1x1 or 1x2 or 2x2
y_pix_val = 100;
for i = 1:num_of_references
x_pix = x_cell(i)*x_pix_val;
y_pix = y_cell(i)*y_pix_val;
temp_img = 255*ones(x_pix,y_pix,'uint8');
% temp_file_name = strcat('temp_%0',num2str(dig_size),'.f.png'); %n digits
temp_img2 = insertText(temp_img,[0 0],...
        sprintf('%02.f',i), 'FontSize', 20);
imwrite(temp_img,sprintf('ref_imgs/ref_%04.f.png',i)); %Assuming 4digits
imwrite(temp_img2,sprintf('ref_imgs/ref2_%04.f.png',i)); %Assuming 4digits
end

%% Filler Images Generator
if ~exist('fil_imgs', 'dir')
    mkdir('fil_imgs');
end
for i = 1:10 %%%%%%<<<<<<<<<<<<< chapter numbers
    temp_fil_img = 255*ones(x_pix_val,y_pix_val,'uint8'); %Adjust color?
    temp_fil_img2 = insertText(temp_fil_img,[x_pix_val/2 y_pix_val/2],...
        sprintf('CHAPTER\n   %02.f',i), 'Font', 'LucidaTypewriterBold',...
        'FontSize', 20, 'TextColor', 'Green','BoxColor', 'White',...
        'BoxOpacity', 0, 'AnchorPoint', 'Center');
    imwrite(temp_fil_img2,sprintf('fil_imgs/fil_%02.f.png',i)); %Assuming 2 digits
end
%%
%% Reference COURSE Images Generator
% dig_size = length(num2str(size(file_list)));
course_name = 'EECS820';
if ~exist(sprintf('course_%s',course_name), 'dir')
    mkdir(sprintf('course_%s',course_name));
end

dig_size = 3; % for future
num_of_references = 100; %%%%%%<<<<<<NUMBER OF REFERENCES
x_cell = ones(num_of_references,1);%%Change this for 1x1 or 1x2 or 2x2
x_pix_val = 100; % Not sure how this affects the final printed sheet
y_cell = ones(num_of_references,1);%%Change this for 1x1 or 1x2 or 2x2
y_pix_val = 100;
for i = 1:num_of_references
x_pix = x_cell(i)*x_pix_val;
y_pix = y_cell(i)*y_pix_val;
temp_img = 255*ones(x_pix,y_pix,'uint8');
% temp_file_name = strcat('temp_%0',num2str(dig_size),'.f.png'); %n digits
temp_img2 = insertText(temp_img,[0 0],...
        sprintf('course\n%s\n\n%02.f',course_name,i), 'FontSize', 14);
imwrite(temp_img2,sprintf('course_%s/%04.f.png',course_name,i)); %Assuming 4digits
end
%% Reference COURSE CHAPTER Images Generator
% dig_size = length(num2str(size(file_list)));
course_name = 'EECS1020';
if ~exist(sprintf('course_%s',course_name), 'dir')
    mkdir(sprintf('course_%s',course_name));
end

dig_size = 3; % for future
num_of_references = 100; %%%%%%<<<<<<NUMBER OF REFERENCES
x_cell = ones(num_of_references,1);%%Change this for 1x1 or 1x2 or 2x2
x_pix_val = 100; % Not sure how this affects the final printed sheet
y_cell = ones(num_of_references,1);%%Change this for 1x1 or 1x2 or 2x2
y_pix_val = 100;
chap = [ ones(25,1); 2*ones(25,1); 3*ones(25,1); 4*ones(25,1);];
for i = 1:num_of_references
x_pix = x_cell(i)*x_pix_val;
y_pix = y_cell(i)*y_pix_val;
temp_img = 255*ones(x_pix,y_pix,'uint8');
% temp_file_name = strcat('temp_%0',num2str(dig_size),'.f.png'); %n digits
temp_img2 = insertText(temp_img,[0 0],...
        sprintf('course\n%s\n%02.f\n%02.f',course_name,chap(i),i), 'FontSize', 14);
imwrite(temp_img2,sprintf('course_%s/%02.f_%04.f.png',course_name,chap(i),i)); %Assuming 4digits
end
%% FUTURE
%% Reference DIFFERENT sizes COURSE Images Generator
% dig_size = length(num2str(size(file_list)));
course_name = 'EECS920';
if ~exist(sprintf('course_%s',course_name), 'dir')
    mkdir(sprintf('course_%s',course_name));
end

dig_size = 3; % for future
num_of_references = 100; %%%%%%<<<<<<NUMBER OF REFERENCES
% x_cell = ones(num_of_references,1);%%Change this for 1x1 or 1x2 or 2x2
x_cell = [ ones(25,1); ones(25,1); 2*ones(25,1); 2*ones(25,1);];
x_pix_val = 100; % Not sure how this affects the final printed sheet
% y_cell = ones(num_of_references,1);%%Change this for 1x1 or 1x2 or 2x2
y_pix_val = 100;
y_cell = [ ones(25,1); 2*ones(25,1); ones(25,1); 2*ones(25,1);];

for i = 1:num_of_references
x_pix = x_cell(i)*x_pix_val;
y_pix = y_cell(i)*y_pix_val;
temp_img = 255*ones(x_pix,y_pix,'uint8');
% temp_file_name = strcat('temp_%0',num2str(dig_size),'.f.png'); %n digits
temp_img2 = insertText(temp_img,[y_pix/2 x_pix/2],...
        sprintf('course\n%s\n\n%02.f',course_name,i), 'FontSize', 14,...
        'AnchorPoint', 'Center');
imwrite(temp_img2,sprintf('course_%s/%04.f.png',course_name,i)); %Assuming 4digits
end
%% Reference DIFFERENT COURSE CHAPTER Images Generator
% dig_size = length(num2str(size(file_list)));
course_name = 'EECS1120';
if ~exist(sprintf('course_%s',course_name), 'dir')
    mkdir(sprintf('course_%s',course_name));
end

dig_size = 3; % for future
num_of_references = 100; %%%%%%<<<<<<NUMBER OF REFERENCES
% x_cell = ones(num_of_references,1);%%Change this for 1x1 or 1x2 or 2x2
x_cell = [ ones(25,1); ones(25,1); 2*ones(25,1); 2*ones(25,1);];
x_pix_val = 100; % Not sure how this affects the final printed sheet
% y_cell = ones(num_of_references,1);%%Change this for 1x1 or 1x2 or 2x2
y_pix_val = 100;
y_cell = [ ones(25,1); 2*ones(25,1); ones(25,1); 2*ones(25,1);];

chap = [ ones(25,1); 2*ones(25,1); 3*ones(25,1); 4*ones(25,1);];

for i = 1:num_of_references
x_pix = x_cell(i)*x_pix_val;
y_pix = y_cell(i)*y_pix_val;
temp_img = 255*ones(x_pix,y_pix,'uint8');
% temp_file_name = strcat('temp_%0',num2str(dig_size),'.f.png'); %n digits
temp_img2 = insertText(temp_img,[y_pix/2 x_pix/2],...
        sprintf('course\n%s\n%02.f\n%02.f',course_name,chap(i),i),...
        'FontSize', 14, 'AnchorPoint', 'Center');
imwrite(temp_img2,sprintf('course_%s/%02.f_%04.f.png',course_name,chap(i),i)); %Assuming 4digits
end