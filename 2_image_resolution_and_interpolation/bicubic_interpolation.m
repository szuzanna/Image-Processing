clearvars; 
close all;
clc;

A1 = load('a1.mat');
image = imread('parrot.bmp');

figure(1);
imshow(imresize(image,7))

xReScale = 7;
yReScale = 7;

%% image resolution 

[XX,YY] = size(image);

%% new resolution
newXX = round(XX * xReScale);
newYY= round(YY * yReScale);

%% new image made of zeros (all black) 
newImg = uint8(zeros( newXX,newYY));

%% processing steps size
xStep = XX/newXX;
yStep = YY/newYY;

for yn = 1:newYY
    for xn = 1:newXX
        %% calculating odrinates from "old" image 
        y1 = floor(yn * yStep);
        x1 = floor(xn * xStep);        
        
        %% checking limitation
        if(x1 > XX-1)
            x1 = XX -1 ;
        end
        if x1==0
            x1=1;
        end
        if(y1 > YY-1)
            y1 = YY-1;
        end
        if y1==0
            y1=1;
        end
        
        
        pktA = [x1 y1];
        pktB = [x1+1 y1];
        pktC = [x1+1 y1+1];
        pktD = [x1 y1+1];
        
        norm_x = xn * xStep - x1;
        norm_y = yn * yStep - y1;

        %% calculating values form specified pixels form "old" image
        A = image(x1, y1);
        B = image(x1+1, y1);
        C = image(x1+1, y1+1);
        D = image(x1, y1+1);
        
        %% calculating derivatives for each pixel
        [Ax, Ay, Axy] = derivatives(pktA, XX, YY, image);
        [Bx, By, Bxy] = derivatives(pktB, XX, YY, image);
        [Cx, Cy, Cxy] = derivatives(pktC, XX, YY, image);
        [Dx, Dy, Dxy] = derivatives(pktD, XX, YY, image);
        
        x = [A B D C Ax Bx Dx Cx Ay By Dy Cy Axy Bxy Dxy Cxy]';
        a = A1.A1 * double(x);
        alpha = [a(1), a(5), a(9), a(13); a(2), a(6), a(10), a(14); a(3), a(7), a(11), a(15); a(4), a(8), a(12), a(16)];
        
        %% calculating value for one pixel in new image
        newImg(xn, yn) = [1 norm_x norm_x^2 norm_x^3] * alpha * [1 norm_y norm_y^2 norm_y^3]';
      
    end
end
figure(2);
imshow(uint8(newImg));