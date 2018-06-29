pkg load image
close all
clear all

im = imread('/home/positivo/Downloads/lua.jpg');

figure("Name","Lua original");
imshow(im);
filtro = [1,1,1;1,1,1;1,1,1];
 im = double(im);
suavizada = uint8(zeros(size(im,1),size(im,2),3));
for i=2:size(im,1)-1
  for j=2:size(im,2)-1
    somatorio1 = (filtro(1,1)*im(i-1,j-1,1)) + (filtro(1,2)*im(i-1,j,1)) + (filtro(1,3)*im(i-1,j+1,1)) + (filtro(2,1)*im(i,j-1,1)) + (filtro(2,2)*im(i,j,1)) + (filtro(2,3)*im(i,j+1,1)) +  (filtro(3,1)*im(i+1,j-1,1)) +(filtro(3,2)*im(i+1,j,1)) + (filtro(3,3)*im(i+1,j+1,1)) ;
    somatorio2 = (filtro(1,1)*im(i-1,j-1,2)) + (filtro(1,2)*im(i-1,j,2)) + (filtro(1,3)*im(i-1,j+1,2)) + (filtro(2,1)*im(i,j-1,2)) + (filtro(2,2)*im(i,j,2)) + (filtro(2,3)*im(i,j+1,2)) +  (filtro(3,1)*im(i+1,j-1,2)) +(filtro(3,2)*im(i+1,j,2)) + (filtro(3,3)*im(i+1,j+1,2)) ;
    somatorio3 = (filtro(1,1)*im(i-1,j-1,3)) + (filtro(1,2)*im(i-1,j,3)) + (filtro(1,3)*im(i-1,j+1,3)) + (filtro(2,1)*im(i,j-1,3)) + (filtro(2,2)*im(i,j,3)) + (filtro(2,3)*im(i,j+1,3)) +  (filtro(3,1)*im(i+1,j-1,3)) +(filtro(3,2)*im(i+1,j,3)) + (filtro(3,3)*im(i+1,j+1,3)) ;   

   suavizada(i,j,1) = somatorio1/9;
   suavizada(i,j,2) = somatorio2/9;
   suavizada(i,j,3) = somatorio3/9; 
  end
end  

figure("Name","Lua suavisada");
imshow(uint8(suavizada));

filtro = [-1,-1,-1;-1,8,-1;-1,-1,-1];
  laplaciano = double(zeros(size(im,1),size(im,2),3));
for i=2:size(im,1)-1
  for j=2:size(im,2)-1
    somatorio1 = (filtro(1,1)*im(i-1,j-1,1)) + (filtro(1,2)*im(i-1,j,1)) + (filtro(1,3)*im(i-1,j+1,1)) + (filtro(2,1)*im(i,j-1,1)) + (filtro(2,2)*im(i,j,1)) + (filtro(2,3)*im(i,j+1,1)) +  (filtro(3,1)*im(i+1,j-1,1)) +(filtro(3,2)*im(i+1,j,1)) + (filtro(3,3)*im(i+1,j+1,1)) ;
    somatorio2 = (filtro(1,1)*im(i-1,j-1,2)) + (filtro(1,2)*im(i-1,j,2)) + (filtro(1,3)*im(i-1,j+1,2)) + (filtro(2,1)*im(i,j-1,2)) + (filtro(2,2)*im(i,j,2)) + (filtro(2,3)*im(i,j+1,2)) +  (filtro(3,1)*im(i+1,j-1,2)) +(filtro(3,2)*im(i+1,j,2)) + (filtro(3,3)*im(i+1,j+1,2)) ;
    somatorio3 = (filtro(1,1)*im(i-1,j-1,3)) + (filtro(1,2)*im(i-1,j,3)) + (filtro(1,3)*im(i-1,j+1,3)) + (filtro(2,1)*im(i,j-1,3)) + (filtro(2,2)*im(i,j,3)) + (filtro(2,3)*im(i,j+1,3)) +  (filtro(3,1)*im(i+1,j-1,3)) +(filtro(3,2)*im(i+1,j,3)) + (filtro(3,3)*im(i+1,j+1,3)) ;   

   laplaciano(i,j,1) = somatorio1/9;
   laplaciano(i,j,2) = somatorio2/9;
   laplaciano(i,j,3) = somatorio3/9; 
  end
end  

figure("Name","Lua laplaciano");
imshow(uint8(laplaciano));

minimo = min(min(laplaciano));
ajustada = laplaciano + (-1*minimo);
figure("Name","Lua ajustada");
imshow(uint8(ajustada));

final = im + laplaciano;
figure("Name","Lua final");
imshow(uint8(final));




