clearvars; 
close all;
clc;
%% metoda najblizszego sasiada

%% loading and displaying unchanged imgae
image = imread('chessboard.bmp');

figure(1);
imshow(image)

%% setting scale for each of axes
xReScale = 15;
yReScale = 15;

%% resolution (size) of loaded image 
[YY, XX] = size(image);

%% new resolution calculate for set scale
nXX = round(XX * xReScale);
nYY= round(YY * yReScale);

%% new image made of zeros so it's black
nImg = uint8(zeros(nYY, nXX));

%% processing steps size
xStep = XX/nXX;
yStep = YY/nYY;

%% iterating over each of pixel in new image
for yn = 1:nYY
    for xn = 1:nXX
         %% calculating odrinates from "old" image closes to the new one
        y = floor(yn * yStep);
        x = floor(xn * xStep);
        
        if(x > XX-1)
            x = XX-1 ;
        end
        
        if(y > YY-1)
            y = YY-1;
        end
        %% calculating value for one pixel in new image
        nImg(yn, xn) = image(y+1, x+1 );
    end
end
figure(2);
imshow(nImg);


        