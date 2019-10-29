clearvars;
close all;
clc;

img10 = imread('kolo.bmp');
img20 = imread('kwadrat.bmp');

img1 = boolean(img10);
img2 = boolean(img20);
%% NOT
result1= ~img1;
figure(1);
imshow(result1);

%% AND
result2= img1 & img2;
figure(2);
imshow(result2);

%% OR
result3= img1 | img2;
figure(3);
imshow(result3);

%% XOR
result4= xor(img1,img2);
figure(4);
imshow(result4);
