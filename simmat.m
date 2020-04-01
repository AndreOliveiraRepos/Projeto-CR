function [char,y] = simmat(net, classlabels, inputMat )
%SIMVECT Summary of this function goes here
%   Detailed explanation goes here

y = sim(net, inputMat(1:end)');

z = compet(y);

% Find the position of 1 to get the correct number
pos = find(z==1);

disp('Resultado da NN: ');
disp(pos);

disp('Char: ');
disp(classlabels(1,pos));

char = classlabels(1,pos);

end

