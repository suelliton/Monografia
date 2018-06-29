pkg load image
close all
clear all


im = imread('/home/suelliton/MEGA/TADS/Pdi/imagens/dolar.jpg');
figure(1);
imshow(im);
imCinza = rgb2gray(im);
figure(2);
imshow(im);


for i=1:size(imCinza,1)
  for j=1:size(imCinza,2)
    camada = dec2bin(imCinza(i,j),8);
    
   camada1(i,j) = str2num(camada(1)) ;    
   camada2(i,j) = str2num(camada(2)) ;
   camada3(i,j) = str2num(camada(3))  ;
   camada4(i,j) = str2num(camada(4)) ;
   camada5(i,j) = str2num(camada(5))  ;
   camada6(i,j) = str2num(camada(6))  ;
   camada7(i,j) = str2num(camada(7)) ;
   camada8(i,j) = str2num(camada(8))  ;
  endfor
endfor  

imSaida = max(camada1,camada2);

figure(3);
imshow(camada1);
figure(4);
imshow(camada2);
figure(5);
imshow(imSaida);


for i=1:size(imSaida,1)
  for j=1:size(imSaida,2)
    if(imSaida == 1)
      imSaidaFinal(i,j,:) = im(i,j,:);
    else
      #imSaidaFinal(i,j,:) = imSaida(i,j);  
    endif
  endfor
endfor  
figure(6);
imshow(imSaidaFinal);



for i=1:size(imSaida,1)
  for j=1:size(imSaida,2)
    if(camada3 ==1 || camada4 == 1 ||camada5 == 1 || camada6 == 1 ||camada7 == 1 || camada8 == 1)
      imSaidaFinal2(i,j,:) = im(i,j,:);
    else
      #imSaidaFinal2(i,j,:) = imSaida(i,j);  
    endif
  endfor
endfor  
figure(7);
imshow(imSaidaFinal2);




