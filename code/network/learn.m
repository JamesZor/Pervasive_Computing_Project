words=["YES","NO","REA"];

data = load('learn3.mat');
labels=data.res(:,1)';
inputs =data.res(:,2:end)';

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
data = load('learn2.mat');
[l,]=size(data.res);

labels= [labels, data.res(:,1)'];
inputs= [inputs, data.res(:,2:end)'];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
data = load('learn1.mat');
[l,]=size(data.res);

labels= [labels, data.res(:,1)'];
inputs= [inputs, data.res(:,2:end)'];

%labels(labels==4)=1;
%labels(labels>4)=4;


targets=dummyvar(labels); % make the matrix target
targets=targets';

net = patternnet(10);
[net, ~] = train(net, inputs, targets);
predicted= net(inputs);
[c,~,~,~] = confusion(targets,predicted); 
plotconfusion(targets,predicted)
save("myvoice.mat","net");