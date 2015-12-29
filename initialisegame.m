function [game] = initialisegame(preferences)
%initialise game object based on preferences

    %select the first player to start randomly 
    Game.CurrentPlayer = firsttogo(preferences);
    Game.Score = [0 0];

    %initialise bord state
    Game.Board = zeros(preferences.Size(1),preferences.Size(2));
    [Game.MaxRow, Game.MaxCol] = size(Game.Board);

    %initialise graphics
    [Game.BoardImg,Game.OImg,Game.XImg] = loadassets(preferences); 

    %set the graphics into array for easier selection later
    Game.PlayerSymbol = {};
    if ~preferences.PlayerIsComputer(1)
        p1 = 1;
        p2 = 2;
    else
        p1 = 2;
        p2 = 1;
    end

    if preferences.Symbol == 'O'
        Game.PlayerSymbol{p1} = Game.OImg;
        Game.PlayerSymbol{p2} = Game.XImg;
    else
        Game.PlayerSymbol{p2} = Game.OImg;
        Game.PlayerSymbol{p1} = Game.XImg;
    end

    %initialise figure
    Game.Fig = figure('Name','Tic-Tac-Toe');
    hold on;
    set(Game.Fig,'menubar','none');
    set(Game.Fig,'resize','off');
    
    game = Game;
end