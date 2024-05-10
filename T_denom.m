function [Td] = T_denom(m,n,mu)
% gives denominator of updation equation for T sub problem

% [m,n] is the size of extended dx and dy
% mu is a parameter for the solver
% Td is the required denominator

dx_ext = zeros(m,n);
dy_ext = zeros(m,n);

dx_ext(2,2) = -1;
dx_ext(2,3) = 1;
dy_ext(2,2) = -1;
dy_ext(3,2) = 1;

dxf = fftshift(fft2(dx_ext));
dxc = dxf.'';
dx_mod = dxc.*dxf;

dyf = fftshift(fft2(dy_ext));
dyc = dyf.'';
dy_mod = dyc.*dyf;

Td = 2+mu*(dx_mod+dy_mod);

end