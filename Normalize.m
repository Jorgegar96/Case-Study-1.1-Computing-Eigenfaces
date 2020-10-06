function set = Normalize(set, icol, irow)
%NORMALIZE Normalizes each image in the dataset
%   It recieves:
%       set: The set of images that will be normalized
%   
%   It returns:
%       set: The ser of normalized images


%Get size of dataset
m = size(set,2);

ustd = 1;
um = 0;

%Normalize every image's pixel
for i=1:m
    temp = double(set(:,i));
    me = mean(temp);
    st = std(temp);
    set(:,i) = (temp-me) * ustd /st + um;
end

%save and display the normalized images
figure(2);
for i=1:m
    %Reshape image from vector to matrix representation
    str = strcat(int2str(i),'.jpg');
    img = reshape(set(:,i),icol,irow);
    img = img';

    %Save image
    eval('imwrite(img,str);');
    
    %Display image in plot
    subplot(ceil(sqrt(m)),ceil(sqrt(m)),i);
    imshow(img);
    drawnow;
    
    %Display plot's title
    if i==3
            title('Normalized Images', 'fontsize', 18);
    end
    
end

end

