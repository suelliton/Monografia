pkg load image
close all
clear all



im = imread("C:/Users/suelliton/bola.jpg");

figure('Name','Imagem normal ');
imshow(im);
imCinza = rgb2gray(im);
figure('Name','Imagem cinza ');
imshow(imCinza);
imwrite(imCinza,"bolaCinza.jpg");
figure('Name','Imagem hist ');
hist(imCinza);
imwrite(hist(imCinza),"histbolaCinza.jpg");

imBin = (zeros(size(im,1),size(im,2)));
for i=1:size(im,1)
  for j=1:size(im,2)
    if(imCinza(i,j) > 240)
      imBin(i,j) = 1;
     else
      imBin(i,j) = 0;
     end 
  end
end

figure('Name','Imagem binaria ');
imshow(imBin);
imwrite(imBin,"bolaBin.jpg");


#imBlur = uint8(zeros(size(im,1),size(im,2),3));

#for i=2:size(im,1)-1
  #for j=2:size(im,2)-1
    #imBlur(i,j,1) = (im(i,j-1,1) + im(i,j,1)+im(i,j+1,1) + im(i-1,j-1,1)+ im(i-1,j,1) + im(i-1,j+1,1)+im(i+1,j-1,1)+im(i+1,j,1)+im(i+1,j+1,1))/9;
   # imBlur(i,j,2) = (im(i,j-1,2) + im(i,j,2)+im(i,j+1,2) + im(i-1,j-1,2)+ im(i-1,j,2) + im(i-1,j+1,2)+im(i+1,j-1,2)+im(i+1,j,2)+im(i+1,j+1,2))/9;
  #  imBlur(i,j,3) = (im(i,j-1,3) + im(i,j,3)+im(i,j+1,3) + im(i-1,j-1,3)+ im(i-1,j,3) + im(i-1,j+1,3)+im(i+1,j-1,3)+im(i+1,j,3)+im(i+1,j+1,3))/9;
         
 # end
#end  

#imBlur = imsmooth(im,"Gaussian");

#imBlur = imsmooth(imBlur,"Gaussian");

#imBlur = imsmooth(imBlur,"Gaussian");

#imBlur = imsmooth(imBlur,"Gaussian");

#imBlur = imsmooth(imBlur,"Gaussian");
#figure('Name','Imagem blur ');
#imshow(imBlur);
#imwrite(imBlur,"imBlur.jpg");




