function [Mk] = Mass_Elem(Aire)
%
% Rôle :
%   Calcul de la matrice de masse élémentaire Mk
%
% Entrées :
%   Aire    : Aire de K
%
% Sorties :
%   Mk  : Matrice élémentaire de masse
%

Mk = Aire/12*[2 1 1 ; 1 2 1 ; 1 1 2];

end