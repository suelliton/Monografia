pkg load image

close all 
clear all

im = imread('/home/suelliton/MEGA/TADS/Pdi/imagens/lena.jpg');
figure('Name','Imagem original: Lena.jpg');
imshow(im);

imCinza = rgb2gray(im);

x = 1,y = 1;
for i=1:2:size(imCinza,1)
  for j=1:2:size(imCinza,2)
    imPeq(x,y) = imCinza(i,j);
    y++;
  endfor
  x++;
  y=1;
endfor  
figure('Name','imPeq');
imshow(imPeq);
imwrite(imPeq,'/home/suelliton/MEGA/TADS/Pdi/imagens/peq.jpg');

imPeq = imread('/home/suelliton/MEGA/TADS/Pdi/imagens/peq.jpg');

x = 1, y = 1;
for i=1:size(imPeq,1)
  for j=1:size(imPeq,2)
    imAmpliada(x,y) = imPeq(i,j);
    y +=2;
  endfor
  x +=2;
  y=1;
endfor  
figure('Name','Ampliada1');
imshow(imAmpliada);

imVizProx = imAmpliada;
#faz linhas impares
for i=1:2:size(imAmpliada,1)
  for j=2:2:size(imAmpliada,2)    
        imVizProx(i,j) = imAmpliada(i,j-1);    
  endfor
endfor  
#faz linhas pares
for i=2:2:size(imAmpliada,1)
  for j=2:2:size(imAmpliada,2)-1
    imVizProx(i,j) = imAmpliada(i-1,j-1);
    imVizProx(i,j+1) = imAmpliada(i-1,j+1);
  endfor
endfor  
#concerta primeira coluna 
for i=2:size(imVizProx,1)
    if(imVizProx(i,1) == 0)
      imVizProx(i,1) = imVizProx(i-1,1);
    endif
endfor
figure('Name','Vizprox');
imshow(imVizProx);
imwrite(imVizProx,'/home/suelliton/MEGA/TADS/Pdi/imagens/vizProximo.jpg');


#bilinear

imBilinear = double(imAmpliada);
for i=2:2:size(imBilinear,1)-1
  for j=2:2:size(imBilinear,2)-1
    imBilinear(i,j) = (imBilinear(i-1,j-1)+imBilinear(i-1,j+1)+imBilinear(i+1,j-1)+imBilinear(i+1,j+1))/4;
    imBilinear(i,j+1) = (imBilinear(i-1,j)+imBilinear(i+1,j))/2;
  end
end


%interpolação bilinear em "x"
for i=1:size(imBilinear,1)
  for j=2:size(imBilinear,2)-1
    if(imBilinear(i,j) == 0)
      imBilinear(i,j) = uint8((imBilinear(i,j-1)+imBilinear(i,j+1))/2);
    end
  end
end
  
#primeira coluna consertar
for i=1:size(imBilinear,1)-1
  if(imBilinear(i,1) == 0)
     imBilinear(i,1) = (imBilinear(i-1,1)+imBilinear(i+1,1))/2;   
  endif
  if(imBilinear(i,size(imBilinear)) == 0)
    imBilinear(i,size(imBilinear)) = (imBilinear(i-1,size(imBilinear)-1)+imBilinear(i+1,size(imBilinear)-1))/2;   
  endif
endfor


imBilinear = uint8(imBilinear);
figure('Name','Bilinear');
imshow(imBilinear);
imwrite(imBilinear, '/home/suelliton/MEGA/TADS/Pdi/imagens/inBilinear.jpg');













