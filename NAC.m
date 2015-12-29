close all;

preferences = askpreferences();

if ~isstruct(preferences) 
    disp('Game Ended since no choice made');
    return; 
end

game = initialisegame(preferences);

%play one game
game.IsEnded = false;
game.CurrentBoardImg = game.BoardImg;

axis equal;
imshow(game.CurrentBoardImg);
axis equal;

while(~game.IsEnded)
    if preferences.PlayerIsComputer(game.CurrentPlayer)
        choice = randomchoice(game);
    else
        choice = askplayerchoice(game);
        if isempty(choice)
            disp('Game ended window closed');
            return;
        end
    end
    
    [game.Board,game.CurrentBoardImg] = updateboard(choice, game);
    
    [game.IsEnded,winningCells] = iswinning(choice,game);
    if game.IsEnded
        showwin(winningCells,game);
        xlabel(sprintf('%s wins!',preferences.PlayerNames{game.CurrentPlayer}));
        return;
    elseif ~any(find(game.Board == 0))
        game.IsEnded  = true;
        xlabel('Game ended tie!')
        return;
    end
    
    %switch to next player
    game.CurrentPlayer = mod(game.CurrentPlayer,2) + 1; 
    xlabel(sprintf('%s''s turn',preferences.PlayerNames{game.CurrentPlayer}));
end