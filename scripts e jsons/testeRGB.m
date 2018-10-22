pkg load image
close all
clear all



im = imread("C:/Users/suelliton/charmander2.jpg");
figure('Name','Imagem r ');
imR = uint8(im(:,:,1));

imshow(imR);
figure('Name','Imagem g ');
imG = uint8(im(:,:,2));
imshow(imG);

figure('Name','Imagem b ');
imB = uint8(im(:,:,3));
imshow(imB);

imwrite(imR,"C:/Users/suelliton/r.jpg");
imwrite(imG,"C:/Users/suelliton/g.jpg");
imwrite(imB,"C:/Users/suelliton/b.jpg");



