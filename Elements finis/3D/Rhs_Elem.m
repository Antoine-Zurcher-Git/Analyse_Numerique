function [Fk] = Rhs_Elem(K,Aire,f)
%
% Rôle :
%   Calcul de la matrice élémentaire Fk
%
% Entrées :
%   K       : numéro de l'élément du maillage
%   Aire    : Aire de K
%
%
% Sorties :
%   Fk  : matrice élémentaire Fk
%

Fk = Aire/3*f(K)*[1 1 1];

end