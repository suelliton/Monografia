pkg load image
close all
clear all

im = imread('/home/suelliton/Downloads/lena.jpg');
figure(1);
imshow(im);

x=1;
y=1;
for i=1:2:size(im,1)
  for j=1:size(im,2)
    if mod(i,2) != 0 && mod(j,2) != 0
      saida(x,y,:) = im(i,j,:);
      y=y+1;    
    endif
  endfor
  y=1;  
  x=x+1;  
endfor  

figure(2);
imshow(saida);