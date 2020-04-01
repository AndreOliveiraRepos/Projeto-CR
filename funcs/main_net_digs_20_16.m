clear

load binaryalphadigs

input   = logical([]);
targets = false(10,390);

% Carregar algarismos de 0 a 9 do dataset
% Percorrer todos os algarismos de 0 a 9
for i= 1 : 10
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

net = createNN_v8_bv7(input, targets);

mat = ~image2mat('img/5.jpg');
imshow(mat);

x = sim(net, mat(1:end)');
y = compet(x);
pos = find(y==1);

disp('Char: ');
disp(classlabels(1,pos));