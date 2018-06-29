pkg load image
close all
clear all
entrada1 = imread('C:\Users\Aluno\Pictures\prv2.jpg');
#figure('Name','Original entrada1');
#imshow(entrada1);

# percorro a imagem fazendo a limiarização por cor a fim de separar as partes que interessam
for i=1:size(entrada1,1)
  for j=1:size(entrada1,2)
    if(entrada1(i,j,1) > 150 && entrada1(i,j,2) < 100 && entrada1(i,j,3) < 100 || entrada1(i,j,1) > 217 && entrada1(i,j,2) < 150 && entrada1(i,j,3) > 210     )
      m1(i,j) = 1;
    else 
      m1(i,j) = 0;
    end       
  end
end  

figure('Name','Mascara m1');
imshow(m1);

m2 = m1;
#percorro a imagem novamente para fazer a erosão na imagem com elemento Rhombus
for i=3:size(entrada1,1)-2
  for j=3:size(entrada1,2)-2
    if(m1(i,j)==0 && m1(i-1,j) == 1 || m1(i+1,j) == 1 || m1(i,j-1) == 1 || m1(i,j+1) == 1 ...
     || m1(i-1,j-1) == 1 || m1(i+1,j+1) == 1 || m1(i+1,j-1) == 1 || m1(i-1,j+1) == 1 ... 
     || m1(i-2,j-1) == 1 || m1(i-2,j) == 1 || m1(i-2,j+1) ...
     || m1(i+2,j-1) == 1 || m1(i+2,j) == 1 || m1(i+2,j+1) ...
     || m1(i-1,j-2) == 1 || m1(i,j-2) == 1 || m1(i+1,j-2) ...
     || m1(i-1,j+2) == 1 || m1(i,j+2) == 1 || m1(i+1,j+2) ...
     || m1(i-2,j-2) == 1 || m1(i+2,j+2) == 1 || m1(i+2,j-2) || m1(i-2,j+2))
      m2(i,j) = 1;         
    end       
  end
end
#o contorno recebe a diferença da imagem original e a imagem com erosão  
contorno = m2 - m1;
figure('Name','contorno');
imshow(contorno);

#segunda parte
entrada2 = imread('C:\Users\Aluno\Pictures\ruido.jpg');
#figure('Name','entrada2');
#imshow(entrada2);

filtro = [1,1,1;1,1,1;1,1,1];
entrada2 = double(entrada2);
imSuavizada = zeros(size(entrada2,1),size(entrada2,2));
#percorro a matriz inicializando um vetor de vizinhos,  ordenando e pegando o mediano e atribuindo ao pixel
for i=2:size(entrada2,1)-1
  for j=2:size(entrada2,2)-1
     vetor(1) = entrada2(i-1,j-1);
     vetor(2) = entrada2(i-1,j);
     vetor(3) = entrada2(i-1,j+1);
     vetor(4) = entrada2(i,j-1);
     vetor(5) = entrada2(i,j);
     vetor(6) = entrada2(i,j+1);
     vetor(7) = entrada2(i+1,j-1);
     vetor(8) = entrada2(i+1,j);
     vetor(9) = entrada2(i+1,j+1);     
     
     vetor = sort(vetor);
     imSuavizada(i,j) = uint8( vetor(5));
  
  end
end  
figure('Name','Imsuavizada');
imshow(uint8(imSuavizada));

#percorro a imagem fazendo a mascara de nitidez laplaciano 
filtro = [-1,-1,-1;-1,8,-1;-1,-1,-1];
im = imSuavizada;
laplaciano = double(zeros(size(im,1),size(im,2)));
for i=2:size(im,1)-1
  for j=2:size(im,2)-1
    somatorio1 = (filtro(1,1)*im(i-1,j-1)) + (filtro(1,2)*im(i-1,j)) + (filtro(1,3)*im(i-1,j+1)) + (filtro(2,1)*im(i,j-1)) + (filtro(2,2)*im(i,j)) + (filtro(2,3)*im(i,j+1)) +  (filtro(3,1)*im(i+1,j-1)) +(filtro(3,2)*im(i+1,j)) + (filtro(3,3)*im(i+1,j+1)) ;   
      laplaciano(i,j) = somatorio1/9;  
  end
end

#utilizo filtragem alto-reforço
final = imSuavizada + (4.5 * laplaciano);
#figure('Name','laplaciano');
#imshow(uint8(laplaciano));
figure('Name','final');
imshow(uint8(final));











