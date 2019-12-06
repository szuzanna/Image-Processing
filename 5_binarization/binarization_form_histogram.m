clearvars;
close all;
clc;

%image = imread('coins.png'); %80
%image =imread('rice.png');%120
image = imread('katalog.bmp');
image2 = imread('figura.png');
image3 = imread('figura2.png');
image4 = imread('figura3.png');
image5 = imread('figura4.png');

figure(1)
subplot(5,2,1)
imshow(image);
title('oryginal')
subplot(5,2,2)
imhist(image);

img_bw = im2bw(image, 120/255);

subplot(5,2,3)
imshow(img_bw);
title('Manualy')
subplot(5,2,4)
imhist(img_bw);


%% figura 
figure(2)
subplot(3,2,1)
imshow(image2);
subplot(3,2,2)
imhist(image2);

img_bw2 = im2bw(image2, 80/255);

subplot(3,2,3)
imshow(img_bw2);
subplot(3,2,4)
imhist(img_bw2);



%% figura2
figure(3)
subplot(3,2,1)
imshow(image3);
subplot(3,2,2)
imhist(image3);

img_bw2 = im2bw(image3, 80/255);

subplot(3,2,3)
imshow(img_bw2);
subplot(3,2,4)
imhist(img_bw2);



%% figura3
figure(4)
subplot(3,2,1)
imshow(image4);
subplot(3,2,2)
imhist(image4);

img_bw2 = im2bw(image4, 80/255);

subplot(3,2,3)
imshow(img_bw2);
subplot(3,2,4)
imhist(img_bw2);




%% figura4
figure(5)
subplot(3,2,1)
imshow(image3);
subplot(3,2,2)
imhist(image3);

img_bw2 = im2bw(image5, 80/255);

subplot(3,2,3)
imshow(img_bw2);
subplot(3,2,4)
imhist(img_bw2);




%% entropyYen & Kittler
yen = entropyYen(image);
kittler = clusterKittler(image);

figure(1)
subplot(5,2,5)
imshow(im2bw(image, yen/255));
title(['Entropy Yen ', num2str(yen)]);
subplot(5,2,6)
imhist(im2bw(image, yen/255));

subplot(5,2,7)
imshow(im2bw(image, kittler/255));
title(['Cluster Kttler ', num2str(kittler)] );
subplot(5,2,8)
imhist(im2bw(image, kittler/255));

gray = graythresh(image);
subplot(5,2,9)
imshow(im2bw(image,gray));
title(['Otsu ', num2str(gray)] );
subplot(5,2,10)
imhist(im2bw(image,gray));