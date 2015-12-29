function [ choice ] = smartchoice(game)
% makes a choice allowing the computer to win or preventing oponent from
% winning
% chioce represents the indices of the cell chosen 
% note : this algorithm is not optimised and can be slow for big bords 

%select all free cells
availableMoves = (game.Board == 0);

%determine if there is any winning move we can make
for i = 1:game.MaxRow
    for j = 1:game.MaxCol
        if availableMoves(i,j)
            [ isWin , ~ ] = iswinning([i,j] , game);
            if(isWin)
                choice = [i,j];
                return;
            end
        end
    end
end

%determine if there is any winning move for the opponent and prevent it
%but first , pretend you are the opponent
gameCopy.MaxRow = game.MaxRow;
gameCopy.MaxCol = game.MaxCol;
gameCopy.Board = game.Board;
gameCopy.CurrentPlayer = mod(game.CurrentPlayer,2)+1;

for i = 1:game.MaxRow
    for j = 1:game.MaxCol
        if availableMoves(i,j)
            [ isWin , ~ ] = iswinning([i,j] , gameCopy);
            if(isWin)
                choice = [i,j];
                return;
            end
        end
    end
end

%if no good move available make a random choice
choice = randomchoice(game);

end

