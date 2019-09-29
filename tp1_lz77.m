% A.1 Programmer en MATLAB une fonction nomm�e lz77 permettant de compresser le signal
% de l�exemple ci-dessus (0010102102102124010102100) en utilisant une fen�tre glissante
% de taille N uint8 et un dictionnaire de taille n1 uint8. Notez qu�il faut utiliser le type uint8
% pour repr�senter les symboles du signal � coder. Chaque �l�ment du triplet (position,
% longueur, suivant) sera �galement repr�sent� par le type uint8.
%
%


function result = lz77(originalData, N, n1)

    result = "";
    [l, c] = size(originalData);
    dictionary = zeros(1, n1);
    workingData =  horzcat(dictionary, originalData);
    [wL, wC] = size(workingData);
    
    i = (n1+1);
    while i <= wC    
        windowEndPointer = i + N;       
        if (windowEndPointer > wC)
            windowEndPointer = wC;
        end
        
        [matchPosition, matchLength] = getLonguestStringMatch(workingData, i, i-n1, windowEndPointer);

        nextChar = "";
        nextCharPosition = i + matchLength;
        if (nextCharPosition <= wC)
            nextChar = workingData(l, nextCharPosition);
        end
        match = "(0,0," + nextChar + ")";

        if (matchPosition > 0)  % aucun match nous prenons le caractere comme le caractere du triplet
            %Nous avons un match, nous ajoutons le caracter suivant     
            match = "(" + matchPosition + "," + matchLength + "," + nextChar + ")";
        end
        i = i + matchLength + 1;
        result = result + match;
    end
    disp(result);
end

function [bestMatchPosition, bestMatchLength] = getLonguestStringMatch(data, position, bufferEnd, windowEndPointer)
    bestMatchPosition = 0;
    bestMatchLength = 0;
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
