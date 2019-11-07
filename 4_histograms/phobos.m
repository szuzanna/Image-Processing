clearvars;
close all;
clc; 

obraz = imread('phobos.bmp');

load('histogramZadany');

figure(1)

subplot(4,3,1)
imshow(obraz)
subplot(4,3,4)
imshow(imadjust(obraz));
subplot(4,3,7)
imshow(histeq(obraz))
subplot(4,3,10)
imshow(adapthisteq(obraz,'clipLimit',0.02,'Distribution','rayleigh'));

subplot(4,3,2)
imhist(obraz)
subplot(4,3,5)
imhist(imadjust(obraz));
subplot(4,3,8)
imhist(histeq(obraz))
subplot(4,3,11)
imhist(adapthisteq(obraz,'clipLimit',0.02,'Distribution','rayleigh'));


figure(2);
subplot(1,3,1);
imhist(histogramZadany);
subplot(1,3,2);
imhist(histeq(obraz,histogramZadany));
subplot(1,3,3)
imshow(histeq(obraz,histogramZadany));

