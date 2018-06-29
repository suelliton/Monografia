pkg load image
clear all
close all

im = imread('/home/suelliton/Imagens/caracal.jpg');
figure(1);
imshow(im);

for i=1:length(im)
  for j=1:length(im)
    tonalidade = (im(i,j,3)/3) +(im(i,j,2)/3) +(im(i,j,1)/3);
    if( tonalidade < 128)
      im(i,j,:) = 0;
    else
      im(i,j,:) = 255; 
    endif
  endfor
endfor  
      
figure(2);
imshow(im);      
