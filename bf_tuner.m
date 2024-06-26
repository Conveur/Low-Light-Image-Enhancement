function [img_denoised] = bf_tuner(img_in,mu,rho,ds0,ss0,flag,itr)
%for tuning the parameters of bilateral filter

%img_in is the raw image
%mu and rho are parameters for the solver
%ds0 and ss0 are seed points for degree of smooothness and spatial sigma
%flag controls which parameter is tuned 
%itr is no. of iterations or changes in the ds or ss

%img_denoised contains final enhanced result for all iterations

[m,n,p] = size(img_in);
img_denoised = zeros(m,n,p,itr);

[T_out,T_init] = lime(img_in,0.08,mu,rho,0.8);
img_out = im2double(img_in)./T_out;

ds = ds0;
ss = ss0;

for i = 1:1:itr
    img_denoised(:,:,:,i) = imbilatfilt(img_out,ds,ss);
    if flag==1
        ds = ds*10; % change updation rule as required
    else 
        ss = ss+0.5; % change updation rule as required
    end
    if i <= itr
        subplot(2,3,i); imshow(img_denoised(:,:,:,i));
    end
end

end