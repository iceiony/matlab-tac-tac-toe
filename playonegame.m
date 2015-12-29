function [winner] = playonegame(game,preferences)
%play one game and return the winner
    game.IsEnded = false;
    game.CurrentBoardImg = game.BoardImg;

    axis image;
    imshow(game.CurrentBoardImg);
    axis image;

    while(~game.IsEnded)
        if preferences.PlayerIsComputer(game.CurrentPlayer)
            choice = randomchoice(game);
        else
            choice = askplayerchoice(game);
            if isempty(choice)
                disp('Game ended window closed');
                winner = nan;
                return;
            end
        end

        [game.Board,game.CurrentBoardImg] = updateboard(choice, game);

        [game.IsEnded,winningCells] = iswinning(choice,game);
        if game.IsEnded
            showwin(winningCells,game);
            xlabel(sprintf('%s wins!',preferences.PlayerNames{game.CurrentPlayer}));
            winner = game.CurrentPlayer;
            return;
        elseif ~any(find(game.Board == 0))
            game.IsEnded  = true;
            xlabel('Game ended tie!')
            winner = 0;
            return;
        end

        %switch to next player
        game.CurrentPlayer = mod(game.CurrentPlayer,2) + 1; 
        xlabel(sprintf('%s''s turn',preferences.PlayerNames{game.CurrentPlayer}));
    end
end