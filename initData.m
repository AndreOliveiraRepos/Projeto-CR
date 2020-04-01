function [ input, targets ] = initData(nChars, dat )
%INITDATA Summary of this function goes here
%   Detailed explanation goes here

input   = logical([]);
if(nChars> 10)
    targets = false(nChars,1404);
else
    targets = false(nChars,390);
end

for i= 1 : nChars
    % Percorrer o exemplo de cada algarismo
    for j = 1 : 39
        
        % Converter cada exemplo da classe para vector coluna
        aux = logical(cell2mat(dat(i,j)));
        aux = aux(1:end)';
        
        % Concatenar a coluna à matriz de inputs
        newMat = [input, aux];
        input = newMat;
        
        % Vector de targets
        row = i;
        col = (39*(i-1)) + j;
        targets(row,col) = 1;
    end
end

end

