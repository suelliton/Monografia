pkg load image
close all
clear all

imVaz = zeros(512);
figure('Name', 'imagem vazia');
imshow(imVaz);
tonalidade = 0;
for i=1:2:size(imVaz,2) 
    imVaz(:,i) = tonalidade;
    imVaz(:,i+1) = tonalidade;  
    tonalidade +=1;
endfor  
imVaz = uint8(imVaz);
figure('Name', 'imagem degrade');
imshow(imVaz);

im = imread('/home/suelliton/MEGA/TADS/Pdi/imagens/Lena.jpg');
figure('Name','lena');
imshow(im);

tonalidade = -256;
for i=1:size(im,2)
  im(:,i) = im(:,i) + tonalidade;  
  tonalidade++;  
endfor

figure('Name','lena degrade');
imshow(im);
imwrite(im,'/home/suelliton/MEGA/TADS/Pdi/imagens/lena_susu.jpg');
