function [Mk,Dk,Ck,Fk] = MatricesElementaires(K,X1,X2,X3,X,Y,Aire,epsilon,beta,f)
%
% Rôle :
%   Regroupe le calcul des matrcies élémentaires Mk, Dk, Ck et Fk
%
% Entrées :
%   K       : numéro de l'élément du maillage
%   X1      : coordonnées du noeud 1
%   X2      : coordonnées du noeud 2
%   X3      : coordonnées du noeud 3
%   X       : Vecteur définit en 10.14
%   Y       : Vecteur définit en 10.14
%   Aire    : Aire de K
%   epsilon : Terme epsilon     ( epsilon(K) )
%   beta    : Terme convectif   ( beta(K,1) et beta(K,2) )
%   f       : Terme source      ( f(K) )
%
%
% Sorties :
%   Mk  : Matrice de masse
%   Dk  : Matrice de rigidité
%   Ck  : Matrice des termes convectifs
%   Fk  : Terme source
%


% Matrice de masse Mk
Mk = Mass_Elem(Aire);

% Matrice de rigidité Dk
Dk = Diff_Elem(K,X,Y,Aire,epsilon);

% Matrice des termes convectifs Ck
Ck = Conv_Elem(K,X,Y,beta);

% Terme source Fk
Fk = Rhs_Elem(K,Aire,f);


end