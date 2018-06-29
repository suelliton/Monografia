pkg load image
close all
clear all

im = imread('/home/suelliton/Downloads/lena.jpg');
figure(1);
imshow(im);
im = rgb2gray(im);
figure(2);
imshow(im);

saida = uint8(ones(size(im,1),size(im,2)));

ton = uint8(0);
for i=1:2:size(im,1)
   for j=0:1    
    saida(:,i+j) = im(:,i+j) +ton;      
   endfor
    ton = ton+1; 
endfor  
figure(3);
imshow(saida);    

