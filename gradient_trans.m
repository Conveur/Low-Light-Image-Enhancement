function [G_gradient] = gradient_trans(G)
% multiplying D transpose with G

% G is input matrix

[p,n] = size(G); % size of G is 2M times N
m = floor(p/2);

% vectorize G, take half elements for horizontal and half for vertical gradient
g = reshape(G,[p*n,1]);
Gx = reshape(g(1:m*n),[m,n]);
Gy = reshape(g(m*n+1:p*n),[m,n]);

% obtaining Dx and Dy for calculating the gradients
Dyi = D_matrix(m);
Dy = -Dyi; %size MxM
Dxi = D_matrix(n);
Dx = Dxi(1:n,1:n);
Dx(1:n,1) = Dx(1:n,1)+Dxi(1:n,n+1); %size NxN+1

% making Gy as size NxN+1
altGy = zeros(m+1,n);
altGy(2:m+1,1:n) = Gy;
altGy(1,2:n) = Gy(m,1:n-1);
altGy(1,1) = Gy(m,n);

% calculating the gradients 
gradient_Gy = Dy*altGy;
gradient_Gx = Gx*Dx;
G_gradient = gradient_Gx+gradient_Gy;

end