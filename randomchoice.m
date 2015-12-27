function [ choice ] = randomchoice( game )
% makes a random choice by the computer 
% chioce represents the indices of the cell chosen 
   possible = find( game.Board == 0 );
   cellNo = possible(randi(length(possible)));
   
   row = mod(cellNo,game.MaxRow);
   if row == 0 
       row = game.maxRow;
   end;
   
   col = ceil(cellNo / game.MaxCol);
   
   choice = [row col];
end