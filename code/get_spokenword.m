function [wave,fs]=get_spokenword(word,time,debug)
    if nargin < 3, debug=0; end
    if nargin < 2, time=3; end
     
    fprintf("\nYou have %d sec. tp pronounce the word '%s' ...",time,word);
    [wave,fs]=getsound_vector(time,0,debug);
end