pkg load image

clear all %limpa as variáveis da memória
close all %fecha todas as janelas abertas

original = imread('C:\Imagens\Lena.jpg'); %lê uma imagem no caminho indicado e armazena na variável "original"
figure(1) %abre uma janela
imshow(original) %exibe a imagem na janela aberta

cinza = rgb2gray(original); %transforma para escalas de cinza
imwrite(cinza, 'D:\EAJ\2017.1\PDI\Aulas\Aula 2\cinza.jpg');

% Reduza a imagem cinza em 50% e escreva como Peq.jpg (peq);
x=1;
for i=1:2:size(cinza,1)
    y=1;
    for j=1:2:size(cinza,2)
        peq(x,y) = cinza(i,j);
        y=y+1;
    end
    x=x+1;
end
figure(2)
imshow(peq)
imwrite(peq, 'D:\EAJ\2017.1\PDI\Aulas\Aula 2\peq.jpg');

% Amplie a imagem peq utilizando o método do vizinho mais próximo e escreva como vizP.jpg (vizp);
% inserindo pixels de peq
imAmpliada = zeros(size(cinza,1), size(cinza,2));
x=1;
for i=1:size(peq,1)
    y=1;
    for j=1:size(peq,2)
        imAmpliada(x,y) = peq(i,j);
        y=y+2;
    end
    x=x+2;
end
imAmpliada = uint8(imAmpliada);
figure(3)
imshow(imAmpliada)
imwrite(imAmpliada, 'D:\EAJ\2017.1\PDI\Aulas\Aula 2\imAmpliada.jpg');

% vizinhos mais próximos por linha zerada
vizP = imAmpliada;
for i=2:2:size(vizP,1)
  for j=2:2:size(vizP,2)-1
    vizP(i,j) = vizP(i-1,j-1);
    vizP(i,j+1) = vizP(i-1,j+1);
  end
end
figure(4)
imshow(vizP)

%vizinhos mais próximos em "x"
for i=1:size(vizP,1)
  for j=2:size(vizP,2)
    if(vizP(i,j) == 0)
      vizP(i,j) = vizP(i,j-1);
    end
  end
end
figure(5)
imshow(vizP)

% inserindo pixels do vizinho mais próximo
% na primeira coluna...
for i=2:size(vizP,1)
  if(vizP(i,1) == 0)
     vizP(i,1) = vizP(i-1,1);
  end
end
figure(6)
imshow(vizP)

imwrite(vizP, 'D:\EAJ\2017.1\PDI\Aulas\Aula 2\vizP.jpg');

% interpolação bilinear por linha zerada
imBilinear = double(imAmpliada);
for i=2:2:size(imBilinear,1)-1
  for j=2:2:size(imBilinear,2)-1
    imBilinear(i,j) = (imBilinear(i-1,j-1)+imBilinear(i-1,j+1)+imBilinear(i+1,j-1)+imBilinear(i+1,j+1))/4;
    imBilinear(i,j+1) = (imBilinear(i-1,j)+imBilinear(i+1,j))/2;
  end
end
figure(7)
imshow(uint8(imBilinear))

%interpolação bilinear em "x"
for i=1:size(imBilinear,1)
  for j=2:size(imBilinear,2)-1
    if(imBilinear(i,j) == 0)
      imBilinear(i,j) = uint8((imBilinear(i,j-1)+imBilinear(i,j+1))/2);
    end
  end
end
figure(8)
imshow(uint8(imBilinear))


% inserindo pixels de interpolação bilinear
% na primeira linha e última colunas...
for i=2:size(imBilinear,1)-1
  if(imBilinear(i,1) == 0)
     imBilinear(i,1) = uint8((imBilinear(i-1,j)+imBilinear(i+1,j))/2);
  end
end
imBilinear = uint8(imBilinear);
figure(9)
imshow(imBilinear)

imwrite(imBilinear, 'D:\EAJ\2017.1\PDI\Aulas\Aula 2\bilinear.jpg');
