% Permet de calculer uh et uexa pour le cas P2
%uh, uex taille 2n + 2
function [uh, uex] = get_uhuex2(h,beta,f0,eps)
n  = round(-1 + 1/h);

lesX = 0:h/2:(n+1)*h;

lesY = uexacte(lesX,f0,beta,eps);
uex = lesY;

A = Matr1DP2(n, eps, beta);    
b = RHS1DP2(n,f0);
%

zeta = A\b; %solution uh, vecteur colonne taille n +1
zeta = cat(1, [0], zeta); %ajout des 0
zeta = cat(1, zeta, [0]);
uh = zeta;

function [rep] = uexacte(x,f,beta,epsilon)
rep = f/beta*(x-(1-exp(beta/epsilon*x))/(1-exp(beta/epsilon)));
end
end