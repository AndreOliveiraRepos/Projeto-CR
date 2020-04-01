clear

load binaryalphadigs

input   = logical([]);
targets = false(36,1404);

% Carregar algarismos de 0 a 9  e A a Z de dat
% Percorrer todos os elementos da matriz
for i= 1 : 36
    % Percorrer o exemplo de cada caractere
    for j = 1 : 39
        
        % Converter cada exemplo da classe/char para vector coluna
        aux = logical(cell2mat(dat(i,j)));
        aux = aux(1:end)';
        
        % Concatenar a coluna � matriz de inputs
        newMat = [input, aux];
        input = newMat;
        
        % Vector de targets
        row = i;
        col = (39*(i-1)) + j;
        targets(row,col) = 1;
    end
end

net = createNN_v9(input, targets);

mat = ~image2mat('img/myx.jpg');
imshow(mat);

x = sim(net, mat(1:end)');
y = compet(x);
pos = find(y == 1);

disp('Char: ');
disp(classlabels(1,pos));