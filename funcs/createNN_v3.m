function net = createNN_v3( p, t )
%CREATE_NN Summary of this function goes here
%   Detailed explanation goes here

% Criar RN chamada net
net = feedforwardnet(10, 'trainlm');

% FUNCAO DE ATIVACAO DA CAMADA DE SAIDA
net.layers{1}.transferFcn = 'logsig'; %sigmoide
net.layers{2}.transferFcn = 'purelin'; %linear

% NUMERO DE EPOCAS DE TREINO
net.trainParam.epochs = 8000;

% FUNCAO DE TREINO 
%net.trainFcn = 'traingdx';

% EXEMPLOS DE INPUT USADOS NO TREINO


% treinar a rede
net = train(net, p, t);

end