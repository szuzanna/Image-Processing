clearvars;
close all;
clc;

image = imread('jet.bmp');

%% oryginal
figure(1)
subplot(2,4,1)
imshow(image);
title('oryginal ')
subplot(2,4,5)
imhist(image);

%% HE
figure(1)
subplot(2,4,2)
imshow(histeq(image));
title('HE')
subplot(2,4,6)
imhist(histeq(image));

%% BBHE 
%% computing mean brightness
bbhe_mean = round(mean(image(:)));

%spliting historgam to two 
[H, ~] = imhist(image);
H1 = H(1:bbhe_mean);
H2 = H(bbhe_mean+1:256);

%% normalizing histograms
H1 = H1/sum(H1);
H2 = H2/sum(H2);

%% computing cumulated histograms
C1 = cumsum(H1);
C2 = cumsum(H2);

%% LUT Transformation
C1n = uint8(bbhe_mean * C1);
C2n = uint8(bbhe_mean+1 + (255-bbhe_mean+1)*C2);
lut = [C1n; C2n];


figure(1)
subplot(2,4,3)
imshow(intlut(image,lut));
title('BBHE')
subplot(2,4,7)
imhist(intlut(image,lut));

%% DSIHE 
[X, Y] = size(image);

%% spliting historgam to two 
[H, ~] = imhist(image);
[value, lm] = min (abs(H-(X*Y/2)));
H1 = H(1:lm);
H2 = H(lm+1:256);

%% normalizing histograms
H1 = H1/sum(H1);
H2 = H2/sum(H2);

%% computing cumulated histograms
C1 = cumsum(H1);
C2 = cumsum(H2);

%% LUT Transformation
C1n = uint8(lm * C1);
C2n = uint8(lm+1 + (255-lm+1)*C2);
lut = [C1n; C2n];

figure(1)
subplot(2,4,4)
imshow(intlut(image,lut));
title('DSIHE')
subplot(2,4,8)
imhist(intlut(image,lut));

