function [T_init,T_out,img_out,img_denoised] = main(img_in,mu,rho,ds,ss,flag)
% T_init is initial illumination map
% T_out is refined illumination map
% img_out is the enhanced image
% I_denoised is img_out after denoising

% img_in is raw image
% alpha, mu, rho are constant parameters for the solver
% ds is degree of smoothing and ss is spatial smoothing for bilateral filter
% flag kept 1 for displaying outputs

alpha = 0.08;
gamma = 0.8;

[T_out,T_init] = lime(img_in,alpha,mu,rho,gamma);
img_out = im2double(img_in)./T_out;

img_denoised = imbilatfilt(img_out,ds,ss);

if flag==1
    subplot(2,3,1);imshow(img_in);
    subplot(2,3,2);colormap('hot');imagesc(T_init(:,:,1));colorbar;
    subplot(2,3,3);colormap('hot');imagesc(T_out(:,:,1));colorbar;
    subplot(2,3,4);imshow(img_out);
    subplot(2,3,5);imshow(img_denoised);
end

end