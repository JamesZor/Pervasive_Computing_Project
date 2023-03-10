function [winnerPlayer] = play_game2(players)
% function to play the game of snakes and ladders for upto 7
% function will for each player take dice roll, move player and display
% results to the screen. This will comntinue untill one player wins (score
% >=100).

% Constants.
    numberOfPlayers = length(players);
    global boardImage;
    global board;
    global step_sound;
    global step_f;


    boardImage = imread('snakes_and_ladder.jpeg');
    win_condition = false; % set win condition no.
    [up_sound,up_f]    =audioread("sounds/up.wav");  
    [down_sound,down_f]=audioread("sounds/down.wav");  
    [step_sound,step_f]=audioread("sounds/step.wav");  

%The ladders and snakes
    p=(1:100);
    p(1)=38;p(4)=14;p(8)=30;p(28)=76;p(21)=42;p(50)=67;p(71)=92;p(80)=99;
    p(32)=10;p(36)=6;p(48)=26;p(62)=18;p(88)=24;p(95)=56;p(97)=78;


% set up 
    board=figure;
    current_pos = zeros(1,numberOfPlayers); % create array for positions
    new_pos = 0; % create array for an updated postion

% compute 

    while( win_condition ~=  true )
    %disp(["Turn: ", j])
        for i= 1:numberOfPlayers;

        % disp( players(i) )

            diceValue = throw_dice(players(i))
            new_pos = current_pos(i)+diceValue;
            current_pos = display_game(current_pos,i,new_pos);    
        
        % check win
            if new_pos >= 100
                winnerPlayer = players(i);
                current_pos(i) = 100;
                win_condition = true;
            end % end win if.

            if p(new_pos)>new_pos % ladders
                new_pos=p(new_pos);
                sound(up_sound,up_f);pause(length(up_sound)/up_f);
            elseif p(new_pos) < new_pos %Snakes
                new_pos = p(new_pos);
                sound(down_sound,down_f);pause(length(down_sound)/down_f);
            end % end ladders
        % finish up
            current_pos(i) = new_pos;
            display_game(current_pos);
            pause(0.2);
        end % for player loop end.
     end %for while win end.

    display_position(current_pos);
    pause(0.1)

    disp(["game over. Player ", winnerPlayer, "wins."]); 
end


function current_pos = display_game(current_pos,playerIndex,new_pos)
    global boardImage;
    global step_sound;
    global step_f;
    global board;

    
    figure(board);
    %axis off;
    %hold on;
    
    if nargin < 2
        playerIndex = 1;
        new_pos = current_pos(playerIndex);
    end
    
    old_pos = current_pos(playerIndex);
    for pos = old_pos : new_pos 
        current_pos(playerIndex)=pos;

        if nargin >1 && pos > old_pos
            sound(step_sound,step_f);
        end
       
        imshow(boardImage);
        hold on;
        axis off;
        for i = 1:length(current_pos)
            [x,y] = position(current_pos(i));
             plot(x,y, get_marker(i), 'MarkerSize', 25, 'LineWidth',5 );
        end
        
        pause(0.2)

    end

end

function [x,y]=position(pos)        
    q =  floor((pos-1) ./ 10) ; 
    even = mod(q, 2); 
    odd = mod(q-1, 2);
    y = (453 - q*45);
    x = ( odd*( 42 + 45*( mod(pos-1,10)) ) + even*(453 - 45*( mod(pos-1,10)))  );
end

function marker = get_marker(playerIndex)
    colour="gbcmykr";
    shape="o+x*^v";
    marker=[colour{1}(1+mod(playerIndex-1,7)) shape{1}(1+mod(playerIndex-1,6))];
end