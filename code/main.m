clear all % clear all variables
close all % close all figures

% define global camera (we only have to define once)
global cam; 
cam = webcam("Microsoft*  LifeCam Cinema(TM)");

% players is a struct of struct player
%   player.name
%   player.f
[players(1).name,players(1).fs]=audioread("sounds/player1.wav");
[players(2).name,players(2).fs]=audioread("sounds/player2.wav");

% main loop 
while 1
    %Want_to_play detect movement;
    movement(15);

    %who want to play
    players=input_players(players);
    if isinteger(players), continue; end

    % determine who can start
     [index,~] = who_starts(players);
    %index the players
    players=players(index);

    %play game
    play_game2(players);
end