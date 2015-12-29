function [ isWin , winningCells ] = iswinning( choice,game )
%Determines if the last choice was a winning one and returns the winning
%cells if it were.

%define the lines that we would be selecting points on
equations = [0  1; 1  1; 1  0;1 -1];

%select all cells sitting on a line and going through the choice 
points = {};
for idx = 1:length(equations)
    points{idx} = zeros(0,2);
    eq = equations(idx,:);
    %only select points up to a distance of 2
    for dist = -2:2
        point =  [ choice(1) + dist * eq(1) , choice(2) + dist * eq(2) ];
        if point(1) > 0 && point(2) > 0 &&...
           point(1) <= game.MaxRow && ...
           point(2) <= game.MaxCol 
            
            points{idx}(end+1,:) = point;
        end
    end     
end

board = (game.Board == game.CurrentPlayer);
board(choice(1),choice(2)) = 1; %mark the choice as if it were made

for idx = 1:length(points)
%in a moving window of size 3 see if the points on the board belong to the same player
    for j = 1:(length(points{idx})-2)
        p1 = points{idx}(j,:);
        p2 = points{idx}(j+1,:);
        p3 = points{idx}(j+2,:);
        
        if board(p1(1),p1(2)) && board(p2(1),p2(2)) && board(p3(1),p3(2))
            isWin = true;
            winningCells = [p1; p2 ;p3];
            return;
        end
        
    end
end

isWin = false;
winningCells = [];

end

