function [ choice ] = askplayerchoice( fig,game )
%waits until player chooses a cell that is empty 
maxX = fig.Children.XLim(2);
maxY = fig.Children.YLim(2);

while(true)
    try 
        %catch user closing the figure 
        [x,y]= ginput(1);
    catch
        choice = [];
        return;
    end
    
    %if clicked within figure 
    if x > 0 && x < maxX && y > 0 && y < maxY 
        %calcualte row column location
        row = ceil( y * game.MaxRow / maxY);
        col = ceil( x * game.MaxCol / maxX );

        if game.Board(row,col) == 0
            choice = [row col];
            return;
        end
    end
end

end

