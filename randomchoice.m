function [ choice ] = randomchoice( game )
% makes a random choice by the computer 
% chioce represents the indices of the cell chosen 
   possible = find( game.Board == 0 );
   cellNo = possible(randi(length(possible)));
   
   %transform the cellNo into a row by modulus number of rows 
   row = mod(cellNo - 1,game.MaxRow) + 1; 
   col = ceil(cellNo / game.MaxRow);
   
   choice = [row col];
end