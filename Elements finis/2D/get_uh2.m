% Permet de calculer uh pour le cas P2
%uh, uex taille 2n + 2
function [uh] = get_uh2(h,beta,f0,eps)
n  = round(-1 + 1/h);

A = Matr1DP2(n, eps, beta);    
b = RHS1DP2(n,f0);
%

zeta = A\b; %solution uh, vecteur colonne taille n +1
zeta = cat(1, [0], zeta); %ajout des 0
zeta = cat(1, zeta, [0]);
uh = zeta;
end