function players = input_players(players)
    global hallo;
    global itaop;
    global f_hallo;
    
    if isempty(hallo), [hallo,f_hallo]=audioread("sounds/hallo.wav");  end
    if isempty(itaop), [itaop,f_hallo]=audioread("sounds/itaop.wav");  end
    
    count=0;
    while 1
        [name,f]=getname();
        if name == 0, players=0; return; end
        if length(name) > 1
            count=count+1;
            players(count).name=name;
            players(count).fs=f;

            sound(hallo,f_hallo);
            pause(0.1+length(hallo)/f_hallo);
            sound(name,f);
            pause(0.1+length(name)/f);
            sound(itaop,f_hallo);
            pause(0.1+length(itaop)/f_hallo);      

            answ = yes_no_reset();
            if answ == 2, return; end
            if answ == 3, players=0; return; end    
        end
    end
end