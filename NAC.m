close all;

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
hold on;
set(fig,'menubar','none');
set(fig,'resize','off');


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
        choice = askplayerchoice(fig,game);
        if isempty(choice)
            disp('Game ended window closed');
            return;
        end
    end
    
    [game.Board,game.CurrentBoardImg] = updateboard(choice, game);
    
    [game.IsEnded,winningCells] = iswinning(choice,game);
    if game.IsEnded
        showwin(winningCells,game);
        xlabel(sprintf('%s wins !',preferences.PlayerNames{game.CurrentPlayer}));
        return;
    elseif ~any(find(game.Board == 0))
        game.IsEnded  = true;
        xlabel('Game ended tie')
        return;
    end
    
    %switch to next player
    game.CurrentPlayer = mod(game.CurrentPlayer,2) + 1; 
    xlabel(sprintf('%s''s turn',preferences.PlayerNames{game.CurrentPlayer}));
end