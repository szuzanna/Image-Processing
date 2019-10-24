clearvars; 
close all;
clc;

%% changing number of grey scale, 
%% human eye can distinguish 20-30 number of them

%% wczytujemy obraz i zmieniamy mu liczbe poziomow szarosci 
%% ludzki oko jest w stanie odroznic oko³o 20-30 poziomow szarosci 
%% dla wiekszych liczb nie widzi roznicy w jakosci

obraz = imread('lena.bmp');
lena = imresize(obraz,[128,128]);
im1 = imadjust(lena,[],[0,31/255]);
im2 = imadjust(lena,[],[0,15/255]);
im3 = imadjust(lena,[],[0,7/255]);
im4 = imadjust(lena,[],[0,3/255]);
im5= imadjust(lena,[],[0,1/255]);

subplot(2,3,1)
imshow(im1,[])

subplot(2,3,2)
imshow(im2,[])

subplot(2,3,3)
imshow(im3,[])

subplot(2,3,4)
imshow(im4,[])

subplot(2,3,5)
imshow(im5,[])
