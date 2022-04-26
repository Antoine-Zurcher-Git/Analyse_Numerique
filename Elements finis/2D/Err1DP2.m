%paramètres entrée
beta = 1;
f0 = 1;
eps = 1; %1
%
Nlist = [16, 32, 64, 128];
Hlist = 1./Nlist;
Lnhlist = log(Hlist);

Errlistinf = []; %vecteur ligne
for h = Hlist
    [uh, uex] = get_uhuex2(h,beta,f0,eps);
    
    Err = uh - transpose(uex);
    errinf = max(abs(Err));
    Errlistinf(end+1) = errinf;
end

%plot
figure;
Logerrlistinf = log(Errlistinf);
plot(Lnhlist, Logerrlistinf)
xlabel("log(h)")
ylabel("log err\infty")
%coef directeur = alpha
coef = (Logerrlistinf(1) - Logerrlistinf(end))/(Lnhlist(1) - Lnhlist(end))