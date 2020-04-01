function net = createNN_v9( p, t )
%CREATENN_V5_2HL Summary of this function goes here
%   Detailed explanation goes here

 net = feedforwardnet(5);

 net.trainFcn = 'trainlm';
 
 net.layers{1}.transferFcn = 'logsig';
 net.layers{2}.transferFcn = 'purelin';
 
  net.performFcn = 'sse';
  net.trainParam.epochs = 800;
   
 net.divideFcn = 'dividerand';
  
 net.divideParam.trainRatio = 1;
 net.divideParam.valRatio = 0;
 net.divideParam.testRatio = 0;

%net.divideFcn = '';
 
 % treinar a rede
 net = train(net, p, t);

 %disp('Train params: ');
 %disp(tr);
end
