srcFiles = dir('E:\Semester VII\Final Year Project\iCub_jpg\*.jpg'); 
srcFiles_bw = dir('E:\Semester VII\Final Year Project\icub_black_white\*.jpg'); 
Excel_Name = "CMYK.xlsx";
D={'image','TP','FP','FN','TN'};
xlswrite(Excel_Name,D)
for x = 1 : length(srcFiles_bw)
    filename = strcat('E:\Semester VII\Final Year Project\iCub_jpg\',srcFiles(x).name);
    filename_bw = strcat('E:\Semester VII\Final Year Project\icub_black_white\',srcFiles_bw(x).name);
    I=imread(filename);
    I1=imread(filename_bw);
    newStr = extractBetween(filename,"iCub_jpg\",".jpg"); 
    str = strcat(char(newStr),'.jpg');
cform = makecform('srgb2lab');
J = applycform(I,cform);
%subplot(3,3,2)
%imshow(J);
K=J(:,:,2);
%subplot(3,3,3)
%imshow(K);
L=graythresh(J(:,:,2));
skin=im2bw(J(:,:,2),L);

  
I1=im2bw(I1);
TP=0;
TN=0;
FP=0;
FN=0;
Accuracy = 1;
Precision = 1;
Recall= 1;
 for y=1:128
    for z=1:128
        if(I1(y,z)==1 && skin(y,z)==1)
            TP=TP+1;
        end
        if(skin(y,z)==1)
            if(I1(y,z)==0)
                FP=FP+1;
            end          
        end
         if(skin(y,z)==0)
            if(I1(y,z)==1)
                FN=FN+1;
            end          
         end
        if(skin(y,z)==0 && I1(y,z)==0)
            TN=TN+1;
                   
        end
    end
 end
 Accuracy =(TP+TN)/(TP+TN+FP+FN)
 Recall=(TP)/(TP+FN)
 Precision=(TP)/(TP+FP)
  B={str,TP,FP,FN,TN,Accuracy,Recall,Precision};
   
    sheet = 1; 
    xlRange= sprintf( 'A%s',num2str(x) );
    xlswrite(Excel_Name,B,sheet,xlRange) 
end
