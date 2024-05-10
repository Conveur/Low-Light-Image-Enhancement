function [out] = gamma_correct(a,gamma)
% applying gamma correction

% a is input image
% gamma is the parameter for gamma correction

% out is the resultant image

out = a.^gamma;

end