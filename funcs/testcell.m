mat_teste = logical(cell2mat(dat(5,1)));
y = sim(net, mat_teste(1:end)');
z = compet(y);
pos = find(z==1);
disp(classlabels(1,pos));