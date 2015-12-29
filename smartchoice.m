function [ choice ] = smartchoice(game)
% Makes a choice allowing the computer to win or preventing oponent from
% winning. There is no forsight in the AI's choice and no intricate strategy.
% Chioce represents the indices of the cell chosen 
% Note : this algorithm is not optimised as it checks every available cell
% if it is a winning move

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

