close all;

preferences = askpreferences();

if ~isstruct(preferences) 
    disp('Game Ended since no choice made');
    return; 
end

game = initialisegame(preferences);

winner = playonegame(game,preferences);
if ~isnan(winner)
    game.Score(winner) = game.Score(winner)+1;
end
game.CurrentPlayer = mod(game.CurrentPlayer,2) +1;