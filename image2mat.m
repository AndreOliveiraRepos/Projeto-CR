function mat = image2mat( fileName )
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
mat = imresize(e,[20,16]);


end

