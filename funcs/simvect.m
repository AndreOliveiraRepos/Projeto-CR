function simvect(net, classlabels, vect )
%SIMVECT Summary of this function goes here
%   Detailed explanation goes here

y = sim(net, vect);

if y <= 0
    y = 0;
end

disp('Resultado da NN: ');
disp(y);

y = round(y);
disp('Char: ');
disp(classlabels(1,(y+1)));

end

