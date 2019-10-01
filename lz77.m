% Matricule: ET470765
% Matlab : R2018b
% OS: Windows 10

% Question A.1
% Programmer en MATLAB une fonction nommée lz77 permettant de compresser le signal
% de l’exemple ci-dessus (0010102102102124010102100) en utilisant une fenêtre glissante
% de taille N uint8 et un dictionnaire de taille TailleDict uint8. Notez qu’il faut utiliser le type uint8
% pour représenter les symboles du signal à coder. Chaque élément du triplet (position,
% longueur, suivant) sera également représenté par le type uint8.

% Fonction lz77  Compresse le paramètre signal avec l'algorithm lz77
% @params array signal Matrice de données à compresser
% @params uint8 TailleFG grandeur de la fenêtre 
% @params uint8 TailleDict grandeur de la fenêtre de recherche(lookahead)
% @return string retourne une chaine de caractère qui représente le
% contenu original compressé 
function code = lz77(signal, TailleFG, TailleDict)
    code = "";
    strCode = "";
    
    [l, c] = size(uint8(signal));
    dictionary = zeros(1, TailleDict);
    workingData =  horzcat(dictionary, signal);
    [wL, wC] = size(workingData);
    
    i = (TailleDict+1);
    while i <= wC    
        windowEndPointer = i + TailleFG;       
        if (windowEndPointer > wC)
            windowEndPointer = wC;
        end
        
        [matchPosition, matchLength] = getLonguestStringMatch(workingData, i, i-TailleDict, windowEndPointer);

        nextChar = "";
        nextCharPosition = i + matchLength;
        if (nextCharPosition <= wC)
            nextChar = workingData(l, nextCharPosition);
        end
        %conversion en string pour l'affichage
        match = "(0,0," + nextChar + ")";

        if (matchPosition > 0)  % aucun match nous prenons le caractere comme le caractere du triplet
            %Nous avons un match, nous ajoutons le caracter suivant     
            match = "(" + matchPosition + "," + matchLength + "," + nextChar + ")";
        end
        i = i + matchLength + 1;
        strCode = strCode + match;
        code = code + char(matchPosition) + char(matchLength) + char(nextChar);
    end    
    disp(strCode);
end

% Fonction getLonguestStringMatch faire la recherche du plan grand match
% dans la fenêtre de recherche pour la fenêtre glissante
% @params array data les données dans lequel faire la recherche
% @params uint8 position la position courante dans le tableau de données.
% Ce pointeur correspond au début de la fenêtre glissante. 
% @params bufferEnd correspond à l'index de fin du lookahead
% @params windowEndPointer correspond à l'index de fin de la fenêtre
% glissante. 
% @return [bestMatchPosition, bestMatchLength] Retourne la position et la
% longeur du match . Si aucune correspondance on retourne une position de 0
% et une longeur de 0.  Nous savons que 0 n'est pas valide comme position
% puisque Matlab début ses index à 1.
function [bestMatchPosition, bestMatchLength] = getLonguestStringMatch(data, position, bufferEnd, windowEndPointer)
    bestMatchPosition = uint8(0);
    bestMatchLength = uint8(0);
    %TRouver le meilleur match 
    bufferStart = position -1;
    for i = bufferStart:-1:bufferEnd        
        windowSize = (windowEndPointer-position);
        for j = 0:(windowSize)
            dictionaryvalue = data(1,i:i+j);
            windowValue = data(1,position:position+j);
            if (isequal(dictionaryvalue, windowValue))
                if ((j+1) > bestMatchLength)
                    bestMatchPosition = i;
                    bestMatchLength = j + 1;
                end
            else
                break;
            end
        end
    end
end
