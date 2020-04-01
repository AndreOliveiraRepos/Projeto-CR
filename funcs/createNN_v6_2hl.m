function net = createNN_v6_2hl( p, t )
%CREATENN_V5_2HL Summary of this function goes here
%   Detailed explanation goes here

 neuro = [160, 80];
 net = feedforwardnet(neuro);
 net.layers{1}.transferFcn = 'logsig';
 net.layers{2}.transferFcn = 'logsig';
 net.layers{3}.transferFcn = 'purelin';
 
 net.trainFcn = 'traingdx';
 net.divideFcn = '';
 
 net.trainParam.epochs = 12000;
% net.divideParam.trainRatio = 0.7;
 %net.divideParam.valRatio = 0.15;
 %net.divideParam.testRatio = 0.15;
 
 % treinar a rede
 net = train(net, p, t);

end