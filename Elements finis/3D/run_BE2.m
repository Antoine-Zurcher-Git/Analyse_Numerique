clear

% Domaine de calcul Ω
x0 = -1; y0 = -1; x1 = 1; y1 = 1;

% Discretisation spatiale
Nx = 50; Ny = 50;

% Parametres de l'équation
beta1 = 0;
beta2 = 0;
eps = 0.001;

% Parametre résolution
Isol = 1;       % 1 si il existe une solution exacte dans solex.m, 0 sinon

main(x0,y0,x1,y1,Nx,Ny,eps,beta1,beta2,Isol,0.1)



