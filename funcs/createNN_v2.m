function net = createNN_v2( p, t )
%CREATE_NN Summary of this function goes here
%   Detailed explanation goes here

% Criar RN chamada net
net = feedforwardnet(5, 'trainlm');

% FUNCAO DE ATIVACAO DA CAMADA DE SAIDA
net.layers{1}.transferFcn = 'logsig'; %sigmoide
net.layers{2}.transferFcn = 'purelin'; %linear

% NUMERO DE EPOCAS DE TREINO
net.trainParam.epochs = 500;

% FUNCAO DE TREINO 
net.trainFcn = 'traingdx';

% EXEMPLOS DE INPUT USADOS NO TREINO
net.divideFcn = 'dividerand';

net.divideParam.trainRatio = 1;
net.divideParam.valRatio = 0;
net.divideParam.testRatio = 0;

% treinar a rede
net = train(net, p, t);

end

% No relat�rio, falar da diferen�a entre a fun��o trainlm e traingdx
% falar de como as hiddens units influenciam a decis�o para bem e mal 
% (usar exemplo do ketchup no curso da coursera)