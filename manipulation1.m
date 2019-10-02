% Étudiant  : Patrick Bellerive
% Matricule: ET470765
% Matlab : R2018b
% OS: Windows 10


% Question A.2
% Utilisez votre fonction dans un nouveau script nommé « manipulation1.m » pour 
% compresser le signal pour chacune des Combinaisons de Paramètres (CPi) suivantes :

%Le programme suivant appel la fonction lz77V2 pour les différents paramètres
%de la question A.1

clear all;
close all;

data = [0 0 1 0 1 0 2 1 0 2 1 0 2 1 2 4 0 1 0 1 0 2 1 0 0];

N = 4;
n1 = 2;
result = lz77V2(data, N, n1);
disp(strlength(result));

N = 8;
n1 = 4;
result = lz77V2(data, N, n1);
disp(strlength(result));

N = 16;
n1 = 8;
result = lz77V2(data, N, n1);
disp(strlength(result));

N = 32;
n1 = 16;
result = lz77V2(data, N, n1);
disp(strlength(result));
% 
%Trouver la meilleur combinaison de parametre 
disp("Trouver la meilleur combinaison de parametre :");
%FG dict TC
% bestTc = [0 0 0];
% for i=1:32
%     for j=1:32
%         
%         disp("TailleFG = " + i);
%         disp("TailleDict = " + j);
%         
%         result = lz77V2(data, i, j);
%         compressLength = strlength(result);
%         disp("Longeur compressé = " + compressLength);    
%         newTc = 25 / compressLength;
%         if (newTc > bestTc(3))
%             bestTc(1) = i;
%             bestTc(2) = j;
%             bestTc(3) = newTc;
%         end
%         disp("Taux compression = " + (25/compressLength));
%     end
% end
% % 
% % disp("Meilleur taux ");
% % disp(bestTc);
% 
