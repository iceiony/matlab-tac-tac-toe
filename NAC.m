Game.Preferences = askpreferences();

if  ~isstruct(Game.Preferences) 
    disp('Game Ended since no choice made');
    return; 
end

%select the first player to start randomly 
Game.CurrentPlayer = firsttogo(Game.Preferences);

%initialise bord state
Game.Bord = zeros(Game.Preferences.Size(1),Game.Preferences.Size(2));

%initialise graphics
[bordImg,oImg,xImg] = loadassets(Game.Preferences); 


