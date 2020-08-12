%SKINBW_HSI Summary of this function goes here
%   Detailed explanation goes here
a = imread('E:\Semester VII\Final Year Project\iCub_jpg\00001323.jpg');
HSV = rgb2hsv(a);
H = HSV(:,:,1);
S = HSV(:,:,2);
V = HSV(:,:,3);

%figure(1),imshow(H,'InitialMagnification',40),title('Hue');
%figure(2),imshow(S,'InitialMagnification',40),title('Saturation');
%figure(3),imshow(V,'InitialMagnification',40),title('Illuminance');

skin_H= H<=35/255.0 | H>=220/255.0;
skin_S= S>=20/255.0 & S<=220/255.0;

%figure(4),imshow(skin_H,'InitialMagnification',40),title('skin_mask_Hue');
%figure(5),imshow(skin_S,'InitialMagnification',40),title('skin_mask_Sat');
out = skin_H&skin_S;

imshow(out);


