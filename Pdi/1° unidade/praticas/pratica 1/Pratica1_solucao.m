pkg load image %carrega o pacote image (toolbox pdi)

close all %fecha todas as janelas
clear all %apaga todas as variáveis


%%%%%%% CRIANDO A IMAGEM DEGRADE 

imDegrade = zeros(60, 256); %cria uma matriz 60x256 preenchida com zeros

figure('Name','Imagem zerada') %abre uma nova janela com o título "Imagem zerada"
imshow(imDegrade) %mostra a imagemna janela aberta

for i=1:size(imDegrade,2) %laço de repetição que começa de 1 e vai até a quantidade de colunas da matriz imDegrade - size(imDegrade,2)
  imDegrade(:,i) = (i-1); %atribui a todas as linhas da matriz (:), em cada coluna i, o valor de (i-1)
end

figure('Name', 'Imagem em degrade')
imshow(uint8(imDegrade))
imwrite(imDegrade,'D:\EAJ\2017.1\PDI\Aulas\Aula 1\imDegrade.jpg');

%%%%%%% APLICANDO EFEITO DEGRADE NA IMAGEM LENA.JPG

imLena = imread('c:\imagens\lena.jpg');
imLena = rgb2gray(imLena);

figure('Name', 'Imagem Lena original')
imshow(imLena)
imwrite(imLena,'D:\EAJ\2017.1\PDI\Aulas\Aula 1\Lena.jpg');


valor = -256; %metade da quantidade de coluans da matriz 
for i=1:size(imLena,2) 
  imLena2(:,i) = imLena(:,i)+(++valor); %atribui a todas as linhas da matriz (:), em cada coluna i, o valor de (i-1)
end

figure('Name', 'Imagem Lena com degrade')
imshow(imLena2)
imwrite(imLena2,'D:\EAJ\2017.1\PDI\Codigos-fonte\14_02_17\LenaDegrade.jpg');
