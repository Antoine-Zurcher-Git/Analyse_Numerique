function [N,X1,X2,X3,X,Y,Aire] = partie_D(K,connec,coord)
%
% Rôle :
%   Détermine les caractéristiques de l'élément K
%
% Entrées :
%   K : numéro de l'élément du maillage
%   connec : tableau de connectivite des elements
%   coord  : tableau des coordonnees des noeuds
%
% Sorties :
%   N   : noeuds de K
%   X1  : coordonnées du noeud 1
%   X2  : coordonnées du noeud 2
%   X3  : coordonnées du noeud 3
%   X   : Vecteur définit en 10.14
%   Y   : Vecteur définit en 10.14
%   Aire: Aire de K
%

% Détermination des noeuds de l'élément K
N = [connec(K,1),connec(K,2),connec(K,3)];

% Coordonnées des noeuds
X1 = coord(N(1),:);
X2 = coord(N(2),:);
X3 = coord(N(3),:);

% Calcul de X et Y dépendant de K
X = ([X3(1)-X2(1),X1(1)-X3(1),X2(1)-X1(1)])';
Y = ([X2(2)-X3(2),X3(2)-X1(2),X1(2)-X2(2)])';

% Calcul de l'aire de K
Aire = 0.5*(X(3)*Y(2)-X(2)*Y(3));


end