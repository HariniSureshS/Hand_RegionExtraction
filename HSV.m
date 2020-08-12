
I = imread('E:\Semester VII\Final Year Project\iCub_jpg\00001323.jpg');
subplot(2,2,1),
imshow(I);
I=double(I);
[hue,s,v]=rgb2hsv(I);
cb=0.148*I(:,:,1)-0.291*I(:,:,2)+0.439*I(:,:,3)+128;
cr=0.439*I(:,:,1)-0.368*I(:,:,2)-0.071*I(:,:,3)+128;  
[w h]=size(I(:,:,1));
for i=1:w
    for j=1:h            
        if   145<=cr(i,j)&cr(i,j)<=165&145<=cb(i,j)&cb(i,j)<=180&0.01<=hue(i,j)&hue(i,j)<=0.15      
            segment(i,j)=1;            
        else       
            segment(i,j)=0;    
        end    
    end
end

subplot(2,2,2),
imshow(segment);
skin=segment;
skin=bwareaopen(skin,round(w*h/900));
se=strel('disk',5);
skin=imdilate(skin,se); 
subplot(2,2,3),
imshow(skin);

TP=0;
TN=0;
FP=0;
FN=0;
I=imread('E:\Semester VII\Final Year Project\icub_black_white\00001323.jpg');
I=im2bw(I);
for i=1:128
    for j=1:128
        if(I(i,j)==0 && skin(i,j)==0)
            TP=TP+1;
        end
        if(skin(i,j)==0)
            if(I(i,j)==1)
                FP=FP+1;
            end          
        end
         if(skin(i,j)==1)
            if(I(i,j)==0)
                FN=FN+1;
            end          
         end
        if(skin(i,j)==1 && I(i,j)==1)
            TN=TN+1;
                   
        end
    end
end

    

