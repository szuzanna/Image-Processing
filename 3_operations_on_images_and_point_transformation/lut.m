clearvars;
close all;
clc;

load funkcjeLUT;

img = imread('lena.bmp');

figure(1);
LUT_FUNC(img,kwadratowa);
figure(2);
LUT_FUNC(img,log);
figure(3);
LUT_FUNC(img,pila);
figure(4);
LUT_FUNC(img,odwlog);
figure(5);
LUT_FUNC(img,odwrotna);
figure(6);
LUT_FUNC(img,pierwiastkowa);
figure(7);
LUT_FUNC(img,pila);
figure(8);
LUT_FUNC(img,wykladnicza);

