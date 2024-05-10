function [output,init_map] = lime(img_in,alpha,mu,rho,gamma)
% obtaining illumination map

% output is three-channel refined illumination map 
% init_map is single-channel initial illumination map

% img_in is raw image
% alpha, mu, rho are constant parameters for the solver
% gamma is parameter for gamma correction

% refining the single-channel illumination map
B_norm = im2double(img_in);
init_map = initial_illumap(B_norm);
[ref_map] = opt_solver(ini_map, alpha, mu, rho); 

abs_ref_map = abs(ref_map);
T_gamma = gamma_correct(abs_ref_map, gamma);

% mapping ref_map to three channels
Topt(:,:,1) = T_gamma;
Topt(:,:,2) = T_gamma;
Topt(:,:,3) = T_gamma;
output = Topt;

end