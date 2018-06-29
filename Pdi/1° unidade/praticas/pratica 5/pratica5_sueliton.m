pkg load image
close all
clear all

im = imread('/home/suelliton/MEGA/TADS/Pdi/imagens/mulherNeg.jpg');
figure('Name','Imagem original: mulher em negativo');
imshow(im);

roi = imread('/home/suelliton/MEGA/TADS/Pdi/imagens/ROI_circular.jpg');
# percorro a mascara roi a fim de  extrair uma mascara binaria e guardo na matriz roiBW
for i=1:size(roi,1)
  for j=1:size(roi,2)
    if(roi(i,j) < 128)
      roiBW(i,j) = 0;
    else
      roiBW(i,j) = 1;
    endif  
  endfor
endfor  
figure('Name','Região de Interesse - ROI');
imshow(roiBW);

#uso a operaçao aritmetica de multiplicaçao entre a imagem original e a mascara a fim de separar a´area de interesse 
imOpArit = im .* roiBW ;
figure('Name','Operação Aritmética');
imshow(imOpArit);

#Leio mais uma imagem e faço a soma da imagem imOpArit com a imagem flores.jpg
imBackG = imread('/home/suelliton/MEGA/TADS/Pdi/imagens/flores.jpg');
imOperConj = imOpArit + imBackG ;
figure('Name','Operação com Conjuntos - União');
imshow(imOperConj);

#transformo a imagem negativa em colorida
for i=1:size(imOperConj,1)
  for j=1:size(imOperConj,2)
    imOperP2P(i,j,:) = 255 - imOperConj(i,j,:) ;  
  endfor
endfor  
figure('Name','Operação Ponto a Ponto - Negativo');
imshow(imOperP2P);

#faço o espelhamento horizontal da imagem
for j=1:size(imOperP2P,2)
   imTGeo(:,j,:) = imOperP2P(:,size(imOperP2P,2)-j+1,:);#+1 pois faria a operaç~ao 1-1=0 e nao existe indice 0
endfor  
figure('Name','Transformação Geométrica – Espelhamento Horizontal');
imshow(imTGeo);


#----------------operacao final---------------------
#espelho horizontalmente a imagem imOpArit 
for j=1:size(imOpArit,2)
   imSaida(:,j,:) = imOpArit(:,size(imOpArit,2)-j+1,:);
endfor 
#duplicar lado esquerdo horizontalmente da imagem imBackG
for i=1:size(imBackG,2)
  imBackG_invertida(:,i,:) = imBackG(:,size(imBackG,2)-i+1,:);
endfor

#percorro a matriz transformando de negativo pra colorido e ao mesmo tempo fazendo a atribuiçao do fundo imBackG
#so onde o valor da mascara roiBW ´e igual a 0 ou seja as ´areas perifericas da imagem da mulher  
for i=1:size(imSaida,1)
  for j=1:size(imSaida,2)
    imSaida(i,j,:) =255 - imSaida(i,j,:);
    if(roiBW(i,j) == 0)
      imSaida(i,j,:) = imBackG_invertida(i,j,:) ; 
    endif
  endfor  
endfor

figure('Name','Operações matriciais – Imagem Final');
imshow(imSaida);



















