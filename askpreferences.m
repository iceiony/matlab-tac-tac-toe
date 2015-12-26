function choices = askpreferences
% opens a GUI with drop down options for game preferences

    WINDOW_HEIGHT = 200;
    WINDOW_WIDTH = 200;

    window = dialog('Name','Game Preferences',...
        'CloseRequestFcn' , @return_nan);
    
    window.Position(3) = WINDOW_WIDTH;
    window.Position(4) = WINDOW_HEIGHT;

    % create drop down controls and labels for game preferences
    gameSizeText = uicontrol('Parent',window,...
        'Style','text',...
        'String','Game Size',...
        'Position', [54 topalign(20) 100 16]);
    
    gameSizePopup = uicontrol('Parent',window,...
        'Style','popup',...
        'String',{'3x3','4x4','5x5'},...
        'Position',[54 topalign(40) 100 20]);
%     

    symbolText = uicontrol('Parent',window,...
        'Style','text',...
        'String','Symbol',...
        'Position', [54 topalign(70) 100 16]);
 
    symbolPopup = uicontrol('Parent',window,...
        'Style','popup',...
        'String',{'Noughts(o)','Crosses(x)'},...
        'Position',[44 topalign(90) 130 20]);
%     

    gameTypeText = uicontrol('Parent',window,...
        'Style','text',...
        'String','Game Type',...
        'Position', [54 topalign(120) 100 16]);
 
    gameTypePopup = uicontrol('Parent',window,...
        'Style','popup',...
        'String',{'Player vs Computer','Player vs Player','Computer vs Computer'},...
        'Position',[24 topalign(140) 170 20]);
    
%     
    playButton = uicontrol('Parent',window,...
       'String','Play',...
       'Position',[54 topalign(190) 89 34],...
       'Callback',@retrieve_settings);
   
    % stop execution untill UI window is closed
    uiwait(window);
    
    
    function out = topalign(pixels)
        out = WINDOW_HEIGHT- pixels;
    end

    % on Play button click return the settings to the invoker
    function retrieve_settings(~,~)
        
        % convert choices to more representative values
        switch gameSizePopup.Value
            case 1 
                GamePreferences.Size = [3 3];
            case 2
                GamePreferences.Size = [4 4];
            case 3
                GamePreferences.Size = [5 5];
        end
        
        switch symbolPopup.Value
            case 1 
                GamePreferences.Symbol = 'O';
            case 2 
                GamePreferences.Symbol = 'X';
        end
        
        switch gameTypePopup.Value
            case 1
                GamePreferences.Type = 'PvC';
                GamePreferences.PlayerNames = { 'Player', 'Computer' };
            case 2
                GamePreferences.Type = 'PvP' ;
                GamePreferences.PlayerNames = { 'Player 1 ', 'Player 2' };
            case 3
                GamePreferences.Type = 'CvC';
                GamePreferences.PlayerNames = { 'Computer 1', 'Computer 2' };
        end
        
        choices = GamePreferences;
        delete(window);
    end

    function return_nan(~,~)
        choices = NaN;
        delete(window);
    end

end
