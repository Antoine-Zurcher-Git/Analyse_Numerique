%entrées
function A = Matr1DP1(n,eps,beta0)
h = 1/(n+1);
%calcul de D et C
C = zeros(n);
D = 2*eye(n);
for i = 1:n-1
    D(i,i+1) = -1;
    D(i+1,i) = -1;
    C(i,i+1) = 1;
    C(i+1,i) = -1;
end

A = eps/h * D + beta0/2  * C;
end