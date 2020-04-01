function [char,y] = simcell( net, classlabels, inputCell )
%SIM_ALPHADIGS Summary of this function goes here
%   Detailed explanation goes here

% Convert mat to vec

mat_teste = logical(cell2mat(inputCell));

y = sim(net, mat_teste(1:end)');

% if y <= 0
%     y = 0;
% end

z = compet(y);
% Find the position of 1 to get the correct number
pos = find(z==1);

disp('Resultado da NN: ');
disp(pos);

%y = round(y);
disp('Char: ');
disp(classlabels(1,pos));
char = classlabels(1,pos);
end

