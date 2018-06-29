pkg load image
close all
clear all

im = imread("C:/Users/suelliton/Desktop/testeoctave/alface2.jpg");
figure("Name","normal");
imshow(im)
imsaida = uint8(zeros(size(im,1),size(im,2),3));
mascIm = zeros(size(im,1),size(im,2));
for i=1:size(im,1)
  for j=1:size(im,2)
    if( im(i,j,2) > 100 && im(i,j,3) < 125 )  
      mascIm(i,j) = 1;
    end
  end
end 



for i=1:size(im,1)
  for j=1:size(im,2)
    if(mascIm(i,j) == 1 )
      imsaida(i,j,:) = im(i,j,:);       
    else
      imsaida(i,j,:) = 255;       
    end   
  end
end  


figure('Name','Imagem resultado');
imshow(imsaida);