Excel_Name = "Confusion_Matrix.xlsx";
D={'image','TP','FP','FN','TN'};
xlswrite(Excel_Name,D)

x1=[1,2,3,4,5];
x2=[5,6,7,8,9];
for ii=1:5 
    X1=x1(1,ii);
    X2=x2(1,ii); 
    filename = 'Results.xlsx'; 
    Variables= {X1,X2};
    sheet = 1; 
    xlRange= sprintf( 'A%s',num2str(ii) );
    xlswrite(filename,Variables,sheet,xlRange) 
end 

