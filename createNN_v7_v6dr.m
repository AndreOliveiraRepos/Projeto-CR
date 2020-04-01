function net = createNN_v7_v6dr( p, t )
%CREATENN_V5_2HL Summary of this function goes here
%   Detailed explanation goes here

 neuro = [160, 80];
 net = feedforwardnet(neuro);

 net.trainFcn = 'traingdx';
 
 net.layers{1}.transferFcn = 'logsig';
 net.layers{2}.transferFcn = 'logsig';
 net.layers{3}.transferFcn = 'purelin';
 
 net.performFcn = 'mse';
 net.trainParam.epochs = 20000;
   
%  net.divideFcn = 'dividerand';
%   
%  net.divideParam.trainRatio = 1;
%  net.divideParam.valRatio = 0.2;
%  net.divideParam.testRatio = 0.2;

net.divideFcn = '';
 
 % treinar a rede
 net = train(net, p, t);

 %disp('Train params: ');
 %disp(tr);
end
