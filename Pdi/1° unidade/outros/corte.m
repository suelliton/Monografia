pkg load image
clear all
close all

im = imread('/home/suelliton/Imagens/chapeu.jpg');
figure(1);
imshow(im);

vetor = 0:1:255 ;
for i=1:length(im)
  for j=1:length(im)
    tonalidade = (im(i,j,3)/3) +(im(i,j,2)/3) +(im(i,j,1)/3);
    vetor(tonalidade) = vetor(tonalidade) + 1;
    endif
  endfor
endfor  
      
      
figure(2);
imshow(im);      



