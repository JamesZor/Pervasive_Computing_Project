function answ=yes_no_reset()
    global synr;
    global net;
    global f_synr;
    answ=0;
    
    %5ismember('synr', who('global'))
    %ismember('data', who('global'))
    %empty('synr')
    %isempty(synr)
    %if isempty(synr), fprintf("hallo");end
    
    if isempty(synr), [synr,f_synr]=audioread("sounds/synr.wav"); end
    if isempty(net), load ('network/myvoice.mat', 'net'); end
    
    while answ==0
        sound(synr,f_synr);
        pause(0.1+length(synr)/f_synr);

        [w,f]=get_spokenword("Yes/No/Reset",2,0);
        pks=getpeaks(w,f,0);

        if length(pks)>0
            w_out=net(pks');
            [~,i]=max(w_out);
            answ=i(1);
        end
    end
end
