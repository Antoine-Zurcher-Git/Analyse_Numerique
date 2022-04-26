function [Uexa] = solex(coord,Nddl)
%
% Rôle :
%   Détermine la solution exacte au problème
%
% Entrées :
%   coord   : tableau des coordonnees des noeuds
%   Nddl    : Numérotation des DDL
%
% Sorties :
%   N   : Solution exacte au problème
%


Nnode = size(coord,1);
Uexa = zeros(1,Nnode);
for n=1:Nnode
    if Nddl(n) >= 0
        x = coord(n,1);
        y = coord(n,2);
        
        Uexa(n) = sin(pi*x)*sin(pi*y);
    end
end


end