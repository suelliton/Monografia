pkg load image
close all
clear all

im = imread('C:\Users\Aluno\Downloads\lena.jpg');
figure(1);
imshow(im);

size(im)
imCinza = rgb2gray(im);
size(imCinza)


saida1 = ones(512,512);
saida1 = uint8(saida1);
for i=1:size(imCinza,1)
  for j=1:size(imCinza,2)
    saida1(i,j) = imCinza(i,j) + (imCinza(i,j)*0.40);
  endfor
endfor

 
  
saida2 = ones(512,512); 
saida2 = uint8(saida2); 
for i=1:size(imCinza,1)
  for j=1:size(imCinza,2)
    saida2(i,j) = imCinza(i,j) - (imCinza(i,j)*0.40);
  endfor
endfor

figure('Name','imCinza');
imshow(imCinza);
figure('Name','saida1');
imshow(saida1);
figure('Name','saida2');
imshow(saida2);

imwrite(imCinza,'C:\Users\Aluno\Downloads\');









