function LUT_FUNC(obraz,przekodowanie)
    subplot(1,3,1);
    imshow(obraz);
    title('Image');
    subplot(1,3,2);
    plot(przekodowanie);
    title('Encoding');
    subplot(1,3,3);
    imshow(intlut(obraz,przekodowanie));
    title('Image + Encoding');
end

