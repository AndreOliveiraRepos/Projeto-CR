function net = createNN_v1( p, t )
%CREATE_NN Summary of this function goes here
%   Detailed explanation goes here

% Criar RN chamada net
net = feedforwardnet(5, 'trainlm');

% FUNCAO DE ATIVACAO DA CAMADA DE SAIDA
net.layers{1}.transferFcn = 'logsig'; %sigmoide
net.layers{2}.transferFcn = 'purelin'; %linear

% FUNCAO DE TREINO 
net.trainFcn = 'traingdx';

% EXEMPLOS DE INPUT USADOS NO TREINO
net.divideFcn = 'dividetrain';

% treinar a rede
net = train(net, p, t);

end

