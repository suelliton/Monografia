pkg load image
close all
clear all


im = rand(500,1024);
figure(1);
imshow(im);

ton = 0.0;
#preto e branco
for i=1:4:1024    
   for j=0:4   
      im(:,i+j,:)=ton;        
   endfor        
    if(ton == 0.256)
        ton = 0;               
        continue;        
    endif
       ton=ton + 0.01; 
endfor

figure(2);
imshow(im);

#inverso
for i=1:4:1024    
   for j=0:4   
      im(:,i+j,:)=ton;        
   endfor        
    if(ton == 0.0)
        ton = 0.256;       
        continue;        
    endif
       ton=ton - 0.01; 
endfor
figure(3);
imshow(im)

#cima/baixo
ton = 0.0;
for i=1:4:500    
   for j=0:4   
      im(i+j,:)=ton;        
   endfor        
    if(ton == 0.256)
        ton = 0.0;       
        continue;        
    endif
       ton=ton + 0.01; 
endfor
figure(4);
imshow(im)

#baixo/cima
for i=1:4:500    
   for j=0:4   
      im(i+j,:)=ton;        
   endfor        
    if(ton == 0.0)
        ton = 0.256;       
        continue;        
    endif
       ton=ton - 0.01; 
endfor
figure(5);
imshow(im)
