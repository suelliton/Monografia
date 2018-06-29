pkg load image

clear all %limpa as variáveis da memória
close all %fecha todas as janelas abertas
t = tic;

im = imread('C:\Imagens\Lena.jpg'); %lê uma imagem no caminho indicado e armazena na variável "im"
figure(1) %abre uma janela
imshow(im) %exibe a imagem na janela aberta

size(im) %mostra no console do octave o tamanho da imagem

red = im(:,:,1);
green = im(:,:,2);
blue = im(:,:,3);

imCinza = ((red*0.3) + (green*0.59) + (blue*0.11));
%imCinza = rgb2gray(im); %Transforma de RGB (colorida) para escalas de cinza (original2)
figure(2) %abre outra janela
imshow(imCinza) %exibe a imagem em tons de cinza na outra janela

size(imCinza)
imwrite(imCinza, 'C:\Imagens\LenaG.jpg');

% Utilizando o comando “for”, aumenta o valor de cada pixel da imagem imCinza 
%em 30%. Uint8 não permite que o maior valor ultrapasse 255;
saida1 = imCinza;
%for i=1:size(imCinza,1)
%    for j=1:size(imCinza,2)
%        saida1(i,j) = saida1(i,j)*1.4;
%    end
%end
saida1(:,:) = saida1(:,:)*1.4;
figure(3)
imshow(saida1)

imwrite(saida1, 'C:\Imagens\saida1.jpg');

%Utilizando o comando “for”, diminua o valor de cada pixel da imagem imCinza 
%em 30%, não permitindo porém que o menor valor seja menor do que 0;
saida2 = imCinza;
%for i=1:size(imCinza,1)
%    for j=1:size(imCinza,2)
%        saida2(i,j) = saida2(i,j)-(saida2(i,j)*0.4);
%    end
%end

%saida2(:,:) = saida2(:,:)-(saida2(:,:)*0.4);
saida2 = saida2-(saida2*0.4);
figure('Name','Imagem Saida2');
imshow(saida2)
sainda2 = uint8(saida2);


imwrite(saida2, 'C:\Imagens\saida2.jpg');

toc(t)