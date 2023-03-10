function throw=throw_dice(player)
    global pttd;
    global f_pttd;

    if isempty(pttd), [pttd,f_pttd]=audioread("sounds/pttd.wav");  end
 
    %if isstring(player.name)
    %    fprintf("Throw the dice %s\n",player.name);
    %else
        sound(pttd,f_pttd);
        pause(0.1+length(pttd)/f_pttd);
        sound(player.name,player.fs);
        pause(0.1+length(player.name)/player.fs);
    %end
    %throw=randi([1,6]);
    
    throw=dice_count();

   while ~ismember(throw,(1:6))
        throw = dice_count();
   end

end 


function diceValue=dice_count()
    movement(10);
    
    im=movement(-2);
    imshow(im)

    im3=im(:,:,2);
    im4=im2bw(im3,0.20);
    im5=imopen(im4,strel('disk',3));
    im6=imcomplement(im5);
    im7=imopen(im6,strel('disk',2));
    [labels,diceValue]=bwlabel(im7);
end
