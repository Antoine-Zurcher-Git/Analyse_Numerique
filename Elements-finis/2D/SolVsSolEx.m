%paramètres
h = 1/16; %1/32, 1/64,
beta = 1;
f0 = 1;
eps = 0.1; %1

n = round(-1 + 1/h);

A = Matr1DP1(n, eps, beta);    
b = RHS1DP1(n,f0);
%

zeta = A\b; %solution uh, vecteur colonne taille n +1
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
legend("uh", "uexact")
xlabel("x")
ylabel("u")

hold off;
end

