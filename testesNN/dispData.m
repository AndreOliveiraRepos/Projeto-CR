function myOut = dispData( net, tr, inputs, targets )
%DISPDATA Summary of this function goes here
%   Detailed explanation goes here

% SIMULAR
out = sim(net, inputs);

%VISUALIZAR DESEMPENHO

plotconfusion(targets, out) % Matriz de confusao
figure;
%plotperf(tr)         % Grafico com o desempenho da rede nos 3 conjuntos           
plotperform(tr)
%Calcula e mostra a percentagem de classificacoes corretas no total dos exemplos
r=0;
for i=1:size(out,2)           % Para cada classificacao  
  [a b] = max(out(:,i));      %b guarda a linha onde encontrou valor mais alto da saida obtida
  [c d] = max(targets(:,i));  %d guarda a linha onde encontrou valor mais alto da saida desejada
  if b == d                   % se estao na mesma linha, a classificacao foi correta (incrementa 1)
      r = r+1;
  end
end

accuracy = r/size(out,2)*100;
fprintf('Precisao total %f\n', accuracy)

% ----------------------------------------------

TInput = inputs(:, tr.testInd);
TTargets = targets(:, tr.testInd);

out = sim(net, TInput);

%Calcula e mostra a percentagem de classificacoes corretas no conjunto de teste
r=0;
for i=1:size(tr.testInd,2)     % Para cada classificacao  
  [a b] = max(out(:,i));       %b guarda a linha onde encontrou valor mais alto da saida obtida
  [c d] = max(TTargets(:,i));  %d guarda a linha onde encontrou valor mais alto da saida desejada
  if b == d                    % se estao na mesma linha, a classificacao foi correta (incrementa 1)
      r = r+1;
  end
end
accuracy = r/size(tr.testInd,2)*100;
fprintf('Precisao teste %f\n', accuracy)

myOut = net;

end

