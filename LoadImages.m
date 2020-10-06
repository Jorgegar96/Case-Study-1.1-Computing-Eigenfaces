function [set, icol, irow] = LoadImages(folder, m)
%LOADIMAGES Loads de images conducts resizing.
%   It recieves:
%       file:   the name of the folder containing the images as a parameter
%       m:      number of images within folder   
%
%   It returns 
%       set:      a matrix con containing the resized images

% Read and proyect images

%set will store all of the images
set = [];

figure(1);

for i=1:m
    
    %Reading each image from the specified folder location
    folder = strcat(folder, '/');
    str = strcat(folder, int2str(i));
    str = strcat(str, '.jpg');
    eval('img=imread(str);');
    
    %Images are converted from RGB to grayscale and resized 
    img = im2gray(img);
    img = imresize(img, [300,300]);
    
    subplot(ceil(sqrt(m)),ceil(sqrt(m)),i);
    imshow(img);
    
    if i==3
        title('Data Set Images', 'fontsize', 14)
    end
    drawnow;
    
    %the image's dimension are saved
    [irow,icol]=size(img);
    
    %unroll image matrix into a (N*M) x 1 vector and it to set
    temp = reshape(img',irow*icol,1);
    set = [set temp];
   
end

end

