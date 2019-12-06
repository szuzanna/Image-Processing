clearvars;
close all;
clc;

image = imread('rice.png');
%image = imread('katalog.bmp');
[X, Y] = size(image);
window_size = 15;
k = 0.15;
R =128;
imageBW = image;
imageBW2 = image;

for i= 1:X
    for j= 1:Y
        mean = meanLT(i,j, floor(window_size/2), image,X,Y);
        if imageBW(i,j)> mean
            imageBW(i,j) = 255;
        else
            imageBW(i,j) =0;
        end
    end
end
    
%Sauviol
for i= 1:X
    for j= 1:Y
        mean = meanLT(i,j, floor(window_size/2), image,X,Y);
        std = stddevLT(i, j, floor(window_size/2), image, mean, X, Y);
        T= mean*(1-k*(std/R-1)); %"-" lepszy gdy t³o ciemne "+" gdy jasne
        if imageBW2(i,j)> T
            imageBW2(i,j) = 255;
        else
            imageBW2(i,j) =0;
        end
    end
end
    
  figure(1)
    subplot(1,3,1)
    imshow(image);
    title('Oryginal image');
    subplot(1,3,2)
    imshow(imageBW);
    title('Binarized image');
    subplot(1,3,3)
    imshow(imageBW2);
    title('Binarized Sauvol image');