clearvars;
close all;
clc;

image = imread('bart.bmp');

figure(1)
subplot(1,3,1)
imshow(image);
title('oryginal');
subplot(1,3,2)
imhist(image);
title('histogram');
subplot(1,3,3)
imageBW =  image> 0.729*255 & image < 0.8040*255;

imshow(imageBW)
title('doublestep');