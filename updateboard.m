function [board,boardImg] = updateboard( choice , game )
% updates the board state and figure graphics 

board = game.Board;
board(choice(1),choice(2)) = game.CurrentPlayer;
symbolImg = game.PlayerSymbol{game.CurrentPlayer};
[cellSizeY,cellSizeX] = size(symbolImg);

%determine the pixel locations that should be overwriten with symbolImg
rowStart = (choice(1)-1) * cellSizeX +1;
colStart = (choice(2)-1) * cellSizeY +1;

rowEnd = choice(1) * cellSizeX;
colEnd = choice(2) * cellSizeY;

boardImg = game.CurrentBoardImg;
boardImg(rowStart:rowEnd,colStart:colEnd) = symbolImg;

imshow(boardImg);
end

