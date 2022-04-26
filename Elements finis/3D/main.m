function [errMax] = main(x0,y0,x1,y1,Nx,Ny,eps,beta1,beta2,Isol,dt)
%
% Entrées :
%   x0, y0, x1, y1      : Domaine de calcul Ω
%   Nx, Ny              : Discretisation spatiale
%   eps, beta1, beta2   : Parametres de l'équation
%   Isol                : Parametre résolution
%


% Parametres de l'équation
betaCst = [beta1 beta2]; epsilonCst = eps;

% Discretisation temporelle
%dt = 0.1;

% Parametre integration
theta = 0.5;

% Parametre résolution
Maxitert = 2000; % Nombre d'itération réalisé


% ==================
% === Algorithme ===
% ==================

% Maillage du domaine Ω
[coord, connec, codnofr] = meshP1(x0,y0,x1,y1,Nx,Ny);

% Nombre d'éléments, de noeuds = de points
Npt = size(codnofr,2);
Nelem = size(connec,1);
Nnode = size(coord,1);

% Initialisation des parametres et conditions
f = def_f(coord,connec,Nelem,epsilonCst,betaCst);
beta = betaCst.*ones(Nelem,2);
epsilon = epsilonCst.*ones(Nelem,1);
Val = zeros(Nnode);

% Numérotation des DDL
[Nddl, Neq] = numddl(codnofr, Npt);

% Visualisation du maillage
trimesh(connec,coord(:,1),coord(:,2),zeros(Npt,1));
for ii=1:Npt
    text(coord(ii,1),coord(ii,2),string(Nddl(ii)))
end
view(0,90);

% Initialisation des tableaux globaux (M,D,C et F)
M = sparse(Neq,Neq);
D = sparse(Neq,Neq);
C = sparse(Neq,Neq);
F = sparse(Neq,1);

UD = ones(Neq,1);

% Assemblage (M, D, C et F)
for K=1:Nelem
    [N,X1,X2,X3,X,Y,Aire] = partie_D(K,connec,coord);
    [Mk,Dk,Ck,Fk] = MatricesElementaires(K,X1,X2,X3,X,Y,Aire,epsilon,beta,f);
    for k=1:3
        Nk = connec(K,k);
        i = Nddl(Nk);
        if i > 0
            F(i) = F(i)+Fk(k);
            for l=1:3
                Nl = connec(K,l);
                j = Nddl(Nl);
                if j > 0
                    M(i,j) = M(i,j) + Mk(k,l);
                    D(i,j) = D(i,j) + Dk(k,l);
                    C(i,j) = C(i,j) + Ck(k,l);
                else
                    %Conditions aux limites de type Dirichlet non homogène
                    %F(i) = F(i) - dt*theta*(Dk(k,l)+Ck(k,l))*UD(-j);
                end
            end
        end
    end
end

% Calculer la matrice globale B = M + Dt*θ*A, A = D+C
%max(abs(eig(D)))
B = (M+theta*dt*(D+C));

% Initialisation de la solution
Up = U0(coord,Neq,Nddl);

% Itération de la solution
itert = 0;
Tps = 0;
while itert <= Maxitert

    Tps = dt*itert;

    % Mise à jour du second membre
    b = ((M-dt*(1-theta)*(D+C))*Up+dt*F);
    
    % Résolution 
    U = (B\b);
    
    % Mise à jour de la solution
    Up = U;
    itert = itert + 1;
    
    
end

% Affectation des inconnues aux noeuds
Uh = sol(Nnode, Nddl, Up, Val);

% Calcul de la solution exacte (si disponible)
if Isol == 1
    Uexa = solex(coord,Nddl);
end

% Calcul de l'erreur (si solution exacte disponible)
if Isol == 1
    err = Uexa-Uh;
    norminf = norm(err,'inf');
    errMax = max(err)

    % Visualisation de la solution
    postproc(connec,coord,Uh,Uexa,err);

end


if Isol == 0
    trisurf(connec,coord(:,1),coord(:,2),Uh')
    title('Solution approchee')
end

end
