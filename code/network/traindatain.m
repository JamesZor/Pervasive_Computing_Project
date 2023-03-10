words=["YES","NO","REA"];
M=40;
res=zeros(M,21);

for i=1:M
    rn=randi([1 3],1,1);
    [w,f]=get_spokenword(words(rn),2);
    pks=getpeaks(w,f);
    if length(pks) > 0, res(i,:)=[rn, pks];end
end
save('learn2','res')
