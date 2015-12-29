close all;

preferences = askpreferences();

if ~isstruct(preferences) 
    disp('Game Ended since no choice made');
    return; 
end

game = initialisegame(preferences);

while(true)

    winner = playonegame(game,preferences);
    if ~isnan(winner) && winner ~= 0
        game.Score(winner) = game.Score(winner)+1;
        game.CurrentPlayer = mod(game.CurrentPlayer,2) +1;
    elseif isnan(winner)
        return;
    end
    
    gameScore = sprintf('%s vs %s : %d-%d\nPlay Another?',...
        preferences.PlayerNames{1},...
        preferences.PlayerNames{2},...
        game.Score(1),...
        game.Score(2));
    
    option = questdlg(gameScore, 'Remach',...
        'Yes','No','Yes');
    
    switch option
        case 'Yes'
            Game.Board = zeros(preferences.Size(1),preferences.Size(2));
            continue;
        otherwise
            break;
    end
end

