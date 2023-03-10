function [index,count]=who_starts(players, index, count)
    l=length(players);
    % first call ?
    if nargin < 2, index=zeros(l,1);count=1; end

    % get throws for this round
    d=zeros(l,1); 
    for i=1:l
        if index(i)==0, d(i)=throw_dice(players(i));end
    end
    %d'
  
    % select single values
    for i=1:6,if length(d(d==i))==1, index(d==i)=1;end;end
    index(index==0)=-1;

    for i=6:-1:1
        ld=length(d(d==i));
        if ld==1 % single value is okay
            index(d==i)=count;
            count=count+1;
        elseif ld>1 % thows are the same, select and throw again
            index(d==i)=0;
            [index,count] = who_starts(players,index,count);
        end
    end
    %index'
end