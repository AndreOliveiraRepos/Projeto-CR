function getWeights( net )
%GETWEIGHTS Summary of this function goes here
%   Detailed explanation goes here

% wb = formwb(net,net.b,net.iw,net.lw);
% [b,iw,lw] = separatewb(net,wb);
% w1= iw;
% w2 = lw;

disp('The input-to-hidden layer weights: ');
w1 = net.IW{1}; %the input-to-hidden layer weights
disp(w1);

disp('the input-to-hidden layer bias: ');
b1 = net.b{1}; %the input-to-hidden layer bias
disp(b1);

disp('the hidden-to-output layer weights: ');
w2 = net.LW{2,1}; %the hidden-to-output layer weights
disp(w2);

disp('the hidden-to-output layer bias: ');
b2 = net.b{2}; %the hidden-to-output layer bias
disp(b2);

% disp('bias: ');
% disp(b);
end

