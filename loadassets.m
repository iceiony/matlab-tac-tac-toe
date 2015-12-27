function [ boardImg, oImg, xImg] = loadassets( gamePreferences )
    %loads the asset images based on user selected preferences ( bord size ) 
    PATH = './images';
    
    rows = gamePreferences.Size(1);
    columns = gamePreferences.Size(2);
    
    boardImg = imread(sprintf('%s/g%dx%d.bmp',PATH,rows,columns));
    oImg = imread([PATH '/sO.bmp']);
    xImg = imread([PATH '/sX.bmp']);
end

