function [Ax,Ay,Axy] = derivatives(wsp, XX, YY, image)

%% setting consequent and predecessor for x and y coorinates
prevX = wsp(1) - 1;
nextX = wsp(1) + 1;
prevY = wsp(2) - 1;
nextY = wsp(2) + 1; 

%% testing limitation
if prevX <= 0
    prevX = 1;
end
if nextX >= XX
    nextX = XX;
end
if prevY <= 0
    prevY = 1;
end
if nextY >= YY
    nextY = YY;
end

Ax = (image(nextX, wsp(2)) - image(prevX, wsp(2))) / 2;
Ay = (image(wsp(1), nextY) - image(wsp(1), prevY)) / 2;
Axy = (image(nextX, nextY) - image(prevX, wsp(2)) - image(wsp(1), prevY) + image(wsp(1), wsp(2))) / 4;

end

