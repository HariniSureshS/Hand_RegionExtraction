% srcFiles = dir('E:\Semester VII\Final Year Project\iCub_Evaluation\*.ppm'); 
% for i = 1 : length(srcFiles)
%     filename = strcat('E:\Semester VII\Final Year Project\iCub_Evaluation\',srcFiles(i).name);
%     filename1 = strcat('E:\Semester VII\',srcFiles(i).name);
%     newStr = extractBetween(filename,"iCub_Evaluation\",".ppm");
%     str = strcat(char(newStr),'.jpg');
%     I = imread(filename);
%      imwrite(I,str);
% end
% 

K = imread('00000845.jpg');