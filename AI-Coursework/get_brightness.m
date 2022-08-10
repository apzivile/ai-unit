function avgBrightness = get_brightness(x)
         x = im2gray(x);
         %x = my_im2gray(x);
         totalBrightnessValues = x;
         arrayBrightness = totalBrightnessValues';
         arrayBrightness = arrayBrightness(:)';

         sumofbrightness = sum(arrayBrightness');
         totalPixels = numel(x);
         avgBrightness = sumofbrightness / totalPixels;
end

% get_brightness function is used for the second feature. It converts the image
% to grayscale; transposes the image matrix to convert it to a 1d array
% in order to sum up all the brightness values; counts the total number of pixels
% in the image by using numel function and find average brightness by dividing summed up brightness
% values with the total amount of pixels
