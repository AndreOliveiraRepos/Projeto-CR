clear

load binaryalphadigs

input   = logical([]);
%targets = false(10,390);
targets = false(36,1404);

% Carregar algarismos de 0 a 9 do dataset
% Percorrer todos os c
for i= 1 : 36
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

[net, tr] = net_2hl(input, targets);
dispData(net, tr, input, targets);

mat = ~image2mat('5.jpg');
x = sim(net, mat(1:end)');
y = compet(x);
pos = find(y==1);
disp('Char img (5): ');
disp(classlabels(1,pos));

mat = logical(cell2mat(dat(6,18)));
x = sim(net, mat(1:end)');
y = compet(x);
pos = find(y==1);
disp('Char cell (5): ');
disp(classlabels(1,pos));

mat = ~image2mat('myl2.jpg');
x = sim(net, mat(1:end)');
y = compet(x);
pos = find(y==1);
disp('Char img (L): ');
disp(classlabels(1,pos));

mat = ~image2mat('myc.jpg');
x = sim(net, mat(1:end)');
y = compet(x);
pos = find(y==1);
disp('Char img (C): ');
disp(classlabels(1,pos));

mat = ~image2mat('myj.jpg');
x = sim(net, mat(1:end)');
y = compet(x);
pos = find(y==1);
disp('Char img (J): ');
disp(classlabels(1,pos));

mat = ~image2mat('myx.jpg');
x = sim(net, mat(1:end)');
y = compet(x);
pos = find(y==1);
disp('Char img (X): ');
disp(classlabels(1,pos));