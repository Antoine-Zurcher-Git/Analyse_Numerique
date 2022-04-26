%Crée la matrice A_supg

%entrées
%n = 5;
%h = 0.1;
%epsilon = 0.1;
%beta0 = 0.4;

%determination de alpha
gamma = beta*h/eps;
if gamma<6
    alpha = gamma/12 * h/beta;
else
    alpha = 0.5 * h/beta;
end

%création matrice
D = zeros(n);
C1 = zeros(n);
C2 = zeros(n);
%diagonale
for i = 1:n
    D(i,i) = 2;
    C1(i,i) = 2;
    C2(i,i) = 0;
end
%diag sup et inf
for i = 1:n-1
    D(i,i+1) = -1;
    D(i+1,i) = -1;
    C1(i,i+1) = -1;
    C1(i+1,i) = -1; 

    C2(i,i+1) = 1;
    C2(i+1,i) = -1;
end
%assemblage
Asupg = (eps/h) * D + (alpha * beta^2/h) *C1 + (beta/2) * C2;