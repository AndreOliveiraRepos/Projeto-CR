function net = createNN_v8_bv7( p, t )
%CREATENN_V5_2HL Summary of this function goes here
%   Detailed explanation goes here

 neuro = [10, 5];
 net = feedforwardnet(neuro);

 
 net.trainFcn = 'trainlm';
 
 net.layers{1}.transferFcn = 'tansig';
 net.layers{2}.transferFcn = 'tansig';
 net.layers{3}.transferFcn = 'purelin';
 
  net.performFcn = 'mse';
  net.trainParam.epochs = 800;
   
 net.divideFcn = 'dividerand';
  
 net.divideParam.trainRatio = 0.7;
 net.divideParam.valRatio = 0.15;
 net.divideParam.testRatio = 0.15;

%net.divideFcn = '';
 
 % treinar a rede
 net = train(net, p, t);

 %disp('Train params: ');
 %disp(tr);
end
