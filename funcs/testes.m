clear

load binaryalphadigs

%mat = cell(36,39);

input = [];
targets = [];

for i= 1 : 36
    for j = 1 : 39
        
        aux = double(cell2mat(dat(i,j)));
        aux = aux(1:end)';
        
        a = input;
        b = aux;
        c = [a,b];
        input = c;
        
        aa = targets;
        cc = [aa, (i-1)];
        targets = cc;
    end
end

% disp(inputData);

net = createNN_v1(input, targets);
% view(net);

% 
% % disp('treinar [2] - Saida da RN: ');
% % tar = mat2(1:end)';
% 
% disp('sim: ')

mat_teste = double(cell2mat(dat(9,39)));
%y = sim(net,teste);

[a,b] = sim(net, mat_teste(1:end)');

disp(a);
disp(b);
%disp(classlabels(1,round(y)));

% SIMULAR
% out = sim(net, irisInputs);


%VISUALIZAR DESEMPENHO

% plotconfusion(targets, y);


