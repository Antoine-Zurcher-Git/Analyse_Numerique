function [f] = def_f(coord,connec,Nelem,epsilonCst,betaCst)
%
% Rôle :
%   définit la fonction f pour chaque élément du maillage
%
% Entrées :
%   coord       : tableau des coordonnees des noeuds
%   connec      : tableau de connectivite des elements
%   Nelem       : Nombre d'éléments
%   epsilonCst  : Parametre de l'equation ε
%   betaCst     : Parametre de l'equation β
%
% Sortie :
%   f   : fonction f définit pour chaque élément du maillage
%

f = zeros(Nelem,1);

for K=1:Nelem
    
    N = [connec(K,1),connec(K,2),connec(K,3)];
    % Coordonnées des noeuds
    X1 = coord(N(1),:);
    X2 = coord(N(2),:);
    X3 = coord(N(3),:);

    x = (X1(1)+X2(1)+X3(1))/3.0;
    y = (X1(2)+X2(2)+X3(2))/3.0;
    f(K) = (2*epsilonCst*pi*pi)*sin(pi*x)*sin(pi*y)+betaCst(1)*pi*cos(pi*x)*sin(pi*y)+betaCst(2)*pi*sin(pi*x)*cos(pi*y);
end

end