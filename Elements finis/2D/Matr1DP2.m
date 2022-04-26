

function A2 = Matr1DP2(n,eps,beta0)
h = 1/(n+1);
%calcul de D et C
C2 = zeros(2*n+1);
D2 = zeros(2*n+1);

for i = 1:2*n+1
    D2(i,i) = 14+2*mod(i,2);
end

for i = 1:2*n
    D2(i,i+1) = -8;
    D2(i+1,i) = -8;
    C2(i,i+1) = 2;
    C2(i+1,i) = -2;
end

for i=1:2*n-1
    D2(i,i+2) = 1-mod(i,2);
    D2(i+2,i) = 1-mod(i,2);
    C2(i,i+2) = -0.5*(1-mod(i,2));
    C2(i+2,i) = 0.5*(1-mod(i,2));
end
A2 = eps/(3*h) * D2 + beta0/3  * C2;
end