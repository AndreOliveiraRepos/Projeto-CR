clear

% exercicio - a)

% Template
mT = [0 0 0 0 0;
      0 0 0 0 0;
      0 0 0 0 0;
      0 0 0 0 0;
      0 0 0 0 0;
      0 0 0 0 0;
      0 0 0 0 0];
% 1
m1 = [0 0 1 0 0;
      0 1 1 0 0;
      0 0 1 0 0;
      0 0 1 0 0;
      0 0 1 0 0;
      0 0 1 0 0;
      0 1 1 1 0];
% 2
m2 = [0 1 1 1 0;
      1 0 0 0 1;
      0 0 0 0 1;
      0 0 0 1 0;
      0 0 1 0 0;
      0 1 0 0 0;
      1 1 1 1 1];
% 3
m3 = [0 1 1 1 0;
      1 0 0 0 1;
      0 0 0 0 1;
      0 0 1 1 1;
      0 0 0 0 1;
      1 0 0 0 1;
      0 1 1 1 0];
% 4
m4 = [0 0 1 0 1;
      0 1 0 0 1;
      1 0 0 0 1;
      1 1 1 1 1;
      0 0 0 0 1;
      0 0 0 0 1;
      0 0 0 0 1];
% 5  
m5 = [1 1 1 1 1;
      1 0 0 0 0;
      1 0 0 0 0;
      1 1 1 1 0;
      0 0 0 0 1;
      0 0 0 0 1;
      1 1 1 1 0];
% 6
m6 = [0 1 1 1 0;
      1 0 0 0 0;
      1 0 0 0 0;
      1 1 1 1 0;
      1 0 0 0 1;
      1 0 0 0 1;
      0 1 1 1 0];
% 7
m7 = [1 1 1 1 1;
      0 0 0 0 1;
      0 0 0 1 0;
      0 0 1 0 0;
      0 0 1 0 0;
      0 1 0 0 0;
      0 1 0 0 0];
% 8
m8 = [0 1 1 1 0;
      1 0 0 0 1;
      1 0 0 0 1;
      0 1 1 1 0;
      1 0 0 0 1;
      1 0 0 0 1;
      0 1 1 1 0];
% 9
m9 = [0 1 1 1 0;
      1 0 0 0 1;
      1 0 0 0 1;
      0 1 1 1 0;
      0 0 0 0 1;
      0 0 0 0 1;
      0 1 1 1 0];
% 0
m0 = [0 1 1 1 0;
      1 0 0 0 1;
      1 0 0 0 1;
      1 0 0 0 1;
      1 0 0 0 1;
      1 0 0 0 1;
      0 1 1 1 0];

% Preparar parâmetros da rede
input = [
    m1(1:end);
    m2(1:end);
    m3(1:end);
    m4(1:end);
    m5(1:end);
    m6(1:end);
    m7(1:end);
    m8(1:end);
    m9(1:end);
    m0(1:end)]';

% targets = [1 2 3 4 5 6 7 8 9 0];

targets = [
    
1 0 0 0 0 0 0 0 0 0;
0 1 0 0 0 0 0 0 0 0;
0 0 1 0 0 0 0 0 0 0;
0 0 0 1 0 0 0 0 0 0;
0 0 0 0 1 0 0 0 0 0;
0 0 0 0 0 1 0 0 0 0;
0 0 0 0 0 0 1 0 0 0;
0 0 0 0 0 0 0 1 0 0;
0 0 0 0 0 0 0 0 1 0;
0 0 0 0 0 0 0 0 0 1;
    
];

% Criar a rede neuronal
net = createNN_v8_bv7(input, targets);

% visualizar a rede
%view(net)

% Coeff sinapticos
disp('Coeff: ');
getWeights( net );

% Testar e simular a rede

 disp('Simular [5] - Saida da RN: ');
 tar = m5(1:end)';
 
 %disp(sim1_digs(net, tar));
 x = sim(net, tar);
 
 y = compet(x);
% Find the position of 1 to get the correct number
pos = find(y==1);
% disp('Simular [2] - Saida da RN: ');
 disp(pos);
% tar = m2(1:end)';
% disp(sim1_digs(net, tar));

%disp(sim1_digs(net, input));
