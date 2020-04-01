function [ net, tr ] = net_2hl( inputs, targets )

 neuro = [160, 80];
 net = feedforwardnet(neuro);
 
 net.trainFcn = 'traingdx';
 
 net.layers{1}.transferFcn = 'logsig';
 net.layers{2}.transferFcn = 'logsig';
 net.layers{3}.transferFcn = 'purelin';
 
%   net.divideFcn = 'dividerand';
%  net.divideParam.trainRatio = 0.7;
%  net.divideParam.valRatio = 0.15;
%  net.divideParam.testRatio = 0.15;

 
 net.trainParam.epochs = 60000;

 net.divideFcn = '';
 
 x = inputs;
 t = targets;
 
[net, tr] = train(net, x, t);
%y = net(x);
view(net);
yTrn = net(x(:,tr.trainInd)); tTrn = t(:,tr.trainInd);
yVal = net(x(:,tr.valInd)); tVal = t(:,tr.valInd);
yTst = net(x(:,tr.testInd)); tTst = t(:,tr.testInd);
yAll = net(x); tAll = t;
figure;
plotconfusion(tTrn, yTrn, 'Training')
figure;
plotconfusion(tVal, yVal, 'Validation')
figure;
plotconfusion(tTst, yTst, 'Test')
figure;
plotconfusion(tAll, yAll, 'Overall')

 % Treinar a rede
%  [net, tr] = train(net, inputs, targets);
 
 disp(tr);

end

