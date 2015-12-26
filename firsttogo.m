function [player] = firsttogo(gamePreference)
    player = randi(2);
    uiwait(warndlg(sprintf('%s goes first',gamePreference.PlayerNames{player})));
end