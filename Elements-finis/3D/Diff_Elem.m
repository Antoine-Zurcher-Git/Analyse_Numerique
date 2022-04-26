function [Dk] = Diff_Elem(K,X,Y,Aire,epsilon)
%
% Rôle :
%   Calcul de la matrice de rigidité élémentaire Dk
%
% Entrées :
%   K       : numéro de l'élément du maillage
%   X       : Vecteur définit en 10.14
%   Y       : Vecteur définit en 10.14
%   Aire    : Aire de K
%   epsilon : Terme epsilon     ( epsilon(K) )
%
%
% Sorties :
%   Dk  : Matrice élémentaire de rigidité
%

Dk = epsilon(K)/(4*Aire)*( Y*transpose(Y)+X*transpose(X));

end