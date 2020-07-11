clc;
clear;

image_old = imread('testimg.bmp');
figure(1);
imshow(image_old);
image_gray= (image_old(:,:,1) + image_old(:,:,2)+image_old(:,:,2))/3;
figure(2);
imshow(image_gray);
[Height,Width] = size(image_gray);
image_new = zeros(Height,Width);
TH = 200;
 
for i = 1:Height
    for j=1:Width-1
        image_new(i,j)=image_gray(i,j)-image_gray(i,j+1)+TH;
        if image_new(i,j) >255
             image_new(i,j) = 255;
        elseif image_new(i,j) <0
            image_new(i,j) = 0;
        else
            image_new(i,j) =  image_new(i,j);
        end
    end
end
image_new = uint8(image_new);
figure(3);
imshow(image_new);
