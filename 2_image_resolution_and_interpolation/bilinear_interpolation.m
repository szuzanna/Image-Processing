clearvars; 
close all;
clc;

image = imread('parrot.bmp');

figure(1);
imshow(imresize(image,7))

xReScale = 7;
yReScale = 7;

%% image resolution 

[YY, XX] = size(image);

%% new resolution
nXX = round(XX * xReScale);
nYY= round(YY * yReScale);

%% new image made of zeros (all black) 
nImg = uint8(zeros(nYY, nXX));

%% processing steps size
xStep = XX/nXX;
yStep = YY/nYY;

for yn = 0:nYY-1
    for xn = 0:nXX-1
        %% calculating odrinates from "old" image 
        y1 = floor(yn * yStep);
        x1 = floor(xn * xStep);
        y2 = y1 +1;
        x2 = x1 +1;
        
        %% checking limitation
        if(x2 > XX-1)
            x2 = XX -1;
        end
        
        if(y2 > YY-1)
            y2 = YY-1;
        end
        
         xx = rem(yn,1);
         yy  = rem(xn,1);
         
         %% calculating values form specified pixels form "old" image
         fa = double(image(y1+1,x1+1));
         fb = double(image(y1+1,x2+1));
         fc = double(image(y2+1,x2+1));
         fd = double(image(y2+1,x1+1));
         
         %% calculating value for one pixel in new image
        nImg(yn+1, xn+1) = [1-xx xx] *[fa fd; fb fc]* [1-yy; yy];
    end
end
figure(2);
imshow(uint8(nImg));