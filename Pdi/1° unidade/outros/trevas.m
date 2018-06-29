pkg load image;
close all
clear all


im = imread('/home/suelliton/Downloads/Trevas1.jpg');

figure('Name','Original')
imshow(im);

for i=1:size(im,1)
  for j=1:size(im,2)
    if(im(i,j) < 128)
      imMasc(i,j) = 0;
    else
      imMasc(i,j) = 1;
    endif
  endfor
endfor  

figure('Name','Mascara')
imshow(imMasc);


for i=1:size(im,1)
  inclinacao = 0;
  for j=1:size(im,2)
    if(imMasc(i,j) == 1)
      imSaida(i+inclinacao,j) = im(i,j);
    endif
    inclinacao ++;
  endfor
endfor  

imSaida(size(imMasc,1)*2,:) = 255;
figure('Name','saida1');
imshow(imSaida);


preencheCima = 1;

for i=1:size(imSaida,1)/2 
    imSaida(i,preencheCima:size(imSaida,2)) = 255;
    preencheCima ++; 
endfor  
  
  
figure('Name', 'saida2');
imshow(imSaida);
  
preencheBaixo = 1;
for i=size(imSaida,1)/2:size(imSaida,1) 
    imSaida(i,1:preencheBaixo-1) = 255;
    preencheBaixo++;
endfor 

figure('Name', 'saida3');
imshow(imSaida);
imwrite(imSaida,'/home/suelliton/Downloads/Trevas1.jpg');
















