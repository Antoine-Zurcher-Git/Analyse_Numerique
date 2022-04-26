clear

% Domaine de calcul Ω
x0 = -1; y0 = -1; x1 = 1; y1 = 1;

% Parametres de l'équation
beta1 = 1;
beta2 = 1;
eps = 1;

% Parametre résolution
Isol = 1;       % 1 si il existe une solution exacte dans solex.m, 0 sinon


lesN = linspace(5,17,12);
nN = size(lesN,2);
suiteErr = zeros(nN,1);

for k=1:nN

    % Discretisation spatiale
    Nx = round(lesN(k)); Ny = round(lesN(k));
    lesN(k) = round(lesN(k));

    suiteErr(k) = main(x0,y0,x1,y1,Nx,Ny,eps,beta1,beta2,Isol,0.001);

    a = ("Réalisation "+k+"/"+nN)
end

figure

loglog(lesN,suiteErr)
xlabel("Discretisation spatiale");
ylabel("Erreur")
title("\theta = 1")



