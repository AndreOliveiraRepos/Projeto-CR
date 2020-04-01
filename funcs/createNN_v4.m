function net = createNN_v4( p, t )
 
 net = feedforwardnet(20, 'traingdx');
 
 net.performFcn = 'mse';
 
 net.trainParam.epochs = 25000;
 
 net.layers{1}.transferFcn = 'logsig';
 net.layers{2}.transferFcn = 'purelin';
 
 
 %net.trainFcn = 'trainlm';
 net.divideFcn = '';
 
 %net.divideParam.trainRatio = 0.7;
 %net.divideParam.valRatio = 0.15;
 %net.divideParam.testRatio = 0.15;



% TREINAR
net = train(net, p, t);

end