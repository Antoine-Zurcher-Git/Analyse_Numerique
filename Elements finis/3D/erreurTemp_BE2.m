clear

% Domaine de calcul Ω
x0 = -1; y0 = -1; x1 = 1; y1 = 1;

% Parametres de l'équation
beta1 = 1;
beta2 = 1;
eps = 1;

% Parametre résolution
Isol = 1;       % 1 si il existe une solution exacte dans solex.m, 0 sinon

% Discretisation spatiale
Nx = 10; Ny = 10;

lesN = linspace(1,3,20);
nN = size(lesN,2);
suiteErr = zeros(nN,1);

for k=1:nN

    
    lesN(k) = 10^(-lesN(k));

    suiteErr(k) = main(x0,y0,x1,y1,Nx,Ny,eps,beta1,beta2,Isol,lesN(k));

    a = ("Réalisation "+k+"/"+nN)
end

figure

loglog(lesN,suiteErr)
xlabel("Discretisation temporelle");
ylabel("Erreur")
title("\theta = 1/2")



