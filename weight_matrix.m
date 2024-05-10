function [W] = weight_matrix(T_init,kernel_size)
% second strategy of the weight matrix

% T_init is the initial illumination map
% kernel_size is the size of the Gaussian kernel
% W is the required weight matrix

[m,n] = size(T_init);
p = m*n;

% obtaining gradient of T_init
T_init_gradient = gradient(T_init);
dtvec = reshape(T_init_gradient,[2*p,1]);

% separating parts used for W_x and W_y
dtx = dtvec(1:p);
dty = dtvec(p+1:2*p);

% obtaining W_x and W_y
w_gauss = fspecial('gaussian', [kernel_size,1], 2);
convl_x = conv(dtx, w_gauss, 'same');
convl_y = conv(dty, w_gauss, 'same');
W_x = 1./(abs(convl_x)+0.0001);
W_y = 1./(abs(convl_y)+0.0001);

% concatenating W_x and W_y to get W
W_vec = vertcat(W_x, W_y);
W = reshape (W_vec, [2*m,n]);

end