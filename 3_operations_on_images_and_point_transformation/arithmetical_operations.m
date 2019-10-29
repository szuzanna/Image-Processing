clearvars;
close all;
clc;

img1 = imread('lena.bmp');
img2 = imread('jet.bmp');

%% addition two images
result1= imadd(img1,img2);
figure(1);
imshow(result1);

%% addition with specific type
result11= imadd(img1,img2,'uint16');
figure(2);
imshow(result11,[]);

%% linear combination 
result2= imlincomb(1,img1,1,img2,'uint16');
figure(3);
imshow(result2,[]);

%% substraction 
result12= imsubtract(int16(img1),int16(img2));
figure(4);
imshow(result12,[]);

%% absolute subtraction
result3= imabsdiff(img1,img2);
figure(5);
imshow(result3);

%% multiplication by a constant
result4= immultiply(img1,0.5);
figure(6);
imshow(result4);

%% multiplication by mask
circle = imread('kolo.bmp');
mask = boolean(circle);
result5= immultiply(img1,mask);
figure(7);
imshow(result5);

%% negative
result6= imcomplement(img1);
figure(8);
imshow(result6);









