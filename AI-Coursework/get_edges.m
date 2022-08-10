function edges = get_edges(x)
         %first part is to get the image and turn it to grayscale to
         %simplify image and make it from 3D array to a 2D array
         x = im2gray(x);
         %then computing local gradients on x and y
         [Gx, Gy] = imgradientxy(x,'prewitt');
         threshold = 45;
         magnitudeX = abs(Gx);
         magnitudeY = abs(Gy);
         %creating two new arrays to add thresholding of the magnitudes
         for J = 1 : size(magnitudeX,1)
            for K = 1 : size(magnitudeX,2)
                if magnitudeX(J,K) >= threshold
                    magnitudeXArr(J,K) = 1;
                else
                    magnitudeXArr(J,K) = 0;
                end
            end
        end
        for J = 1 : size(magnitudeY,1)
            for K = 1 : size(magnitudeY,2)
                if magnitudeY(J,K) >= threshold
                    magnitudeYArr(J,K) = 1;
                else
                    magnitudeYArr(J,K) = 0;
                end
            end
        end
        %generate estimates of the fraction of pixels containing vertical and horizontal edges respectively
        numberOf1sX = 0;
        for J = 1 : size(magnitudeXArr,1)
            for K = 1 : size(magnitudeXArr,2)
                if magnitudeXArr(J,K) == 1
                    numberOf1sX = numberOf1sX + 1;
                end
            end
        end
        numberOfElementsX = numel(magnitudeXArr);
        numberX = numberOf1sX / numberOfElementsX;

        numberOf1sY = 0;
        for J = 1 : size(magnitudeYArr,1)
            for K = 1 : size(magnitudeYArr,2)
                if magnitudeYArr(J,K) == 1
                    numberOf1sY = numberOf1sY + 1;
                end
            end
        end
        numberOfElementsY = numel(magnitudeYArr);
        numberY = numberOf1sY / numberOfElementsY;
        %adding estimates to an array and returning
        edges = [numberX, numberY];
end

% get_edges function is used for the 3rd feature