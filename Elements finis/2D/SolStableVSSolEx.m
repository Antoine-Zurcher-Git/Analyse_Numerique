%Comparaison solution stable et solution exacte
clear all;

%paramètres
h = 1/128; %1/32, 1/64,
beta = 1;
f0 = 1;
eps = 0.01; %1

n = round(-1 + 1/h);

%Créé Asupg :
run Matr1DP1SUPG.m
%A = Matr1DP1(n, eps, beta);   
%Créé bsupg :
run RHS1DP1SUPG.m
%b = RHS1DP1(n,f0);
%

zeta = Asupg\bsupg; %solution uh, vecteur colonne taille n +1
zeta = cat(1, [0], zeta); %ajout des 0
zeta = cat(1, zeta, [0]);

Xlist = 0 : h : (n+1)*h; % taille n+2

uh = zeta;



%
if 1 %pour le plot
figure;
hold on;
plot(Xlist, zeta)
uex = DisplaySolEx(n,f0,beta,eps);%plot l'exacte
legend("uhSUPG", "uexact")
xlabel("x")
ylabel("u")

hold off;
end

