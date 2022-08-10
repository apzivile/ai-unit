function hogs = get_hogs(x)
         x = im2gray(x);
         [featureVector,~] = extractHOGFeatures(x,'CellSize',[16 16]);
         hogs = featureVector;
end

% get_hogs is used for the 4th feature