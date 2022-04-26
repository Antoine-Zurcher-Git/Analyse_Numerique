function [Ck] = Conv_Elem(K,X,Y,beta)
%
% Rôle :
%   Calcul de la matrice de convolution élémentaire Ck
%
% Entrées :
%   K       : numéro de l'élément du maillage
%   X1      : coordonnées du noeud 1
%   X2      : coordonnées du noeud 2
%   X3      : coordonnées du noeud 3
%   beta    : Terme convectif   ( beta(K,1) et beta(K,2) )
%
% Sorties :
%   Ck  : Matrice élémentaire des termes convectifs
%

Ck = beta(K,1)/6.*[Y Y Y]' + beta(K,2)/6.*[X X X]';

end