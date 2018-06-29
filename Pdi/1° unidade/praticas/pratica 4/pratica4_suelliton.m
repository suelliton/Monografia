pkg load image

close all
clear all

im =  imread('/home/suelliton/MEGA/TADS/Pdi/imagens/objetos.jpg');
figure('Name','Imagem original: objetos PB');
imshow(im);

imBW = zeros(size(im,1),size(im,2));
for i=1:size(im,1)
  for j=1:size(im,2)
    if(im(i,j) >127)
      imBW(i,j) = 1;
    endif
  endfor
endfor  

figure('Name','Mascara');
imshow(imBW);
rotulosIguais(1,1) = 0 ;
rotulo = uint8(2);
indice = 1;
im = imBW;
for i=1:size(imBW,1)
  for j=1:size(imBW,2)
    if(imBW(i,j) ==1)
       if(imBW(i-1,j) == 0 && imBW(i,j-1) == 0)
        im(i,j) = rotulo ;
        rotulo++;
       endif  
       
       if(imBW(i-1,j) == 1 && imBW(i,j-1) == 0)
        im(i,j) = im(i-1,j);
       endif
       
       if(imBW(i-1,j) == 0 && imBW(i,j-1) == 1)
        im(i,j) = im(i,j-1);
       endif
       
       if(imBW(i-1,j) == 1 && imBW(i,j-1) == 1)
        if(im(i-1,j) != im(i,j-1))
          im(i,j) = im(i-1,j);
                eq1 = im(i-1,j);#eq1 guarda o valor do pixel de cima
                eq2 = im(i,j-1);#eq2 guarda o valor do pixel do lado esquerdo
                % guardar r�tulos equivalentes - erro
                ultimaLinha = size(rotulosIguais,1);#ultima linha ´e igual ao tamanho da qtd de linhas do vetor de erros
                ultimaColuna = size(rotulosIguais,2);#ultima coluna ´e igual ao tamanho da qtd de colunas do vetor de erros
                [l1,c1]=find(rotulosIguais==eq1); %busca o 1o elemento
                [l2,c2]=find(rotulosIguais==eq2); %busca o 2o elemento
                if ((isempty(l1))&&(isempty(l2))) %n�o achou nenhum dos elementos
                  rotulosIguais(ultimaLinha+1,1) = eq1;
                  rotulosIguais(ultimaLinha+1,2) = eq2;
                else
                  if ((!isempty(l1))&&(isempty(l2))) %n�o achou o 1o elemento
                    rotulosIguais(l1,ultimaColuna+1) = eq2;
                  else
                    if ((isempty(l1))&&(!isempty(l2))) %n�oachou o 2o elemento
                      rotulosIguais(l2,ultimaColuna+1) = eq1;
                    end
                  end           
                end
         
        else
          im(i,j) = im(i-1,j);
        endif
        
       endif
    endif
  endfor
endfor  

for(i=2:size(im,1))
  for(j=2:size(im,2))
    if(im(i,j)!=0)
      [l,c]=find(rotulosIguais==im(i,j)); %procura o elemento nos erros
      if(!isempty(l))
        im(i,j) = rotulosIguais(l,1);
      end
    end
  end
end




for i=1:size(im,1)
  for j=1:size(im,2)
    im(i,j) = im(i,j) *5 ;
  endfor
endfor  




figure('Name','Rotulada ');
imshow(uint8(im));






