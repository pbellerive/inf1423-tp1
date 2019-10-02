% Étudiant  : Patrick Bellerive
% Matricule: ET470765
% Matlab : R2018b
% OS: Windows 10

clear all;
close all;

img = imread("lena.gif");
imgSize = size(img); 
imgLength = imgSize(1) * imgSize(2);
disp(imgSize);
disp(imgLength);

N = 4;
n1 = 2;
result = lz77V2(img, N, n1);
disp(strlength(result));
disp("TC=" + (imgLength / strlength(result)));

N = 8;
n1 = 4;
result = lz77V2(img, N, n1);
resultLength = strlength(result);
disp(resultLength);
disp("TC: " + (imgLength / resultLength));
disp("************************")


N = 16;
n1 = 8;
result = lz77V2(img, N, n1);
resultLength = strlength(result);
disp(resultLength);
disp("TC: " + (imgLength / resultLength));
disp("************************")

N = 32;
n1 = 16;
result = lz77V2(img, N, n1);
resultLength = strlength(result);
disp(resultLength);
disp("TC: " + (imgLength / resultLength));
disp("************************")

N = uint8(64);
n1 = uint8(32);
result = lz77V2(img, N, n1);
resultLength = strlength(result);
disp(resultLength);
disp("TC: " + (imgLength / resultLength));
disp("************************")

N = 128;
n1 = 64;
result = lz77V2(img, N, n1);
resultLength = strlength(result);
disp(resultLength);
disp("TC: " + (imgLength / resultLength));
disp("************************")

N = 128;
n1 = 127;
result = lz77V2(img, N, n1);
resultLength = strlength(result);
disp(resultLength);
disp("TC: " + (imgLength / resultLength));
disp("************************")
