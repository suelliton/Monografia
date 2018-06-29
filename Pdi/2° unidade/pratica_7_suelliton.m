pkg load image
close all
clear all

im = imread('/home/suelliton/Downloads/rgb6.jpg');
#figure('Name','“Imagem original: RGB');
#imshow(im);
#inicializo as imagens com zeros do tamanho daimagem original
im2 = uint8(zeros(size(im,1),size(im,2),3));
im3 = uint8(zeros(size(im,1),size(im,2),3));
im4 = uint8(zeros(size(im,1),size(im,2),3));

#inicializo as mascaras para separar as partes interessadas
mascIm2 = zeros(size(im,1),size(im,2));
mascIm3 = zeros(size(im,1),size(im,2));
mascIm4 = zeros(size(im,1),size(im,2));

#preencho as mascaras usando  condicionais para cada imagem 
for i=1:size(im,1)
  for j=1:size(im,2)
    if(im(i,j,1) > 100 &&  im(i,j,2) > 100 && im(i,j,3) < 140 )  
      mascIm2(i,j) = 1;
    end
    
    if(im(i,j,1) < 100 &&  im(i,j,2) > 80  )  
      mascIm3(i,j) = 1;
    end
    
    
    if(im(i,j,1) > 150 &&   im(i,j,2) < 100 && im(i,j,3) < 100  )
      mascIm4(i,j) = 1;      
    end    
    
  end
end 

#uso as mascaras e separo cada parte interessada em uma imagem nova
for i=1:size(im,1)
  for j=1:size(im,2)
    if(mascIm2(i,j) == 1 )
      im2(i,j,:) = im(i,j,:);       
    else
      im2(i,j,:) = 255;        
    end
    
    if(mascIm3(i,j) == 1 )
      im3(i,j,:) = im(i,j,:);       
    else
      im3(i,j,:) = 255;        
    end  
  
    if(mascIm4(i,j) == 1 )
      im4(i,j,:) = im(i,j,:);       
    else
      im4(i,j,:) = 255;        
    end    
  end
end  


figure('Name','Imagem 2');
imshow(im2);
figure('Name','Imagem 3');
imshow(im3);
figure('Name','Imagem 4');
imshow(im4);





im2 = imread('/home/suelliton/Downloads/soja.jpg'); 

figure('Name','Imagem original: soja');
imshow(im2);
#transformo a im2 em tons de cinza
imCinza = rgb2gray(im2);

figure('Name','Imagem Cinza');
imshow(imCinza);
#exibo o histograma da imagem cinza
figure('Name','Histograma');
imhist(imCinza);

mascIm2 = zeros(size(im2,1),size(im2,2));
#percorro a imCinza fazendo a limiarização e criando uma mascara de acordo com o histograma, usando o ponto 150 onde começa os tons referentes 
#á área de interesse
for i=1:size(imCinza,1)
  for j=1:size(imCinza,2)
    if(imCinza(i,j) < 150)
      mascIm2(i,j) = 1 ;    
    end     
  end
end 

figure('name','Mascara');
imshow(mascIm2);  

#inicializo a imFinal
imFinal =  uint8(zeros(size(im2,1),size(im2,2),3));

#percorro a matriz novamente e usando a mascara feita realoco os tons de interesse na imFinal
#e coloco tom branco onde não é de interesse 
for i=1:size(imCinza,1)
  for j=1:size(imCinza,2)
    if(mascIm2(i,j) == 0)  
      imFinal(i,j,:) = im2(i,j,:) ; 
    else
      imFinal(i,j,:) = 255 ; 
    end 
  end
end 

figure('name','Imagem final');
imshow(imFinal);






