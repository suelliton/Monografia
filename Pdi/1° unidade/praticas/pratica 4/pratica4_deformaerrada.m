pkg load image
close all
clear all

im =  imread('/home/suelliton/Downloads/objetos.jpg');
figure('Name','Imagem original: objetos PB ');
imshow(im);

imBW = zeros(size(im,1),size(im,2));
for i=1:size(im,1)
  for j=1:size(im,2)
    if(im(i,j) < 128)
      imBW(i,j) = 0;
    else
      imBW(i,j) = 1;
    endif  
  endfor
endfor  

figure('Name','imBW');
imshow(imBW);



novo_rotulo = 2; #rotulo inicial
for i=2:size(imBW,1)
  for j=2:size(imBW,2)  
    if(imBW(i,j) == 1) #se p == 1
      if(imBW(i-1,j) == 0 && imBW(i,j-1) == 0) # se r e t == 0
        imBW(i,j) = novo_rotulo;  #recebe novo rotulo
        if(imBW(i-1,j+1) != 1 && imBW(i-1,j+1) !=0 || imBW(i-1,j+3) != 1 && imBW(i-1,j+3) ) #confere se o visinho superior direito ou 3* ja esta rotulado
          imBW(i,j) = imBW(i-1,j+1); #rotula o ponto com o rotulo do visinho de cima direito         
        else
          novo_rotulo = novo_rotulo +1;  
        endif
      endif
      if(imBW(i-1,j) == 0 && imBW(i,j-1) != 0 )
        imBW(i,j) = imBW(i,j-1);
      endif
      if( imBW(i-1,j) != 0 && imBW(i,j-1) == 0)
        imBW(i,j) = imBW(i-1,j) ;
      endif
      if( imBW(i-1,j) == imBW(i,j-1) && imBW(i-1,j) != 0)
        imBW(i,j) = imBW(i-1,j);
      endif
      if(imBW(i-1,j) != imBW(i,j-1) && imBW(i-1,j) != 0 && imBW(i,j-1) != 0)
        imBW(i,j) = imBW(i-1,j);        
      endif
    else    
    endif
  endfor
endfor  

figure('Name','Rotulada');
imshow(imBW);

imCol = zeros(size(im,1),size(im,2));
for i=1:size(imBW,1)
  for j=1:size(imBW,2)
    imCol(i,j) = imBW(i,j) * 20;
  endfor
endfor  
imCol = uint8(imCol);
figure('Name','Rotulada com tons de cinza');
imshow(imCol);








