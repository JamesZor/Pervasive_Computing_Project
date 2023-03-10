function res = getpeaks(word,f,debug)
    if nargin <3, debug=0; end
    res=[];
    Ls=500;
    Npks=10;

    s1=movmean(abs(word),ceil(f/50));
    co=0.2*max(s1);
    L=length(s1);


    X=(0:149)*f/Ls;

    t=0;
    l=0;
    for i=1:L
        if s1(i) > co
            t=t+1;
        else
            if t>0
                if t>700
                    p=ceil(i-700);
                
                    y=word(p:p+Ls-1);
                    Y = fft(hamming(Ls) .* y);
                    P2 = abs(Y/Ls);

                    if debug 
                        figure;
                    
                        subplot(3,1,1);
                        hold on;
                        plot((0:L-1)/f,s1);
                        plot([0,L/f],[co,co]);
                        plot([p/f,(p+499)/f],[0.8*co,0.8*co],'LineWidth',2);
                        hold off;
                    
                        subplot(3,1,2);
                        plot(y)
                
                        subplot(3,1,3);
                        plot(X,P2(1:150));
                    end             
                    l=l+1;
                    [pks,locs]=findpeaks(P2(1:150),X(1:150),'SortStr','descend');
                    res(l,:)=[pks(1:Npks)',0.001*locs(1:Npks)];
               
                end
                t=0;
            end
        end
    end
end