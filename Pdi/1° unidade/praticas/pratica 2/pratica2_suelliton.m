pkg load image

close all
clear all
t = tic;
im = imread('/home/suelliton/MEGA/TADS/Pdi/imagens/lena.jpg');

figure('Name','lena original colorida');
imshow(im);
size(im)

imCinza = rgb2gray(im);
figure('Name','lena original tons de cinza');
imshow(imCinza);
size(imCinza)

#for i=1:size(imCinza,1)
 # for j=1:size(imCinza,2)
  #  saida1(i,j) = imCinza(i,j) + (imCinza(i,j)*1.4);
  #endfor
#endfor  
saida1 = imCinza + (imCinza*1.4);

figure('Name','saida1');
imshow(saida1);  


#for i=1:size(imCinza,1)
 # for j=1:size(imCinza,2)
  #  saida2(i,j) = imCinza(i,j) - (imCinza(i,j)*0.4);
  #endfor
#endfor "
saida2 = imCinza - (imCinza*0.4); 

figure('Name','saida2');
imshow(saida2); 
imwrite(imCinza,'/home/suelliton/MEGA/TADS/Pdi/imagens/imCinza.jpg');
imwrite(saida1,'/home/suelliton/MEGA/TADS/Pdi/imagens/saida1.jpg');
imwrite(saida2,'/home/suelliton/MEGA/TADS/Pdi/imagens/saida2.jpg');

toc(t);




