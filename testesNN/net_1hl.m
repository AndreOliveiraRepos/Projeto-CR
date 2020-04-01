function [ net, tr ] = net_1hl( inputs, targets )

%CREATENN_V5_2HL Summary of this function goes here
%   Detailed explanation goes here

net = feedforwardnet(14, 'traingdx');

net.layers{1}.transferFcn = 'logsig';
net.layers{2}.transferFcn = 'purelin';
 
net.divideFcn = 'dividerand';
net.divideParam.trainRatio = 0.7;
net.divideParam.valRatio = 0.15;
net.divideParam.testRatio = 0.15;

net.trainParam.epochs = 50000;
  


% net.divideFcn = 'dividetrain';

[net, tr] = train(net, inputs, targets);

 x = inputs;
 t = targets;

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

disp(tr);

end

