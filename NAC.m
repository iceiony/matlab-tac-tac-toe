clear all;
close all;

Game.Preferences = askpreferences();

if  ~isstruct(Game.Preferences) 
    disp('Game Ended since no choice made');
    return; 
end

%select the first player to start randomly 
Game.CurrentPlayer = randi(2);
Game.Bord = zeros(Game.Preferences.Size(1),Game.Preferences.Size(2));

[bordImg,oImg,xImg] = loadassets(Game.Preferences); 


