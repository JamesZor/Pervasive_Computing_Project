function [name,f]=getname()
    global wiyn;
    global iyn;
    global Fs;
    
    if isempty(wiyn), [wiyn,Fs]=audioread("sounds/wiyn.wav");  end
    if isempty(iyn), [iyn,Fs]=audioread("sounds/iyn.wav");  end
    
    while 1
        sound(wiyn,Fs);
        pause(0.1+length(wiyn)/Fs);

        [name,f]=get_spokenword("Your name",3);
        
        sound(iyn,Fs);
        pause(0.1+length(iyn)/Fs);
      
        sound(name,f);
        pause(0.1+length(name)/f);

        answ = yes_no_reset();
        if answ == 1, return; end
        if answ == 3, name=0; return; end    
    end

end