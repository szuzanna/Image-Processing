clearvars;
close all;
clc; 

obraz1 = imread('lena1.bmp');
obraz2 = imread('lena2.bmp');
obraz3 = imread('lena3.bmp');
obraz4 = imread('lena4.bmp');

hist1 = imread('hist1.bmp');
hist2 = imread('hist2.bmp');
hist3 = imread('hist3.bmp');
hist4 = imread('hist4.bmp');

%% displaying image, histogram, adjusted historgam, adujsted image
figure(1);

%% image 1 
subplot(4,4,1);
imshow(obraz1);
subplot(4,4,2);
imhist(obraz1,256);
subplot(4,4,3);
imhist(imadjust(obraz1),256);
subplot(4,4,4);
imshow(imadjust(obraz1));

%% image 2 
subplot(4,4,5);
imshow(obraz2);
subplot(4,4,6);
imhist(obraz2,256);
subplot(4,4,7);
imhist(imadjust(obraz2),256);
subplot(4,4,8);
imshow(imadjust(obraz2));

%% image 3
subplot(4,4,9);
imshow(obraz3);
subplot(4,4,10);
imhist(obraz3,256);
subplot(4,4,11);
imhist(imadjust(obraz3),256);
subplot(4,4,12);
imshow(imadjust(obraz3));

%% image 4
subplot(4,4,13);
imshow(obraz4);
subplot(4,4,14);
imhist(obraz4,256);
subplot(4,4,15);
imhist(imadjust(obraz4),256);
subplot(4,4,16);
imshow(imadjust(obraz4));

%% cumulative histogram
figure(2);
[H,x] = imhist(hist1);
tmpC = cumsum(H);
k = max(tmpC)/max(H);
C = tmpC/k;

subplot(1,6,1);
imshow(hist1);
title('image');
subplot(1,6,2);
imhist(hist1,256);
title('image historgam');
subplot(1,6,3);
plot(x,H, 'g');
hold on;
plot(x,C, 'k');
hold off;
title('cumulative histogram');

%% histogram equalizaton using lut 
lut_img= uint8(255*(C/max(tmpC)));
[Hlut,xlut] = imhist(intlut(hist1,lut_img));

tmpClut = cumsum(Hlut);
klut = max(tmpClut)/max(Hlut);
Clut = tmpClut/klut;

subplot(1,6,4);
imhist(intlut(hist1,lut_img));
title('histogram lut');
subplot(1,6,5);
imshow(intlut(hist1,lut_img));
title('image lut');
subplot(1,6,6);
plot(x,Hlut, 'g');
hold on;
plot(x,Clut, 'k');
hold off;
title('lut cumulative histogram');

%% histogram equalization using histeq function
%% Adaptive Histogram Equalization using imadjust
h2 = histeq(hist2,256);
figure(3)
subplot(3,5,1)
imshow(hist2)
subplot(3,5,2)
imhist(hist2)
subplot(3,5,3)
imhist(imadjust(hist2));
subplot(3,5,4)
imhist(h2)
subplot(3,5,5)
imhist(adapthisteq(hist2,'clipLimit',0.02,'Distribution','rayleigh'));


h3 = histeq(hist3,256);
subplot(3,5,6)
imshow(hist3)
subplot(3,5,7)
imhist(hist3)
subplot(3,5,8)
imhist(imadjust(hist3));
subplot(3,5,9)
imhist(h3)
subplot(3,5,10)
imhist(adapthisteq(hist3,'clipLimit',0.02,'Distribution','rayleigh'));

h4 = histeq(hist4,256);
subplot(3,5,11)
imshow(hist4);
subplot(3,5,12)
imhist(hist4)
subplot(3,5,13)
imhist(imadjust(hist4));
subplot(3,5,14)
imhist(h4)
subplot(3,5,15)
imhist(adapthisteq(hist4,'clipLimit',0.02,'Distribution','rayleigh'));



