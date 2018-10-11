pkg load image
close all
clear all

for i=1:2

im = imread(strcat("C:/Users/suelliton/Pictures/A",num2str(i),".jpg"));
figure('Name','Imagem ');
imshow(im);

#inicializo as imagens com zeros do tamanho daimagem original
im2 = uint8(zeros(size(im,1),size(im,2),3));
im3 = uint8(zeros(size(im,1),size(im,2),3));
im4 = uint8(zeros(size(im,1),size(im,2),3));

#inicializo as mascaras para separar as partes interessadas
mascIm2 = zeros(size(im,1),size(im,2));
mascIm3 = zeros(size(im,1),size(im,2));
mascIm4 = zeros(size(im,1),size(im,2));

#preencho as mascaras usando  condicionais para cada imagem 
cont = 0
for i=1:size(im,1)
  for j=1:size(im,2)
    if( im(i,j,2) > 200 && im(i,j,1) > 150 && im(i,j,1) < 255 && im(i,j,3) > 50 && im(i,j,3) < 255)  
      mascIm2(i,j) = 1;
      cont++;
    end
    
      
    
  end
end 
"quantidade de pixels"
cont
#uso as mascaras e separo cada parte interessada em uma imagem nova
for i=1:size(im,1)
  for j=1:size(im,2)
    if(mascIm2(i,j) == 1 )
      im2(i,j,:) = im(i,j,:);       
    else
      im2(i,j,:) = 0;        
    end
     
  end
end  


figure('Name','Imagem 2');
imshow(im2);

end


