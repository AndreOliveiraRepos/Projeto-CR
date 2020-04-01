function result = sim1_digs( net , testInput )
%SIM1_DIGS Summary of this function goes here
%   Detailed explanation goes here

% Simular a rede e guardar o resultado na variavel 
y = sim(net, testInput);

if y <= 0
    y = 0;
end

result = round(y);

end

