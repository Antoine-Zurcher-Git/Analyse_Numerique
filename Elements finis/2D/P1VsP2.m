

h = 1/128; %1/32, 1/64,
beta = 1;
f0 = 1;
eps = 0.001; %1
n = round(-1 + 1/h);

A = Matr1DP2(n, eps, beta);    
b = RHS1DP2(n,f0);
%

zeta = A\b; %solution uh, vecteur colonne taille n +1
zeta = cat(1, [0], zeta); %ajout des 0
zeta = cat(1, zeta, [0]);

Xlist = 0 : h : (n+1)*h; % taille n+2

uh2 = get_uh2(h,beta,f0,eps);
uh1 = get_uh1(h,beta,f0,eps);


%
if 1 %pour le plot
figure;
hold on;
plot( (0:h:1)', uh1)
plot( (0:(h/2):1)' , uh2)
%uex = DisplaySolEx(n,f0,beta,eps);%plot l'exacte
legend("uh2", "uexact1")
legend('Location','northwest')
xlabel("x")
ylabel("u")
title("Diffusion dominante, h=1/128")

hold off;
end