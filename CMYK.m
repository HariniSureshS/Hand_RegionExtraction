clear all;
close all;
clc
I = imread('E:\Semester VII\Final Year Project\iCub_jpg\00001323.jpg');
subplot(3,3,1)
imshow(I);
cform = makecform('srgb2lab');
J = applycform(I,cform);
%subplot(3,3,2)
%imshow(J);
K=J(:,:,2);
%subplot(3,3,3)
%imshow(K);
L=graythresh(J(:,:,2));
BW1=im2bw(J(:,:,2),L);
subplot(3,3,2)
imshow(BW1);
%M=graythresh(J(:,:,3));
%figure;imshow(J(:,:,3));
%BW2=im2bw(J(:,:,3),M);
%figure;imshow(BW2);
%O=BW1.*BW2;
% Bounding box
%P=bwlabel(O,8);
%BB=regionprops(P,'Boundingbox');
%BB1=struct2cell(BB);
%BB2=cell2mat(BB1);

%[s1 s2]=size(BB2);
%mx=0;
%for k=3:4:s2-1
 %   p=BB2(1,k)*BB2(1,k+1);
  %  if p>mx & (BB2(1,k)/BB2(1,k+1))<1.8
  %      mx=p;
  %      j=k;
  %  end
%end
%figure,imshow(I);
%hold on;
%rectangle('Position',[BB2(1,j-2),BB2(1,j-1),BB2(1,j),BB2(1,j+1)],'EdgeColor','r' )

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