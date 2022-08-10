function im_g = my_im2gray(im)
         im_g = [];
         %getting amount of channels, rgb is a 3D array, so it has 3 channels, while gray image is
         %2D array - 2 channels
         [rows, columns, numberOfColorChannels] = size(im);

         if numberOfColorChannels == 3
             % using standard NTSC conversion formula to modify image
             % pixels (im2gray weights)
             im_g = 0.2989 * im(:,:,1) + 0.5870 * im(:,:,2) + 0.1140 * im(:,:,3);
         else
             %if number of channels is anything but 2, it is likely already
             %a grayscale image
             im_g = im;
         end
end
%issue b - 2