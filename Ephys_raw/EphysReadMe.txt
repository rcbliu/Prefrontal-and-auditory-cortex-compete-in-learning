

% behscore is behavior score 
% behscore is a 8X1 cell array
% each cell is a day, totally 8 days: training day 1 to day8
% each cell is a array
% For example: data{1,1}{1,1} is array 47 X 6
% colmun 1: trial number
% col 2: sound arm
% col 3: choice
% col 4: outcome 
% col 5: irrelevant info
% col 6: sound level



% data is a 8X2 cell array
% each row is a day, totally 8 days: training day 1 to day8
% column 1: spike data. column 2: spatial info from each frame
%
% For spike data:
% each cell contains n cells
% n= cell number X trial number
% each cell is a array
% For example: data{1,1}{1,1} is array 47 X 6
% each row is a spike
% colmun 1: spike time in ms from the onset of the sound
% col 2:phase of the AM modulation circles of the sound
% col 3:x location, in pixels
% col 4:head angle, relative to the edge of the stem, in arc
% col 5:y location, in pixels
% col 6:speed, in pixels/s
%
% For spatial info
% each cell contains a n X 5 array
% For example: data{1,2} is a 205 X 5 array
% each row is a frame
% colmun 1: time of the frame from the sound onset, in seconds
% col 2:x location
% col 3:head angle
% col 4:y location
% col 5:speed
