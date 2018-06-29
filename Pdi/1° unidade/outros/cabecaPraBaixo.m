pkg load image
close all
clear all


im =  imread('/home/suelliton/Imagens/Wallpapers/how-to-install-npm-and-nodejs.jpg');
figure('Name', ' caracal');
imshow(im);



qtd_lin = size(im,1);
qtd_col = size(im,2);
saida = uint8(ones(700,700,3));
z = qtd_lin;
k = qtd_col;
for i=1:1:qtd_lin
  for j=1:1:qtd_col     
    saida(i,j,:)=im(z,k,:);   
     k = k-1; 
  endfor 
  z = z-1;
  k = qtd_col;
endfor

figure('Name','caracal invertido');
imshow(saida);  