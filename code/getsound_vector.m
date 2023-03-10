function [wave,Fs]=getsound_vector(time,name,debug)
% Function getsound_vector generates a wave sample of maximal time seconds
% If no sound it returns (0)
    if nargin < 2, debug=0; end
    if nargin > 1 && isstring(name)
        if 0 < exist(name)
            [wave,Fs] = audioread(name);
            return;
        end
    end

    Fs=8000;
    rec=audiorecorder(Fs,16,1);
    recordblocking(rec,time);
    sound=getaudiodata(rec);
    Fs=rec.SampleRate;% get correct sample rate when Matlab-online

    s1=movmean(abs(sound),ceil(Fs/50));
    bg=mean(s1(1:Fs/4));
    ms=bg*2;
    L=length(s1);

    if debug > 0.1
        x=(0:L-1)/Fs;
        figure;
        subplot(1,2,1);
        plot(x,sound);
        subplot(1,2,2);
        hold on;
        plot(x,s1);
        plot([0,L/Fs],[ms,ms]);
        hold off;
    end

    j=1;
    k=0;
    s=zeros(L,1);
    lim=Fs*0.25;

    for i=1:L
  
        if s1(i)>ms % sound
            s(j)=sound(i);
            j=j+1;
        else % no sound
            if j > lim % we are in a word
                k=k+1;
                j=j+1;
                if k > lim % end of word
                    wave=s(1:j-1);
                    if nargin > 1 && isstring(name)
                        audiowrite(name,wave,Fs);
                    end
                    return;
                end
            end
        end
    end
    wave=(0);
end

