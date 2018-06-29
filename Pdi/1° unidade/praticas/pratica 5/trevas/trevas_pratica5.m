#link video : https://www.youtube.com/watch?v=waL77PeT14k
pkg load image 
close all
clear all

im = imread('/home/suelliton/Downloads/Trevas1.jpg');
figure('Name','Original');
imshow(im);

#Percorro a imagem a fim  binarizar para usar a imagem resultante(imMasc) como mascara 
for i=1:size(im,1)
  for j=1:size(im,2)
    if(im(i,j) < 128)
      imMasc(i,j) = 0;
    else
      imMasc(i,j) = 1;
    endif  
  endfor
endfor  
figure('Name','Mascara');
imshow(imMasc);


#Percorro a matriz (imMasc) verificando onde e 1, onde for atribuo a uma nova matriz (imSaida)
#o pixel correspondente que esta na matriz original(im), e a cada coluna de uma linha a variavel
#(inclinacao) ´e incrementada, tal qual a cada volta modifica a linha do pixel que esta sendo 
#alocado na matriz (imSaida)
for i=1:size(im,1) 
  inclinacao = 0;  
  for j=1:size(im,2)     
    if(imMasc(i,j) == 1)
      imSaida(i+inclinacao,j) = im(i,j);    
    endif      
    inclinacao++; 
  endfor
endfor
# Conserto o tamanho da matriz (imSaida) para 400x200, pois a operaçao anterior 'dobrou'
#a quantidade de linhas da imagem a qual se espera o resultado(imSaida) ficando 399x200,
#e seto essa linha como fundo branco
imSaida(size(imMasc,1)*2,:) = 255;     
figure('Name','Saida 1');
imshow(imSaida);


#Neste bloco preencho as lacunas deixadas pelas operaçoes anteriores, faço um processo parecido com 
#a atribuiçao inicial so que a fim de preencher com branco os triangulos pretos de cima e baixo
   
preencheCima =1;
for i=1:size(imSaida,1)/2   
    imSaida(i,preencheCima:size(imSaida,2)) = 255;     
   preencheCima++;  
endfor  
#Mesma coisa do bloco acima com pequenas diferencas como por ex comecar a atribuir a partir do meio
#da imagem levando em consideracao as linhas e fazendo os degrais incrementais a cada linha
preencheBaixo = 1;
for i=(size(imSaida,1)/2):size(imSaida,1)
    imSaida(i,1:preencheBaixo-1) = 255;     
    preencheBaixo++;  
endfor   
figure('Name','Trevas 2');
imshow(imSaida);
imwrite(imSaida,'/home/suelliton/Downloads/Trevas2.jpg');






