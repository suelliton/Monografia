pkg load image

close all 
clear all
#ler imagem desmatamento
im = imread('/home/suelliton/MEGA/TADS/Pdi/imagens/desmatamento.jpg');
#figure('Name', 'Imagem original: desmatamento');
#imshow(im);

#transforma em tons de cinza 
imCinza = rgb2gray(im);
#figure('Name','imCinza');
#imshow(imCinza);

#Inicializa variavel contadora desmatamento
#percorro com fors a imCinza verificando se o pixel tiver valor superior a 115 recebe 1 se nao recebe 0
#ao mesmo momento que faço a contagem de pixels pertencentes a parte desmatada que s~ao os mais claros 
desmatamento = 0;
for i=1:size(imCinza,1)
  for j=1:size(imCinza,2)
    if(imCinza(i,j) > 115)
      imLimiar(i,j) = 1;
      desmatamento++;
    else
      imLimiar(i,j) = 0;
    endif
  endfor
endfor  
#totalPixels guarda o produto dos tamanhos de linha e coluna obtendo-se a quantidade de pixels da imagem
totalPixels = size(imLimiar,1)*size(imLimiar,2);
#calculo o percentual de desmatamento usando regra de tres
x = (desmatamento*100)/totalPixels;

#exibo imagem
figure('Name','imLimiar');
imshow(imLimiar);
#coloco um texto no final da imagem na parte inferior,concatenando as informaçoes de desmatamento
text(200,size(imLimiar,1)+30,strcat('Percentual de desmatamento = ',num2str(x),'%')) ; 

#leio nova imagem degrade
im2 = imread('/home/suelliton/MEGA/TADS/Pdi/imagens/degrade.jpg');
figure('Name','Imagem original: degrade”');
imshow(im2);

#calculo log das intensidades da imagem gerando imLog
imLog = im2uint8(mat2gray(3*log(1+double(im2))));  
#exibo
figure('Name','Logaritmo');
imshow(imLog);

#calculo potencia das intensidades da imagem gerando imPot
imPot = im2uint8(mat2gray(power(double(im2),3)));     
#exibo imagem
figure('Name','Potencia');
imshow(imPot);

#leio nova imagem tomografia
im3 = imread('/home/suelliton/MEGA/TADS/Pdi/imagens/tomografia.jpg');
#exibo original tomografia
figure('Name','tomografia');
imshow(im3);
#tranformo tomografia(im3) em tons de cinza 
im3 = rgb2gray(im3);
#atribuo im3 a imFat que guardara ofatiamento
imFat1 = im3;
#percorro com fors e onde estiver no intervalo de 50 a 100 atribuo a intensidade 200
# e em todo o resto atribuo intensidade 50
for i=1:size(im3,1)
  for j=1:size(im3,2)
    if(im3(i,j) > 50 && im3(i,j) < 100)
      imFat1(i,j) = 200;
    else
      imFat1(i,j) = 50;   
    endif
  endfor
endfor  
#exibo
figure('Name','im7');
imshow(imFat1);
  
#percorro com fors im3 novamente usando os mesmos limiares anteriores baixando os valores em 70%
#se o pixel tiver valor superior a 170 diminuo em 30%
#todo o restante de intensidades teem um aumento de 50%   
for i=1:size(im3,1)
  for j=1:size(im3,2)
    if(im3(i,j) > 50 && im3(i,j) < 100)
      imFat2(i,j) =  im3(i,j)* 0.7; 
    elseif(im3(i,j) > 170)
      imFat2(i,j) =  im3(i,j)* 0.3;
    else
      imFat2(i,j) =  im3(i,j)* 1.5; 
    endif
  endfor
endfor 
figure('Name','im8');
imshow(imFat2);



