function mat = image2vector( fileName )
%IMAGE2VECTOR Summary of this function goes here
%   Detailed explanation goes here

% Carregar imagem
b = imread(fileName);

% Convert to Gray-scale image
c = rgb2gray(b);

% Convert to Binary image
d = im2bw(b,graythresh(c)); 

% Crop the image to edges
e = crop_edge(d);

% Convert to 20*16 image
f = imresize(e,[20,16]);

g = double(f);

mat = g(1:end)';

end

