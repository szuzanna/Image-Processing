clearvars;
close all;
clc; 

image = imread('lenaRGB.bmp');
% image = imread('jezioro.jpg');

lenaR = image(:,:,1);
lenaG = image(:,:,2);
lenaB = image(:,:,3);

figure(1);
subplot(2,3,1);
imshow(image);
title('oryginal image');
subplot(2,3,4);
imhist(image,256);
title('oryginal histogram');

%% RGB
figure(2);
subplot(2,3,1);
imhist(lenaR);
title('R');
subplot(2,3,2);
imhist(lenaG);
title('G');
subplot(2,3,3);
imhist(lenaB);
title('B');


Re = histeq(lenaR,256);
Ge = histeq(lenaG,256);
Be = histeq(lenaB,256);

obrazEQ = image;
obrazEQ(:,:,1) = Re;
obrazEQ(:,:,2) = Ge;
obrazEQ(:,:,3) = Be;

figure(1);
subplot(2,3,2);
imshow(obrazEQ);
title('RGB image');
subplot(2,3,5);
imhist(obrazEQ,256)
title('RGB histogram');

%% HSV
hsvImg = rgb2hsv(image);

h = hsvImg(:,:,1);
s = hsvImg(:,:,2);
v = hsvImg(:,:,3);

figure(2);
subplot(2,3,4);
imhist(h, 256);
title('H');

subplot(2,3,5);
imhist(s, 256);
title('S');

subplot(2,3,6);
imhist(v, 256);
title('V');

%% brightness
hsvImg(:,:,3) = histeq(v, 256);

hsvImg = hsv2rgb(hsvImg);

figure(1);
subplot(2,3,3);
imshow(hsvImg);
title('HSV image');
subplot(2,3,6);
imhist(hsvImg,256)
title('HSV histogram');


