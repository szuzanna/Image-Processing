clearvars; 
close all;
clc;
%% changing image resolution and then all picture displaying in the same physical size

%% wczytujemy obraz a nastepnie zmiejszamy jego rozdzielczosc (ilosc pikseli)
%% nastepnie wszystkie obrazy wyswietlamy z zadana konkretna dlugoscia 
%% obarazy wiec sa wyswietlane fizycznie w takich samych rozmiarach,
%% ale ich piksele maja rozne wielkosci, iloœæ informacji zmiejsza siê 
%% wraz z przeskalowaniem obrazu

image = imread('lena.bmp');
im256 = imresize(image,[256,256]);
im128 = imresize(image,[128,128]);
im64 = imresize(image,[64,64]);
 
figure(1);
imshow(image)

figure(2);
imshow(im256, 'InitialMagnification', 200)

figure(3);
imshow(im128,'InitialMagnification', 400)

figure(4);
imshow(im64,'InitialMagnification', 800)