preferences = askpreferences();

if ~isstruct(preferences) 
    disp('Game Ended since no choice made');
    return; 
end

%select the first player to start randomly 
game.CurrentPlayer = firsttogo(preferences);
    
%initialise bord state
game.Board = zeros(preferences.Size(1),preferences.Size(2));
[game.MaxRow, game.MaxCol] = size(game.Board);

%initialise graphics
[game.BoardImg,game.OImg,game.XImg] = loadassets(preferences); 

%set the graphics into array for easier selection later
game.PlayerSymbol = {};
if ~preferences.PlayerIsComputer(1)
    p1 = 1;
    p2 = 2;
else
    p1 = 2;
    p2 = 1;
end
    
if preferences.Symbol == 'O'
    game.PlayerSymbol{p1} = game.OImg;
    game.PlayerSymbol{p2} = game.XImg;
else
    game.PlayerSymbol{p2} = game.OImg;
    game.PlayerSymbol{p1} = game.XImg;
end

%initialise figure
fig = figure('Name','Tic-Tac-Toe');
set(fig,'menubar','none');
set(fig,'resize','off');

%play one game
game.IsEnded = false;
game.CurrentBoardImg = game.BoardImg;
imshow(game.CurrentBoardImg);

while(~game.IsEnded)
    if preferences.PlayerIsComputer(game.CurrentPlayer)
        choice = randomchoice(game);
    else
        choice = askplayerchoice(fig,game);
    end
    
    [game.Board,game.CurrentBoardImg] = updateboard(choice, game);
    
    if iswinning(choice,game)
        game.IsEnded = true;
        xlabel(fprints('%s wins !',game.Preference.PlayerNames{game.CurrentPlayer}));
    end
    
    game.CurrentPlayer = mod(game.CurrentPlayer,2) + 1; 
    
    if ~game.IsEnded && ~any(find(game.Board == 0))
        game.IsEnded  = true;
        xlabel('Game ended tie')
    end
end