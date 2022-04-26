% Permet de calculer uh pour le cas P1
function [uh] = get_uh1(h,beta,f0,eps)
n = round(-1 + 1/h);


A = Matr1DP1(n, eps, beta);    
b = RHS1DP1(n,f0);
%

zeta = A\b; %solution uh, vecteur colonne taille n +1
zeta = cat(1, [0], zeta); %ajout des 0
zeta = cat(1, zeta, [0]);
uh = zeta;

end