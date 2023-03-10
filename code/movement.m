function im=movement(threshold)
% Function MOVEMENT returns if there is a signifivant 
% difference in two consecutive images
% if smaller then absolute value of negative threshold -> When movement stops
% or bigger then positive threshold  -> When movement starts
% An image is graped and returned

    im1=getsmallbwimage();
    while 1
        im2=getsmallbwimage();
        rel=abs(im1-im2);
        if threshold < 0
            if min(min(rel))< -threshold
                im=acquire_image();
                break;
            end
        else
            if max(max(rel)) > threshold
                im=acquire_image();
                break; 
            end
        end

        im1=im2;
    end
    acquire_image();
end

function im_out=getsmallbwimage()
    im=acquire_image();
    imshow(rgb2gray(im));
    im_out=imresize(rgb2gray(im),[4,4]);
end