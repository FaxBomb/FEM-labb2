x1 = 2; x2 = 8; n = 4; L = (x2 - x1)/(n-1);
x = linspace(x1, x2, n);

A = 10; k = 5; Q = 100;

% fL = Q*L*ones(n, 1); fL(1) = fL(1)/2; fL(end) = fL(1);
% 
% d1 = k * A * 2 / L * ones(n, 1); d1(1) = d1(1)/2; d1(end) = d1(1);
% d2 = -k * A / L *ones(n-1, 1);
% K = diag(d1) + diag(d2, -1) + diag(d2, 1);

Ke = spring1e(k* A / L);

Edof = zeros(n-1, 3);

K = zeros(n);

for i = 1:n-1
   Edof(i, :) = [i i i+1];
end

K = assem(Edof, K, Ke);
fL = Q*L*ones(n, 1); fL(1) = fL(1)/2; fL(end) = fL(1);
fB = zeros(n,1); fB(end) = -15 * A;

bc = [1 0];

[T, F] = solveq(K,fL-fB,bc);
