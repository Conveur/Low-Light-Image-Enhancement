function [T_opt] = opt_solver(T_init,alpha,mu0,rho)
% solver for the optimization problem

% T_init is the initial illumination map
% alpha, mu0, rho are constant parameters for the solver
% T_opt is the refined illumination map

[m,n] = size(T_init);
k0 = 50; % no. of iterations
Z = zeros(2*m,n); G=Z; k=0; mu=mu0; %initialization

% comment out the unwanted weight matrix strategy
% W=Z+1; % first strategy
W = weight_matrix(T_init,5); % second strategy

while k < k0
    U = Z/mu;
    A = alpha*W/mu; 
    T = T_update(T_init,mu,G,U);
    T_gradient = gradient(T);
    G = shrinkage(A,(delT+U));
    B = T_gradient-G;
    Z = mu*(B+U);
    mu = mu*rho;
    k = k+1;
end

Topt = T;

end