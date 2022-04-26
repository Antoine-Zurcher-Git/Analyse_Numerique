% Permet de calculer uh et uexa pour le cas P1
function [uh, uex] = get_uhuex1(h,beta,f0,eps)
n = round(-1 + 1/h);

lesX = 0:h:1;
lesY = uexacte(lesX,f0,beta,eps);
uex = lesY;

A = Matr1DP1(n, eps, beta);    
b = RHS1DP1(n,f0);
%

zeta = A\b; %solution uh, vecteur colonne taille n +1
zeta = cat(1, [0], zeta); %ajout des 0
zeta = cat(1, zeta, [0]);
uh = zeta;

function [rep] = uexacte(x,f,beta,epsilon)
rep = f/beta*(x-(1-exp(beta/epsilon*x))/(1-exp(beta/epsilon)));
end

end