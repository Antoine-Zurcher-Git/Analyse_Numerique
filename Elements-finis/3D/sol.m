function [U] = sol(Npt, Nddl, Uh, Val)
%======================================================
% Remplissage de la solution : Prise en compte des CDLs 
%
%======================================================
%

for No=1:Npt
    i = Nddl(No);
    if( i > 0 )
        U(No) = Uh(i);
    elseif ( i < 0 )
        U(No) = Val(-i);
    end
end

end
