beta = 1;
f0 = 1;
eps = 0.1; %1

Nlist = 15:16:128;% liste des n à plot
Hlist = 1./Nlist; %transformation en h
Lnhlist = log(Hlist); 

Errlistinf = []; %vecteur ligne des erreurs infinie
for h = Hlist
    [uh, uex] = get_uhuex1(h,beta,f0,eps);
    
    Err = uh - transpose(uex);
    errinf = max(abs(Err));
    Errlistinf(end+1) = errinf;
end

figure;
Logerrlistinf = log(Errlistinf);
plot(Lnhlist, Logerrlistinf)
xlabel("log(h)")
ylabel("log err\infty")


coef = (Logerrlistinf(1) - Logerrlistinf(end))/(Lnhlist(1) - Lnhlist(end))


