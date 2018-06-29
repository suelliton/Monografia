pkg load image

clear all
close all
im = imread('D:\EAJ\2017.1\PDI\Aulas\Aula 3\objetos.jpg');

figure('Name','Imagem Original')
imshow(im)

for(i=1:100)
  for(j=1:100)
    if (im(i,j)>126)
      imBW(i,j) = 1;
    else
      imBW(i,j)=0;
    end
  end
end

figure('Name','Imagem Binaria')
imshow(imBW)
imwrite(imBW, 'D:\EAJ\2017.1\PDI\Aulas\Aula 3\objetosBW.jpg');
% comando para passar para binária no Octave
%imBW = im2bw(im);

rotulo = 2;
rotulosIguais(1,1) = 0;
%rotulosIguais(2,1) = 0;
r = 1; %indice do vetor rotulosIguais
imRotulo = imBW; %imagem cópia para armazenar os rótulos
for(i=2:size(imBW,1))
  for(j=2:size(imBW,2))
    if(imBW(i,j)==1)
      if((imBW(i-1,j)==0)&&(imBW(i,j-1)==0))
        rotulo++; % novo rótulo
        imRotulo(i,j)=rotulo;
      else
        if((imBW(i-1,j)==1)&&(imBW(i,j-1)==0))
          imRotulo(i,j)=imRotulo(i-1,j);
        else
          if((imBW(i-1,j)==0)&&(imBW(i,j-1)==1))
            imRotulo(i,j)=imRotulo(i,j-1);
          else
            if(((imBW(i-1,j)==1)&&(imBW(i,j-1)==1))&&(imRotulo(i-1,j)==imRotulo(i,j-1)))
              imRotulo(i,j)=imRotulo(i-1,j);
            else
              if(((imBW(i-1,j)==1)&&(imBW(i,j-1)==1))&&(imRotulo(i-1,j)!=imRotulo(i,j-1)))
                imRotulo(i,j)=imRotulo(i-1,j);
                eq1 = imRotulo(i-1,j);
                eq2 = imRotulo(i,j-1);
                % guardar r�tulos equivalentes - erro
                ultimaLinha = size(rotulosIguais,1);
                ultimaColuna = size(rotulosIguais,2);
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
              end  
            end
          end
        end
      end
    end
  end
end

figure('Name','Imagem Rotulada com erros')
imshow(uint8(imRotulo))

%retirar erros de equival�ncias de r�tulos
for(i=2:size(imRotulo,1))
  for(j=2:size(imRotulo,2))
    if(imRotulo(i,j)!=0)
      [l,c]=find(rotulosIguais==imRotulo(i,j)); %procura o elemento nos erros
      if(!isempty(l))
        imRotulo(i,j) = rotulosIguais(l,1);
      end
    end
  end
end

qtdRegioes =  size(unique(imRotulo),1)-1; %-1 para desconsiderar o fundo
imRotulo = uint8(imRotulo);
figure('Name','Imagem Rotulada')
imshow(imRotulo, [min(min(imRotulo)) max(max(imRotulo))])
imwrite(imRotulo, 'D:\EAJ\2017.1\PDI\Aulas\Aula 3\imRotulo.jpg');

title(strcat('Quantidade de Regioes (foreground): ',int2str(qtdRegioes)))